// @generated by protobuf-ts 2.3.0
// @generated from protobuf file "images/v1/images.proto" (package "images.v1", syntax proto3)
// tslint:disable
import type { BinaryWriteOptions } from '@protobuf-ts/runtime';
import type { IBinaryWriter } from '@protobuf-ts/runtime';
import { WireType } from '@protobuf-ts/runtime';
import type { BinaryReadOptions } from '@protobuf-ts/runtime';
import type { IBinaryReader } from '@protobuf-ts/runtime';
import { UnknownFieldHandler } from '@protobuf-ts/runtime';
import type { PartialMessage } from '@protobuf-ts/runtime';
import { reflectionMergePartial } from '@protobuf-ts/runtime';
import { MESSAGE_TYPE } from '@protobuf-ts/runtime';
import { MessageType } from '@protobuf-ts/runtime';
import { BasicError } from '../../errors/v1/errors';
/**
 * @generated from protobuf message images.v1.Image
 */
export interface Image {
  /**
   * @generated from protobuf field: string image_id = 1;
   */
  imageId: string;
  /**
   * @generated from protobuf field: string external_id = 2;
   */
  externalId: string;
  /**
   * @generated from protobuf field: string url = 3;
   */
  url: string;
}
/**
 * @generated from protobuf message images.v1.Images
 */
export interface Images {
  /**
   * @generated from protobuf field: repeated images.v1.Image images = 1;
   */
  images: Image[];
  /**
   * If cursor is not null
   * More Images can be loaded
   *
   * @generated from protobuf field: optional string cursor = 2;
   */
  cursor?: string;
}
/**
 * @generated from protobuf message images.v1.GetImagesByGroupIdRequest
 */
export interface GetImagesByGroupIdRequest {
  /**
   * @generated from protobuf field: string group_id = 1;
   */
  groupId: string;
  /**
   * @generated from protobuf field: optional string cursor = 2;
   */
  cursor?: string;
}
/**
 * @generated from protobuf message images.v1.GetImagesByGroupIdResponse
 */
export interface GetImagesByGroupIdResponse {
  /**
   * @generated from protobuf oneof: response
   */
  response:
    | {
        oneofKind: 'ok';
        /**
         * @generated from protobuf field: images.v1.Images ok = 1;
         */
        ok: Images;
      }
    | {
        oneofKind: 'error';
        /**
         * @generated from protobuf field: errors.v1.BasicError error = 2;
         */
        error: BasicError;
      }
    | {
        oneofKind: undefined;
      };
}
/**
 * @generated from protobuf message images.v1.CreateImageResponse
 */
export interface CreateImageResponse {
  /**
   * @generated from protobuf oneof: response
   */
  response:
    | {
        oneofKind: 'ok';
        /**
         * @generated from protobuf field: images.v1.Image ok = 1;
         */
        ok: Image;
      }
    | {
        oneofKind: 'error';
        /**
         * @generated from protobuf field: errors.v1.BasicError error = 2;
         */
        error: BasicError;
      }
    | {
        oneofKind: undefined;
      };
}
// @generated message type with reflection information, may provide speed optimized methods
class Image$Type extends MessageType<Image> {
  constructor() {
    super('images.v1.Image', [
      { no: 1, name: 'image_id', kind: 'scalar', T: 9 /*ScalarType.STRING*/ },
      {
        no: 2,
        name: 'external_id',
        kind: 'scalar',
        T: 9 /*ScalarType.STRING*/,
      },
      { no: 3, name: 'url', kind: 'scalar', T: 9 /*ScalarType.STRING*/ },
    ]);
  }
  create(value?: PartialMessage<Image>): Image {
    const message = { imageId: '', externalId: '', url: '' };
    globalThis.Object.defineProperty(message, MESSAGE_TYPE, {
      enumerable: false,
      value: this,
    });
    if (value !== undefined)
      reflectionMergePartial<Image>(this, message, value);
    return message;
  }
  internalBinaryRead(
    reader: IBinaryReader,
    length: number,
    options: BinaryReadOptions,
    target?: Image,
  ): Image {
    let message = target ?? this.create(),
      end = reader.pos + length;
    while (reader.pos < end) {
      let [fieldNo, wireType] = reader.tag();
      switch (fieldNo) {
        case /* string image_id */ 1:
          message.imageId = reader.string();
          break;
        case /* string external_id */ 2:
          message.externalId = reader.string();
          break;
        case /* string url */ 3:
          message.url = reader.string();
          break;
        default:
          let u = options.readUnknownField;
          if (u === 'throw')
            throw new globalThis.Error(
              `Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`,
            );
          let d = reader.skip(wireType);
          if (u !== false)
            (u === true ? UnknownFieldHandler.onRead : u)(
              this.typeName,
              message,
              fieldNo,
              wireType,
              d,
            );
      }
    }
    return message;
  }
  internalBinaryWrite(
    message: Image,
    writer: IBinaryWriter,
    options: BinaryWriteOptions,
  ): IBinaryWriter {
    /* string image_id = 1; */
    if (message.imageId !== '')
      writer.tag(1, WireType.LengthDelimited).string(message.imageId);
    /* string external_id = 2; */
    if (message.externalId !== '')
      writer.tag(2, WireType.LengthDelimited).string(message.externalId);
    /* string url = 3; */
    if (message.url !== '')
      writer.tag(3, WireType.LengthDelimited).string(message.url);
    let u = options.writeUnknownFields;
    if (u !== false)
      (u == true ? UnknownFieldHandler.onWrite : u)(
        this.typeName,
        message,
        writer,
      );
    return writer;
  }
}
/**
 * @generated MessageType for protobuf message images.v1.Image
 */
