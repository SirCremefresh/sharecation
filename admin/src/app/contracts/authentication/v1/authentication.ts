// @generated by protobuf-ts 2.2.2
// @generated from protobuf file "authentication/v1/authentication.proto" (package "authentication.v1", syntax proto3)
// tslint:disable
import type { BinaryWriteOptions } from "@protobuf-ts/runtime";
import type { IBinaryWriter } from "@protobuf-ts/runtime";
import { WireType } from "@protobuf-ts/runtime";
import type { BinaryReadOptions } from "@protobuf-ts/runtime";
import type { IBinaryReader } from "@protobuf-ts/runtime";
import { UnknownFieldHandler } from "@protobuf-ts/runtime";
import type { PartialMessage } from "@protobuf-ts/runtime";
import { reflectionMergePartial } from "@protobuf-ts/runtime";
import { MESSAGE_TYPE } from "@protobuf-ts/runtime";
import { MessageType } from "@protobuf-ts/runtime";
import { BasicError } from "../../errors/v1/errors";
/**
 * @generated from protobuf message authentication.v1.AuthenticatedData
 */
export interface AuthenticatedData {
    /**
     * @generated from protobuf field: string sub = 1;
     */
    sub: string;
    /**
     * @generated from protobuf field: int32 exp = 2;
     */
    exp: number;
}
/**
 * @generated from protobuf message authentication.v1.Authenticated
 */
export interface Authenticated {
    /**
     * @generated from protobuf field: string jwt_string = 1;
     */
    jwtString: string;
    /**
     * @generated from protobuf field: authentication.v1.AuthenticatedData data = 2;
     */
    data?: AuthenticatedData;
}
/**
 * @generated from protobuf message authentication.v1.CreateAuthenticationWithFirebaseRequest
 */
export interface CreateAuthenticationWithFirebaseRequest {
    /**
     * @generated from protobuf field: string firebase_jwt_string = 1;
     */
    firebaseJwtString: string;
}
/**
 * @generated from protobuf message authentication.v1.CreateAuthenticationWithFirebaseResponse
 */
