import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {CreateImageResponse, Image} from '../../contracts/images/v1/images';
import {createBasicErrorResponse} from '../../lib/http/response';
import {isNotNullOrUndefined, responseOk,} from '../../lib/lib';
import {addAuthenticationGuard} from '../../lib/middleware/authenticated-middleware';
import {LoggerContext} from '../../lib/middleware/context';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';
import {
  createProtoBufBasicErrorResponse,
  createProtoBufOkResponse,
  protoBuf
} from '../../lib/middleware/protobuf-middleware';
import {addRequestId} from '../../lib/middleware/request-id-middleware';
import {addRouter, pathParam, route,} from '../../lib/middleware/router-middleware';
import {getRights, hasRight, RIGHTS} from '../../lib/rights';
import {IMAGES_KV} from './images-kv';

interface EnvironmentVariables {
  LOKI_SECRET: string;
  ENVIRONMENT: string;
  SHARECATION_IMAGES_ACCOUNT_TOKEN: string;
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
  ).then(res => res.json<UploadImageResponse>());
}

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: addLoggerContext<EnvironmentVariables, Request, FetchEvent, Response>(
    'images',
    addRequestId(
      addAuthenticationGuard(
        addRouter([
          route(
            'GET',
            ['v1', 'images', pathParam('groupId')],
            async (request, env, context) => {
              const results = await env.IMAGES.list<{ imageId: string }>({
                prefix: IMAGES_KV.IMAGES_USER(context.user.userId),
              });
              const imageUrls = [];
              for (const key of results.keys) {
                const metadata = key.metadata;
                if (!isImageMetadata(metadata)) {
                  context.logger.error(
                    `Invalid metadata for image ${key.name}`,
                  );
                  return createBasicErrorResponse({
                    message: 'Could not fetch images',
                    code: BasicError_BasicErrorCode.INTERNAL
                  }, context);
                }
                imageUrls.push(
                  `https://imagedelivery.net/lBSTOnVnm_g3jeLWNwAYiA/${metadata.imageId}/preview`,
                );
              }

              return responseOk(JSON.stringify({
                imageUrls,
                group: context.route.params.groupId,
              }));
            },
          ),
          route(
            'POST',
            ['v1', 'images', pathParam('groupId')],
            protoBuf(null, CreateImageResponse,
              async (request, env, context) => {
                const groupId = context.route.params.groupId;
                if (!hasRight(RIGHTS.GROUP(groupId), context)) {
                  context.logger.error(`User tried to upload photo to group without rights. groupId=${groupId}, rights=${getRights(context)}`);
                  return createProtoBufBasicErrorResponse('UNAUTHENTICATED', BasicError_BasicErrorCode.UNAUTHENTICATED);
                }
                const formData = await request.formData();
                const file = formData.get('file');

                if (!(file instanceof File)) {
                  return createProtoBufBasicErrorResponse('Could not get image from request', BasicError_BasicErrorCode.BAD_REQUEST);
                }

                const res = await uploadFile(
                  file,
                  env.SHARECATION_IMAGES_ACCOUNT_TOKEN,
                  context,
                );

                if (!res.success) {
                  context.logger.error(
                    `Error uploading image with response: ${JSON.stringify(res)}`,
                  );
                  return createProtoBufBasicErrorResponse('Failed to upload image', BasicError_BasicErrorCode.INTERNAL);
                }

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
                  type: file.type
                });
              },
            ),
          )
        ]),
      ),
    ),
  ),
};
