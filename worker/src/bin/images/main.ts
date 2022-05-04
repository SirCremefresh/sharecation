import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {
  CreateImageResponse,
  GetImagesByGroupIdRequest,
  GetImagesByGroupIdResponse,
  Image,
  Images,
} from '../../contracts/images/v1/images';
import {isNotNullOrUndefined} from '../../lib/lib';
import {addAuthenticationGuard} from '../../lib/middleware/authenticated-middleware';
import {LoggerContext} from '../../lib/middleware/context';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';
import {
  createProtoBufBasicErrorResponse,
  createProtoBufOkResponse,
  protoBuf,
} from '../../lib/middleware/protobuf-middleware';
import {addRouter, route} from '../../lib/middleware/router-middleware';
import {getRoles} from '../../lib/roles';
import {IMAGES_KV} from './images-kv';

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

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: addLoggerContext<EnvironmentVariables, Request, FetchEvent, Response>(
    'images',
    addAuthenticationGuard(
      addRouter([
        route(
          'POST',
          ['v1', 'images', 'get-images-by-group-id'],
          protoBuf(
            GetImagesByGroupIdRequest,
            GetImagesByGroupIdResponse,
            async (request, env, context) => {
              const results = await env.IMAGES.list<{ imageId: string }>({
                prefix: IMAGES_KV.IMAGES_USER(context.user.userId),
                cursor: context.proto.body.cursor,
              });
              const imageUrls = [];
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
                imageUrls.push(
                  `https://imagedelivery.net/lBSTOnVnm_g3jeLWNwAYiA/${metadata.imageId}/preview`,
                );
              }

              return createProtoBufOkResponse<Images>({
                images: imageUrls.map((url) => ({
                  imageId: url,
                  type: '',
                })),
                cursor: results.cursor,
              });
            },
          ),
        ),
        route(
          'POST',
          ['v1', 'images', 'create-image'],
          protoBuf(
            null,
            CreateImageResponse,
            async (request, env, context) => {
              const formData = await request.formData();
              const groupId = formData.get('groupId');

              context.logger.info(
                `Uploading image to groupId=${groupId}`,
              );
              if (typeof groupId !== 'string') {
                context.logger.error(
                  `User tried to upload photo to group without roles. groupId=${groupId}, roles=${getRoles(
                    context,
                  )}`,
                );
                return createProtoBufBasicErrorResponse(
                  'No groupId provided',
                  BasicError_BasicErrorCode.BAD_REQUEST,
                );
              }
              // if (!hasRole(ROLES.GROUP(groupId), context)) {
              //   context.logger.error(`User tried to upload photo to group without roles. groupId=${groupId}, roles=${getRoles(context)}`);
              //   return createProtoBufBasicErrorResponse('UNAUTHENTICATED', BasicError_BasicErrorCode.UNAUTHENTICATED);
              // }

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
                  `Error uploading image with response=${JSON.stringify(
                    res,
                  )}`,
                );
                return createProtoBufBasicErrorResponse(
                  'Failed to upload image',
                  BasicError_BasicErrorCode.INTERNAL,
                );
              }

              context.logger.info('Image uploaded successfully');

              const imageKey = IMAGES_KV.IMAGE(
                context.user.userId,
                new Date().toISOString(),
                res.result.id,
              );
              env.IMAGES.put(
                imageKey,
                JSON.stringify({imageId: res.result.id}),
                {
                  metadata: {imageId: res.result.id},
                },
              );

              return createProtoBufOkResponse<Image>({
                imageId: res.result.id,
                type: file.type,
              });
            },
          ),
        ),
      ]),
    ),
  ),
};