export interface CreateAuthenticationWithFirebaseResponse {
    /**
     * @generated from protobuf oneof: response
     */
    response: {
        oneofKind: "ok";
        /**
         * @generated from protobuf field: authentication.v1.Authenticated ok = 1;
         */
        ok: Authenticated;
    } | {
        oneofKind: "error";
        /**
         * @generated from protobuf field: errors.v1.BasicError error = 2;
         */
        error: BasicError;
    } | {
        oneofKind: undefined;
    };
}
// @generated message type with reflection information, may provide speed optimized methods
class AuthenticatedData$Type extends MessageType<AuthenticatedData> {
    constructor() {
        super("authentication.v1.AuthenticatedData", [
            { no: 1, name: "sub", kind: "scalar", T: 9 /*ScalarType.STRING*/ },
            { no: 2, name: "exp", kind: "scalar", T: 5 /*ScalarType.INT32*/ }
        ]);
    }
    create(value?: PartialMessage<AuthenticatedData>): AuthenticatedData {
        const message = { sub: "", exp: 0 };
        globalThis.Object.defineProperty(message, MESSAGE_TYPE, { enumerable: false, value: this });
        if (value !== undefined)
            reflectionMergePartial<AuthenticatedData>(this, message, value);
        return message;
    }
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: AuthenticatedData): AuthenticatedData {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* string sub */ 1:
                    message.sub = reader.string();
                    break;
                case /* int32 exp */ 2:
                    message.exp = reader.int32();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message: AuthenticatedData, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter {
        /* string sub = 1; */
        if (message.sub !== "")
            writer.tag(1, WireType.LengthDelimited).string(message.sub);
        /* int32 exp = 2; */
        if (message.exp !== 0)
            writer.tag(2, WireType.Varint).int32(message.exp);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message authentication.v1.AuthenticatedData
 */
export const AuthenticatedData = new AuthenticatedData$Type();
// @generated message type with reflection information, may provide speed optimized methods
class Authenticated$Type extends MessageType<Authenticated> {
    constructor() {
        super("authentication.v1.Authenticated", [
            { no: 1, name: "jwt_string", kind: "scalar", T: 9 /*ScalarType.STRING*/ },
            { no: 2, name: "data", kind: "message", T: () => AuthenticatedData }
        ]);
    }
    create(value?: PartialMessage<Authenticated>): Authenticated {
        const message = { jwtString: "" };
        globalThis.Object.defineProperty(message, MESSAGE_TYPE, { enumerable: false, value: this });
        if (value !== undefined)
            reflectionMergePartial<Authenticated>(this, message, value);
        return message;
    }
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: Authenticated): Authenticated {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* string jwt_string */ 1:
                    message.jwtString = reader.string();
                    break;
                case /* authentication.v1.AuthenticatedData data */ 2:
                    message.data = AuthenticatedData.internalBinaryRead(reader, reader.uint32(), options, message.data);
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message: Authenticated, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter {
        /* string jwt_string = 1; */
        if (message.jwtString !== "")
            writer.tag(1, WireType.LengthDelimited).string(message.jwtString);
        /* authentication.v1.AuthenticatedData data = 2; */
        if (message.data)
            AuthenticatedData.internalBinaryWrite(message.data, writer.tag(2, WireType.LengthDelimited).fork(), options).join();
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message authentication.v1.Authenticated
 */
export const Authenticated = new Authenticated$Type();
// @generated message type with reflection information, may provide speed optimized methods
class CreateAuthenticationWithFirebaseRequest$Type extends MessageType<CreateAuthenticationWithFirebaseRequest> {
    constructor() {
        super("authentication.v1.CreateAuthenticationWithFirebaseRequest", [
            { no: 1, name: "firebase_jwt_string", kind: "scalar", T: 9 /*ScalarType.STRING*/ }
        ]);
    }
    create(value?: PartialMessage<CreateAuthenticationWithFirebaseRequest>): CreateAuthenticationWithFirebaseRequest {
        const message = { firebaseJwtString: "" };
        globalThis.Object.defineProperty(message, MESSAGE_TYPE, { enumerable: false, value: this });
        if (value !== undefined)
            reflectionMergePartial<CreateAuthenticationWithFirebaseRequest>(this, message, value);
        return message;
    }
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: CreateAuthenticationWithFirebaseRequest): CreateAuthenticationWithFirebaseRequest {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* string firebase_jwt_string */ 1:
                    message.firebaseJwtString = reader.string();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message: CreateAuthenticationWithFirebaseRequest, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter {
        /* string firebase_jwt_string = 1; */
        if (message.firebaseJwtString !== "")
            writer.tag(1, WireType.LengthDelimited).string(message.firebaseJwtString);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message authentication.v1.CreateAuthenticationWithFirebaseRequest
 */
export const CreateAuthenticationWithFirebaseRequest = new CreateAuthenticationWithFirebaseRequest$Type();
// @generated message type with reflection information, may provide speed optimized methods
class CreateAuthenticationWithFirebaseResponse$Type extends MessageType<CreateAuthenticationWithFirebaseResponse> {
    constructor() {
        super("authentication.v1.CreateAuthenticationWithFirebaseResponse", [
            { no: 1, name: "ok", kind: "message", oneof: "response", T: () => Authenticated },
            { no: 2, name: "error", kind: "message", oneof: "response", T: () => BasicError }
        ]);
    }
    create(value?: PartialMessage<CreateAuthenticationWithFirebaseResponse>): CreateAuthenticationWithFirebaseResponse {
        const message = { response: { oneofKind: undefined } };
        globalThis.Object.defineProperty(message, MESSAGE_TYPE, { enumerable: false, value: this });
        if (value !== undefined)
            reflectionMergePartial<CreateAuthenticationWithFirebaseResponse>(this, message, value);
        return message;
    }
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: CreateAuthenticationWithFirebaseResponse): CreateAuthenticationWithFirebaseResponse {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* authentication.v1.Authenticated ok */ 1:
                    message.response = {
                        oneofKind: "ok",
                        ok: Authenticated.internalBinaryRead(reader, reader.uint32(), options, (message.response as any).ok)
                    };
                    break;
                case /* errors.v1.BasicError error */ 2:
                    message.response = {
                        oneofKind: "error",
                        error: BasicError.internalBinaryRead(reader, reader.uint32(), options, (message.response as any).error)
                    };
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message: CreateAuthenticationWithFirebaseResponse, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter {
        /* authentication.v1.Authenticated ok = 1; */
        if (message.response.oneofKind === "ok")
            Authenticated.internalBinaryWrite(message.response.ok, writer.tag(1, WireType.LengthDelimited).fork(), options).join();
        /* errors.v1.BasicError error = 2; */
        if (message.response.oneofKind === "error")
            BasicError.internalBinaryWrite(message.response.error, writer.tag(2, WireType.LengthDelimited).fork(), options).join();
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message authentication.v1.CreateAuthenticationWithFirebaseResponse
 */
export const CreateAuthenticationWithFirebaseResponse = new CreateAuthenticationWithFirebaseResponse$Type();