export const Image = new Image$Type();
// @generated message type with reflection information, may provide speed optimized methods
class Images$Type extends MessageType<Images> {
  constructor() {
    super('images.v1.Images', [
      {
        no: 1,
        name: 'images',
        kind: 'message',
        repeat: 1 /*RepeatType.PACKED*/,
        T: () => Image,
      },
      {
        no: 2,
        name: 'cursor',
        kind: 'scalar',
        opt: true,
        T: 9 /*ScalarType.STRING*/,
      },
    ]);
  }
  create(value?: PartialMessage<Images>): Images {
    const message = { images: [] };
    globalThis.Object.defineProperty(message, MESSAGE_TYPE, {
      enumerable: false,
      value: this,
    });
    if (value !== undefined)
      reflectionMergePartial<Images>(this, message, value);
    return message;
  }
  internalBinaryRead(
    reader: IBinaryReader,
    length: number,
    options: BinaryReadOptions,
    target?: Images,
  ): Images {
    let message = target ?? this.create(),
      end = reader.pos + length;
    while (reader.pos < end) {
      let [fieldNo, wireType] = reader.tag();
      switch (fieldNo) {
        case /* repeated images.v1.Image images */ 1:
          message.images.push(
            Image.internalBinaryRead(reader, reader.uint32(), options),
          );
          break;
        case /* optional string cursor */ 2:
          message.cursor = reader.string();
          break;
        default:
          let u = options.readUnknownField;
          if (u === 'throw')
            throw new globalThis.Error(
              `Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`,
            );
          let d = reader.skip(wireType);
          if (u !== false)
            (u === true ? UnknownFieldHandler.onRead : u)(
              this.typeName,
              message,
              fieldNo,
              wireType,
              d,
            );
      }
    }
    return message;
  }
  internalBinaryWrite(
    message: Images,
    writer: IBinaryWriter,
    options: BinaryWriteOptions,
  ): IBinaryWriter {
    /* repeated images.v1.Image images = 1; */
    for (let i = 0; i < message.images.length; i++)
      Image.internalBinaryWrite(
        message.images[i],
        writer.tag(1, WireType.LengthDelimited).fork(),
        options,
      ).join();
    /* optional string cursor = 2; */
    if (message.cursor !== undefined)
      writer.tag(2, WireType.LengthDelimited).string(message.cursor);
    let u = options.writeUnknownFields;
    if (u !== false)
      (u == true ? UnknownFieldHandler.onWrite : u)(
        this.typeName,
        message,
        writer,
      );
    return writer;
  }
}
/**
 * @generated MessageType for protobuf message images.v1.Images
 */
