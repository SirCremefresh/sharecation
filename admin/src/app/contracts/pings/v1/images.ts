/* eslint-disable */
import Long from "long";
import _m0 from "protobufjs/minimal";

export const protobufPackage = "pings.v1";

export interface Ping {
  pingId: string;
  message: string;
}

export interface GetPingRequest {
  pingId: string;
}

export interface GetPingResponse {
  ping: Ping | undefined;
}

function createBasePing(): Ping {
  return { pingId: "", message: "" };
}

export const Ping = {
  encode(message: Ping, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.pingId !== "") {
      writer.uint32(10).string(message.pingId);
    }
    if (message.message !== "") {
      writer.uint32(18).string(message.message);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): Ping {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBasePing();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.pingId = reader.string();
          break;
        case 2:
          message.message = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): Ping {
    return {
      pingId: isSet(object.pingId) ? String(object.pingId) : "",
      message: isSet(object.message) ? String(object.message) : "",
    };
  },

  toJSON(message: Ping): unknown {
    const obj: any = {};
    message.pingId !== undefined && (obj.pingId = message.pingId);
    message.message !== undefined && (obj.message = message.message);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<Ping>, I>>(object: I): Ping {
    const message = createBasePing();
    message.pingId = object.pingId ?? "";
    message.message = object.message ?? "";
    return message;
  },
};

function createBaseGetPingRequest(): GetPingRequest {
  return { pingId: "" };
}

export const GetPingRequest = {
  encode(
    message: GetPingRequest,
    writer: _m0.Writer = _m0.Writer.create()
  ): _m0.Writer {
    if (message.pingId !== "") {
      writer.uint32(10).string(message.pingId);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): GetPingRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseGetPingRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.pingId = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): GetPingRequest {
    return {
      pingId: isSet(object.pingId) ? String(object.pingId) : "",
    };
  },

  toJSON(message: GetPingRequest): unknown {
    const obj: any = {};
    message.pingId !== undefined && (obj.pingId = message.pingId);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<GetPingRequest>, I>>(
    object: I
  ): GetPingRequest {
    const message = createBaseGetPingRequest();
    message.pingId = object.pingId ?? "";
    return message;
  },
};

function createBaseGetPingResponse(): GetPingResponse {
  return { ping: undefined };
}

export const GetPingResponse = {
  encode(
    message: GetPingResponse,
    writer: _m0.Writer = _m0.Writer.create()
  ): _m0.Writer {
    if (message.ping !== undefined) {
      Ping.encode(message.ping, writer.uint32(10).fork()).ldelim();
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): GetPingResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseGetPingResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.ping = Ping.decode(reader, reader.uint32());
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): GetPingResponse {
    return {
      ping: isSet(object.ping) ? Ping.fromJSON(object.ping) : undefined,
    };
  },

  toJSON(message: GetPingResponse): unknown {
    const obj: any = {};
    message.ping !== undefined &&
      (obj.ping = message.ping ? Ping.toJSON(message.ping) : undefined);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<GetPingResponse>, I>>(
    object: I
  ): GetPingResponse {
    const message = createBaseGetPingResponse();
    message.ping =
      object.ping !== undefined && object.ping !== null
        ? Ping.fromPartial(object.ping)
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
