import { BasicError_BasicErrorCode } from '../../contracts/errors/v1/errors';
import {
  CreateImageResponse,
  GetImagesByGroupIdRequest,
  GetImagesByGroupIdResponse,
  Image,
  Images,
} from '../../contracts/images/v1/images';
import { isNotNullOrUndefined } from '../../lib/lib';
import { addAuthenticationGuard } from '../../lib/middleware/authenticated-middleware';
import { LoggerContext } from '../../lib/middleware/context';
import {
  createProtoBufBasicErrorResponse,
  createProtoBufOkResponse,
  protoBuf,
} from '../../lib/middleware/protobuf-middleware';
import { addRouter, route } from '../../lib/middleware/router-middleware';
import { getRoles, hasRole, ROLES } from '../../lib/roles';
import { onFetch } from '../../lib/starter/on-fetch';
import { IMAGES_KV } from './images-kv';

interface EnvironmentVariables {
  LOKI_SECRET: string;
  ENVIRONMENT: string;
  SHARECATION_IMAGES_ACCOUNT_TOKEN: string;
  PUBLIC_KEYS: string;
  COMMON: KVNamespace;
  IMAGES: KVNamespace;
}

export interface Result {
  id: string;
  filename: string;
  uploaded: Date;
  requireSignedURLs: boolean;
  variants: string[];
}

export interface UploadImageResponse {
  result: Result;
  result_info?: unknown;
  success: boolean;
  errors: unknown[];
  messages: unknown[];
}

function isImageMetadata(metadata: any): metadata is { imageId: string } {
  return isNotNullOrUndefined(metadata) && metadata.hasOwnProperty('imageId');
}

async function uploadFile(
  file: File,
  accountToken: string,
  context: LoggerContext,
): Promise<UploadImageResponse> {
  context.logger.info(
    `Uploading image with filename ${file.name} and size ${file.size}`,
  );

  const body = new FormData();
  body.append('file', file);
  return await fetch(
    'https://api.cloudflare.com/client/v4/accounts/8abcdde3abdbcc6cac82cc66c24c2c03/images/v1',
    {
      body,
      headers: {
        Authorization: `Bearer ${accountToken}`,
      },
      method: 'POST',
    },
  ).then((res) => res.json<UploadImageResponse>());
}

function getUrlFromImageId(imageId: string) {
  return `https://imagedelivery.net/lBSTOnVnm_g3jeLWNwAYiA/${imageId}/preview`;
}

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<EnvironmentVariables>(
    'images',
    addAuthenticationGuard(
      addRouter([
        route(
          'POST',
          ['v1', 'get-images-by-group-id'],
          protoBuf(
            GetImagesByGroupIdRequest,
            GetImagesByGroupIdResponse,
            async (request, env, context) => {
              const groupId = context.proto.body.groupId;
              if (!hasRole(ROLES.GROUP_MEMBER(groupId), context)) {
                context.logger.info(
                  `User does not have permission to access group with groupId=${groupId}`,
                );
                return createProtoBufBasicErrorResponse(
                  'Does not have role',
                  BasicError_BasicErrorCode.UNAUTHENTICATED,
                );
              }
              const results = await env.IMAGES.list<{
                imageId: string;
                externalId: string;
              }>({
                prefix: IMAGES_KV.IMAGES_GROUP(groupId),
                cursor: context.proto.body.cursor,
              });
              const images = [];
              for (const key of results.keys) {
                const metadata = key.metadata;
                if (!isImageMetadata(metadata)) {
                  context.logger.error(
                    `Invalid metadata for image ${key.name}`,
                  );
                  return createProtoBufBasicErrorResponse(
                    'Could not fetch images',
                    BasicError_BasicErrorCode.INTERNAL,
                  );
                }
                images.push({
                  imageId: metadata.imageId,
                  externalId: metadata.externalId,
                  url: getUrlFromImageId(metadata.imageId),
                });
              }

              return createProtoBufOkResponse<Images>({
                images,
                cursor: results.cursor,
              });
            },
          ),
        ),
        route(
          'POST',
          ['v1', 'create-image'],
          protoBuf(null, CreateImageResponse, async (request, env, context) => {
            const formData = await request.formData();
            const groupId = formData.get('groupId');
            const externalId = formData.get('externalId');

            context.logger.info(`Uploading image to groupId=${groupId}`);
            if (typeof groupId !== 'string') {
              context.logger.error(
                `User tried to upload photo to group without groupId. groupId=${groupId}`,
              );
              return createProtoBufBasicErrorResponse(
                'No groupId provided',
                BasicError_BasicErrorCode.BAD_REQUEST,
              );
            }
            if (typeof externalId !== 'string') {
              context.logger.error(
                `User tried to upload photo to group without externalId. groupId=${groupId}`,
              );
              return createProtoBufBasicErrorResponse(
                'No externalId provided',
                BasicError_BasicErrorCode.BAD_REQUEST,
              );
            }
            const role = ROLES.GROUP_MEMBER(groupId);
            if (!hasRole(role, context)) {
              context.logger.error(
                `User tried to upload photo to group without requiredRole=${role}. groupId=${groupId}, roles=${getRoles(
                  context,
                )}`,
              );
              return createProtoBufBasicErrorResponse(
                'UNAUTHENTICATED',
                BasicError_BasicErrorCode.UNAUTHENTICATED,
              );
            }

            const file = formData.get('file');
            if (!(file instanceof File)) {
              return createProtoBufBasicErrorResponse(
                'Could not get image from request',
                BasicError_BasicErrorCode.BAD_REQUEST,
              );
            }

            const res = await uploadFile(
              file,
              env.SHARECATION_IMAGES_ACCOUNT_TOKEN,
              context,
            );

            if (!res.success) {
              context.logger.error(
                `Error uploading image with response=${JSON.stringify(res)}`,
              );
              return createProtoBufBasicErrorResponse(
                'Failed to upload image',
                BasicError_BasicErrorCode.INTERNAL,
              );
            }

            context.logger.info('Image uploaded successfully');

            let imageId = res.result.id;
            const imageKey = IMAGES_KV.IMAGE(
              groupId,
              new Date().toISOString(),
              imageId,
            );
            env.IMAGES.put(imageKey, JSON.stringify({ imageId, externalId }), {
              metadata: { imageId, externalId },
            });

            return createProtoBufOkResponse<Image>({
              imageId,
              externalId,
              url: getUrlFromImageId(imageId),
            });
          }),
        ),
      ]),
    ),
  ),
};
