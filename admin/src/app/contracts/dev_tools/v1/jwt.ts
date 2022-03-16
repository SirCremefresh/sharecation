// @generated by protobuf-ts 2.2.2
// @generated from protobuf file "dev_tools/v1/jwt.proto" (package "dev_tools.v1", syntax proto3)
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
 * @generated from protobuf message dev_tools.v1.User
 */
export interface User {
    /**
     * @generated from protobuf field: string user_id = 1;
     */
    userId: string;
    /**
     * @generated from protobuf field: string jwt_string = 2;
     */
    jwtString: string;
}
/**
 * @generated from protobuf message dev_tools.v1.CreateUserRequest
 */
export interface CreateUserRequest {
    /**
     * @generated from protobuf field: repeated string rights = 1;
     */
    rights: string[];
}
/**
 * @generated from protobuf message dev_tools.v1.CreateUserResponse
 */
export interface CreateUserResponse {
    /**
     * @generated from protobuf oneof: response
     */
    response: {
        oneofKind: "ok";
        /**
         * @generated from protobuf field: dev_tools.v1.User ok = 1;
         */
        ok: User;
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
class User$Type extends MessageType<User> {
    constructor() {
        super("dev_tools.v1.User", [
            { no: 1, name: "user_id", kind: "scalar", T: 9 /*ScalarType.STRING*/ },
            { no: 2, name: "jwt_string", kind: "scalar", T: 9 /*ScalarType.STRING*/ }
        ]);
    }
    create(value?: PartialMessage<User>): User {
        const message = { userId: "", jwtString: "" };
        globalThis.Object.defineProperty(message, MESSAGE_TYPE, { enumerable: false, value: this });
        if (value !== undefined)
            reflectionMergePartial<User>(this, message, value);
        return message;
    }
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: User): User {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* string user_id */ 1:
                    message.userId = reader.string();
                    break;
                case /* string jwt_string */ 2:
                    message.jwtString = reader.string();
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
    internalBinaryWrite(message: User, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter {
        /* string user_id = 1; */
        if (message.userId !== "")
            writer.tag(1, WireType.LengthDelimited).string(message.userId);
        /* string jwt_string = 2; */
        if (message.jwtString !== "")
            writer.tag(2, WireType.LengthDelimited).string(message.jwtString);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message dev_tools.v1.User
 */
export const User = new User$Type();
// @generated message type with reflection information, may provide speed optimized methods
class CreateUserRequest$Type extends MessageType<CreateUserRequest> {
    constructor() {
        super("dev_tools.v1.CreateUserRequest", [
            { no: 1, name: "rights", kind: "scalar", repeat: 2 /*RepeatType.UNPACKED*/, T: 9 /*ScalarType.STRING*/ }
        ]);
    }
    create(value?: PartialMessage<CreateUserRequest>): CreateUserRequest {
        const message = { rights: [] };
        globalThis.Object.defineProperty(message, MESSAGE_TYPE, { enumerable: false, value: this });
        if (value !== undefined)
            reflectionMergePartial<CreateUserRequest>(this, message, value);
        return message;
    }
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: CreateUserRequest): CreateUserRequest {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* repeated string rights */ 1:
                    message.rights.push(reader.string());
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
    internalBinaryWrite(message: CreateUserRequest, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter {
        /* repeated string rights = 1; */
        for (let i = 0; i < message.rights.length; i++)
            writer.tag(1, WireType.LengthDelimited).string(message.rights[i]);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message dev_tools.v1.CreateUserRequest
 */
export const CreateUserRequest = new CreateUserRequest$Type();
// @generated message type with reflection information, may provide speed optimized methods
class CreateUserResponse$Type extends MessageType<CreateUserResponse> {
    constructor() {
        super("dev_tools.v1.CreateUserResponse", [
            { no: 1, name: "ok", kind: "message", oneof: "response", T: () => User },
            { no: 2, name: "error", kind: "message", oneof: "response", T: () => BasicError }
        ]);
    }
    create(value?: PartialMessage<CreateUserResponse>): CreateUserResponse {
        const message = { response: { oneofKind: undefined } };
        globalThis.Object.defineProperty(message, MESSAGE_TYPE, { enumerable: false, value: this });
        if (value !== undefined)
            reflectionMergePartial<CreateUserResponse>(this, message, value);
        return message;
    }
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: CreateUserResponse): CreateUserResponse {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* dev_tools.v1.User ok */ 1:
                    message.response = {
                        oneofKind: "ok",
                        ok: User.internalBinaryRead(reader, reader.uint32(), options, (message.response as any).ok)
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
    internalBinaryWrite(message: CreateUserResponse, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter {
        /* dev_tools.v1.User ok = 1; */
        if (message.response.oneofKind === "ok")
            User.internalBinaryWrite(message.response.ok, writer.tag(1, WireType.LengthDelimited).fork(), options).join();
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
 * @generated MessageType for protobuf message dev_tools.v1.CreateUserResponse
 */
export const CreateUserResponse = new CreateUserResponse$Type();