export const Images = new Images$Type();
// @generated message type with reflection information, may provide speed optimized methods
class GetImagesByGroupIdRequest$Type extends MessageType<GetImagesByGroupIdRequest> {
  constructor() {
    super('images.v1.GetImagesByGroupIdRequest', [
      { no: 1, name: 'group_id', kind: 'scalar', T: 9 /*ScalarType.STRING*/ },
      {
        no: 2,
        name: 'cursor',
        kind: 'scalar',
        opt: true,
        T: 9 /*ScalarType.STRING*/,
      },
    ]);
  }
  create(
    value?: PartialMessage<GetImagesByGroupIdRequest>,
  ): GetImagesByGroupIdRequest {
    const message = { groupId: '' };
    globalThis.Object.defineProperty(message, MESSAGE_TYPE, {
      enumerable: false,
      value: this,
    });
    if (value !== undefined)
      reflectionMergePartial<GetImagesByGroupIdRequest>(this, message, value);
    return message;
  }
  internalBinaryRead(
    reader: IBinaryReader,
    length: number,
    options: BinaryReadOptions,
    target?: GetImagesByGroupIdRequest,
  ): GetImagesByGroupIdRequest {
    let message = target ?? this.create(),
      end = reader.pos + length;
    while (reader.pos < end) {
      let [fieldNo, wireType] = reader.tag();
      switch (fieldNo) {
        case /* string group_id */ 1:
          message.groupId = reader.string();
          break;
        case /* optional string cursor */ 2:
          message.cursor = reader.string();
          break;
        default:
          let u = options.readUnknownField;
          if (u === 'throw')
            throw new globalThis.Error(
              `Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`,
            );
          let d = reader.skip(wireType);
          if (u !== false)
            (u === true ? UnknownFieldHandler.onRead : u)(
              this.typeName,
              message,
              fieldNo,
              wireType,
              d,
            );
      }
    }
    return message;
  }
  internalBinaryWrite(
    message: GetImagesByGroupIdRequest,
    writer: IBinaryWriter,
    options: BinaryWriteOptions,
  ): IBinaryWriter {
    /* string group_id = 1; */
    if (message.groupId !== '')
      writer.tag(1, WireType.LengthDelimited).string(message.groupId);
    /* optional string cursor = 2; */
    if (message.cursor !== undefined)
      writer.tag(2, WireType.LengthDelimited).string(message.cursor);
    let u = options.writeUnknownFields;
    if (u !== false)
      (u == true ? UnknownFieldHandler.onWrite : u)(
        this.typeName,
        message,
        writer,
      );
    return writer;
  }
}
/**
 * @generated MessageType for protobuf message images.v1.GetImagesByGroupIdRequest
 */
export const GetImagesByGroupIdRequest = new GetImagesByGroupIdRequest$Type();
// @generated message type with reflection information, may provide speed optimized methods
class GetImagesByGroupIdResponse$Type extends MessageType<GetImagesByGroupIdResponse> {
  constructor() {
    super('images.v1.GetImagesByGroupIdResponse', [
      {
        no: 1,
        name: 'ok',
        kind: 'message',
        oneof: 'response',
        T: () => Images,
      },
      {
        no: 2,
        name: 'error',
        kind: 'message',
        oneof: 'response',
        T: () => BasicError,
      },
    ]);
  }
  create(
    value?: PartialMessage<GetImagesByGroupIdResponse>,
  ): GetImagesByGroupIdResponse {
    const message = { response: { oneofKind: undefined } };
    globalThis.Object.defineProperty(message, MESSAGE_TYPE, {
      enumerable: false,
      value: this,
    });
    if (value !== undefined)
      reflectionMergePartial<GetImagesByGroupIdResponse>(this, message, value);
    return message;
  }
  internalBinaryRead(
    reader: IBinaryReader,
    length: number,
    options: BinaryReadOptions,
    target?: GetImagesByGroupIdResponse,
  ): GetImagesByGroupIdResponse {
    let message = target ?? this.create(),
      end = reader.pos + length;
    while (reader.pos < end) {
      let [fieldNo, wireType] = reader.tag();
      switch (fieldNo) {
        case /* images.v1.Images ok */ 1:
          message.response = {
            oneofKind: 'ok',
            ok: Images.internalBinaryRead(
              reader,
              reader.uint32(),
              options,
              (message.response as any).ok,
            ),
          };
          break;
        case /* errors.v1.BasicError error */ 2:
          message.response = {
            oneofKind: 'error',
            error: BasicError.internalBinaryRead(
              reader,
              reader.uint32(),
              options,
              (message.response as any).error,
            ),
          };
          break;
        default:
          let u = options.readUnknownField;
          if (u === 'throw')
            throw new globalThis.Error(
              `Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`,
            );
          let d = reader.skip(wireType);
          if (u !== false)
            (u === true ? UnknownFieldHandler.onRead : u)(
              this.typeName,
              message,
              fieldNo,
              wireType,
              d,
            );
      }
    }
    return message;
  }
  internalBinaryWrite(
    message: GetImagesByGroupIdResponse,
    writer: IBinaryWriter,
    options: BinaryWriteOptions,
  ): IBinaryWriter {
    /* images.v1.Images ok = 1; */
    if (message.response.oneofKind === 'ok')
      Images.internalBinaryWrite(
        message.response.ok,
        writer.tag(1, WireType.LengthDelimited).fork(),
        options,
      ).join();
    /* errors.v1.BasicError error = 2; */
    if (message.response.oneofKind === 'error')
      BasicError.internalBinaryWrite(
        message.response.error,
        writer.tag(2, WireType.LengthDelimited).fork(),
        options,
      ).join();
    let u = options.writeUnknownFields;
    if (u !== false)
      (u == true ? UnknownFieldHandler.onWrite : u)(
        this.typeName,
        message,
        writer,
      );
    return writer;
  }
}
/**
 * @generated MessageType for protobuf message images.v1.GetImagesByGroupIdResponse
 */
