/* eslint-disable */
import Long from "long";
import _m0 from "protobufjs/minimal";

export const protobufPackage = "groups.v1";

export interface Group {
  groupId: string;
  name: string;
}

export interface GetPetRequest {
  petId: string;
}

export interface GetPetResponse {
  pet: Group | undefined;
}

function createBaseGroup(): Group {
  return { groupId: "", name: "" };
}

export const Group = {
  encode(message: Group, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.groupId !== "") {
      writer.uint32(10).string(message.groupId);
    }
    if (message.name !== "") {
      writer.uint32(18).string(message.name);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): Group {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseGroup();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.groupId = reader.string();
          break;
        case 2:
          message.name = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): Group {
    return {
      groupId: isSet(object.groupId) ? String(object.groupId) : "",
      name: isSet(object.name) ? String(object.name) : "",
    };
  },

  toJSON(message: Group): unknown {
    const obj: any = {};
    message.groupId !== undefined && (obj.groupId = message.groupId);
    message.name !== undefined && (obj.name = message.name);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<Group>, I>>(object: I): Group {
    const message = createBaseGroup();
    message.groupId = object.groupId ?? "";
    message.name = object.name ?? "";
    return message;
  },
};

function createBaseGetPetRequest(): GetPetRequest {
  return { petId: "" };
}

export const GetPetRequest = {
  encode(
    message: GetPetRequest,
    writer: _m0.Writer = _m0.Writer.create()
  ): _m0.Writer {
    if (message.petId !== "") {
      writer.uint32(10).string(message.petId);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): GetPetRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseGetPetRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.petId = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): GetPetRequest {
    return {
      petId: isSet(object.petId) ? String(object.petId) : "",
    };
  },

  toJSON(message: GetPetRequest): unknown {
    const obj: any = {};
    message.petId !== undefined && (obj.petId = message.petId);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<GetPetRequest>, I>>(
    object: I
  ): GetPetRequest {
    const message = createBaseGetPetRequest();
    message.petId = object.petId ?? "";
    return message;
  },
};

function createBaseGetPetResponse(): GetPetResponse {
  return { pet: undefined };
}

export const GetPetResponse = {
  encode(
    message: GetPetResponse,
    writer: _m0.Writer = _m0.Writer.create()
  ): _m0.Writer {
    if (message.pet !== undefined) {
      Group.encode(message.pet, writer.uint32(10).fork()).ldelim();
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): GetPetResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseGetPetResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.pet = Group.decode(reader, reader.uint32());
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): GetPetResponse {
    return {
      pet: isSet(object.pet) ? Group.fromJSON(object.pet) : undefined,
    };
  },

  toJSON(message: GetPetResponse): unknown {
    const obj: any = {};
    message.pet !== undefined &&
      (obj.pet = message.pet ? Group.toJSON(message.pet) : undefined);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<GetPetResponse>, I>>(
    object: I
  ): GetPetResponse {
    const message = createBaseGetPetResponse();
    message.pet =
      object.pet !== undefined && object.pet !== null
        ? Group.fromPartial(object.pet)
        : undefined;
    return message;
  },
};

type Builtin =
  | Date
  | Function
  | Uint8Array
  | string
  | number
  | boolean
  | undefined;

export type DeepPartial<T> = T extends Builtin
  ? T
  : T extends Array<infer U>
  ? Array<DeepPartial<U>>
  : T extends ReadonlyArray<infer U>
  ? ReadonlyArray<DeepPartial<U>>
  : T extends {}
  ? { [K in keyof T]?: DeepPartial<T[K]> }
  : Partial<T>;

type KeysOfUnion<T> = T extends T ? keyof T : never;
export type Exact<P, I extends P> = P extends Builtin
  ? P
  : P & { [K in keyof P]: Exact<P[K], I[K]> } & Record<
        Exclude<keyof I, KeysOfUnion<P>>,
        never
      >;

if (_m0.util.Long !== Long) {
  _m0.util.Long = Long as any;
  _m0.configure();
}

function isSet(value: any): boolean {
  return value !== null && value !== undefined;
}
