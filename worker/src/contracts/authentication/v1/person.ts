// @generated by protobuf-ts 2.3.0
// @generated from protobuf file "authentication/v1/person.proto" (package "authentication.v1", syntax proto3)
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
 * @generated from protobuf message authentication.v1.Person
 */
export interface Person {
    /**
     * @generated from protobuf field: string user_id = 1;
     */
    userId: string;
    /**
     * @generated from protobuf field: string firstname = 2;
     */
    firstname: string;
    /**
     * @generated from protobuf field: string lastname = 3;
     */
    lastname: string;
}
/**
 * @generated from protobuf message authentication.v1.UpsertPersonRequest
 */
export interface UpsertPersonRequest {
    /**
     * @generated from protobuf field: string firstname = 1;
     */
    firstname: string;
    /**
     * @generated from protobuf field: string lastname = 2;
     */
    lastname: string;
}
/**
 * @generated from protobuf message authentication.v1.UpsertPersonResponse
 */
export interface UpsertPersonResponse {
    /**
     * @generated from protobuf oneof: response
     */
    response: {
        oneofKind: "ok";
        /**
         * @generated from protobuf field: authentication.v1.Person ok = 1;
         */
        ok: Person;
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
/**
 * @generated from protobuf message authentication.v1.GetPersonOfUserRequest
 */
export interface GetPersonOfUserRequest {
    /**
     * @generated from protobuf field: string user_id = 1;
     */
    userId: string;
}
/**
 * @generated from protobuf message authentication.v1.GetPersonOfUserResponse
 */
export interface GetPersonOfUserResponse {
    /**
     * @generated from protobuf oneof: response
     */
    response: {
        oneofKind: "ok";
        /**
         * @generated from protobuf field: authentication.v1.Person ok = 1;
         */
        ok: Person;
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
class Person$Type extends MessageType<Person> {
    constructor() {
        super("authentication.v1.Person", [
            { no: 1, name: "user_id", kind: "scalar", T: 9 /*ScalarType.STRING*/ },
            { no: 2, name: "firstname", kind: "scalar", T: 9 /*ScalarType.STRING*/ },
            { no: 3, name: "lastname", kind: "scalar", T: 9 /*ScalarType.STRING*/ }
        ]);
    }
    create(value?: PartialMessage<Person>): Person {
        const message = { userId: "", firstname: "", lastname: "" };
        globalThis.Object.defineProperty(message, MESSAGE_TYPE, { enumerable: false, value: this });
        if (value !== undefined)
            reflectionMergePartial<Person>(this, message, value);
        return message;
    }
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: Person): Person {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* string user_id */ 1:
                    message.userId = reader.string();
                    break;
                case /* string firstname */ 2:
                    message.firstname = reader.string();
                    break;
                case /* string lastname */ 3:
                    message.lastname = reader.string();
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
    internalBinaryWrite(message: Person, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter {
        /* string user_id = 1; */
        if (message.userId !== "")
            writer.tag(1, WireType.LengthDelimited).string(message.userId);
        /* string firstname = 2; */
        if (message.firstname !== "")
            writer.tag(2, WireType.LengthDelimited).string(message.firstname);
        /* string lastname = 3; */
        if (message.lastname !== "")
            writer.tag(3, WireType.LengthDelimited).string(message.lastname);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message authentication.v1.Person
 */
export const Person = new Person$Type();
// @generated message type with reflection information, may provide speed optimized methods
class UpsertPersonRequest$Type extends MessageType<UpsertPersonRequest> {
    constructor() {
        super("authentication.v1.UpsertPersonRequest", [
            { no: 1, name: "firstname", kind: "scalar", T: 9 /*ScalarType.STRING*/ },
            { no: 2, name: "lastname", kind: "scalar", T: 9 /*ScalarType.STRING*/ }
        ]);
    }
    create(value?: PartialMessage<UpsertPersonRequest>): UpsertPersonRequest {
        const message = { firstname: "", lastname: "" };
        globalThis.Object.defineProperty(message, MESSAGE_TYPE, { enumerable: false, value: this });
        if (value !== undefined)
            reflectionMergePartial<UpsertPersonRequest>(this, message, value);
        return message;
    }
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: UpsertPersonRequest): UpsertPersonRequest {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* string firstname */ 1:
                    message.firstname = reader.string();
                    break;
                case /* string lastname */ 2:
                    message.lastname = reader.string();
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
    internalBinaryWrite(message: UpsertPersonRequest, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter {
        /* string firstname = 1; */
        if (message.firstname !== "")
            writer.tag(1, WireType.LengthDelimited).string(message.firstname);
        /* string lastname = 2; */
        if (message.lastname !== "")
            writer.tag(2, WireType.LengthDelimited).string(message.lastname);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message authentication.v1.UpsertPersonRequest
 */
export const UpsertPersonRequest = new UpsertPersonRequest$Type();
// @generated message type with reflection information, may provide speed optimized methods
class UpsertPersonResponse$Type extends MessageType<UpsertPersonResponse> {
    constructor() {
        super("authentication.v1.UpsertPersonResponse", [
            { no: 1, name: "ok", kind: "message", oneof: "response", T: () => Person },
            { no: 2, name: "error", kind: "message", oneof: "response", T: () => BasicError }
        ]);
    }
    create(value?: PartialMessage<UpsertPersonResponse>): UpsertPersonResponse {
        const message = { response: { oneofKind: undefined } };
        globalThis.Object.defineProperty(message, MESSAGE_TYPE, { enumerable: false, value: this });
        if (value !== undefined)
            reflectionMergePartial<UpsertPersonResponse>(this, message, value);
        return message;
    }
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: UpsertPersonResponse): UpsertPersonResponse {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* authentication.v1.Person ok */ 1:
                    message.response = {
                        oneofKind: "ok",
                        ok: Person.internalBinaryRead(reader, reader.uint32(), options, (message.response as any).ok)
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
    internalBinaryWrite(message: UpsertPersonResponse, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter {
        /* authentication.v1.Person ok = 1; */
        if (message.response.oneofKind === "ok")
            Person.internalBinaryWrite(message.response.ok, writer.tag(1, WireType.LengthDelimited).fork(), options).join();
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
 * @generated MessageType for protobuf message authentication.v1.UpsertPersonResponse
 */
export const UpsertPersonResponse = new UpsertPersonResponse$Type();
// @generated message type with reflection information, may provide speed optimized methods
class GetPersonOfUserRequest$Type extends MessageType<GetPersonOfUserRequest> {
    constructor() {
        super("authentication.v1.GetPersonOfUserRequest", [
            { no: 1, name: "user_id", kind: "scalar", T: 9 /*ScalarType.STRING*/ }
        ]);
    }
    create(value?: PartialMessage<GetPersonOfUserRequest>): GetPersonOfUserRequest {
        const message = { userId: "" };
        globalThis.Object.defineProperty(message, MESSAGE_TYPE, { enumerable: false, value: this });
        if (value !== undefined)
            reflectionMergePartial<GetPersonOfUserRequest>(this, message, value);
        return message;
    }
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: GetPersonOfUserRequest): GetPersonOfUserRequest {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* string user_id */ 1:
                    message.userId = reader.string();
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
    internalBinaryWrite(message: GetPersonOfUserRequest, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter {
        /* string user_id = 1; */
        if (message.userId !== "")
            writer.tag(1, WireType.LengthDelimited).string(message.userId);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message authentication.v1.GetPersonOfUserRequest
 */
export const GetPersonOfUserRequest = new GetPersonOfUserRequest$Type();
// @generated message type with reflection information, may provide speed optimized methods
class GetPersonOfUserResponse$Type extends MessageType<GetPersonOfUserResponse> {
    constructor() {
        super("authentication.v1.GetPersonOfUserResponse", [
            { no: 1, name: "ok", kind: "message", oneof: "response", T: () => Person },
            { no: 2, name: "error", kind: "message", oneof: "response", T: () => BasicError }
        ]);
    }
    create(value?: PartialMessage<GetPersonOfUserResponse>): GetPersonOfUserResponse {
        const message = { response: { oneofKind: undefined } };
        globalThis.Object.defineProperty(message, MESSAGE_TYPE, { enumerable: false, value: this });
        if (value !== undefined)
            reflectionMergePartial<GetPersonOfUserResponse>(this, message, value);
        return message;
    }
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: GetPersonOfUserResponse): GetPersonOfUserResponse {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* authentication.v1.Person ok */ 1:
                    message.response = {
                        oneofKind: "ok",
                        ok: Person.internalBinaryRead(reader, reader.uint32(), options, (message.response as any).ok)
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
    internalBinaryWrite(message: GetPersonOfUserResponse, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter {
        /* authentication.v1.Person ok = 1; */
        if (message.response.oneofKind === "ok")
            Person.internalBinaryWrite(message.response.ok, writer.tag(1, WireType.LengthDelimited).fork(), options).join();
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
 * @generated MessageType for protobuf message authentication.v1.GetPersonOfUserResponse
 */
export const GetPersonOfUserResponse = new GetPersonOfUserResponse$Type();