export const GetImagesByGroupIdResponse = new GetImagesByGroupIdResponse$Type();
// @generated message type with reflection information, may provide speed optimized methods
class CreateImageResponse$Type extends MessageType<CreateImageResponse> {
  constructor() {
    super('images.v1.CreateImageResponse', [
      { no: 1, name: 'ok', kind: 'message', oneof: 'response', T: () => Image },
      {
        no: 2,
        name: 'error',
        kind: 'message',
        oneof: 'response',
        T: () => BasicError,
      },
    ]);
  }
  create(value?: PartialMessage<CreateImageResponse>): CreateImageResponse {
    const message = { response: { oneofKind: undefined } };
    globalThis.Object.defineProperty(message, MESSAGE_TYPE, {
      enumerable: false,
      value: this,
    });
    if (value !== undefined)
      reflectionMergePartial<CreateImageResponse>(this, message, value);
    return message;
  }
  internalBinaryRead(
    reader: IBinaryReader,
    length: number,
    options: BinaryReadOptions,
    target?: CreateImageResponse,
  ): CreateImageResponse {
    let message = target ?? this.create(),
      end = reader.pos + length;
    while (reader.pos < end) {
      let [fieldNo, wireType] = reader.tag();
      switch (fieldNo) {
        case /* images.v1.Image ok */ 1:
          message.response = {
            oneofKind: 'ok',
            ok: Image.internalBinaryRead(
              reader,
              reader.uint32(),
              options,
              (message.response as any).ok,
            ),
          };
          break;
        case /* errors.v1.BasicError error */ 2:
          message.response = {
            oneofKind: 'error',
            error: BasicError.internalBinaryRead(
              reader,
              reader.uint32(),
              options,
              (message.response as any).error,
            ),
          };
          break;
        default:
          let u = options.readUnknownField;
          if (u === 'throw')
            throw new globalThis.Error(
              `Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`,
            );
          let d = reader.skip(wireType);
          if (u !== false)
            (u === true ? UnknownFieldHandler.onRead : u)(
              this.typeName,
              message,
              fieldNo,
              wireType,
              d,
            );
      }
    }
    return message;
  }
  internalBinaryWrite(
    message: CreateImageResponse,
    writer: IBinaryWriter,
    options: BinaryWriteOptions,
  ): IBinaryWriter {
    /* images.v1.Image ok = 1; */
    if (message.response.oneofKind === 'ok')
      Image.internalBinaryWrite(
        message.response.ok,
        writer.tag(1, WireType.LengthDelimited).fork(),
        options,
      ).join();
    /* errors.v1.BasicError error = 2; */
    if (message.response.oneofKind === 'error')
      BasicError.internalBinaryWrite(
        message.response.error,
        writer.tag(2, WireType.LengthDelimited).fork(),
        options,
      ).join();
    let u = options.writeUnknownFields;
    if (u !== false)
      (u == true ? UnknownFieldHandler.onWrite : u)(
        this.typeName,
        message,
        writer,
      );
    return writer;
  }
}
/**
 * @generated MessageType for protobuf message images.v1.CreateImageResponse
 */
export const CreateImageResponse = new CreateImageResponse$Type();
