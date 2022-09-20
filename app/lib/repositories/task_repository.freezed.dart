// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskConfig _$TaskConfigFromJson(Map<String, dynamic> json) {
  return TaskConfigImageUpload.fromJson(json);
}

/// @nodoc
mixin _$TaskConfig {
  String get externalId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String externalId) imageUpload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String externalId)? imageUpload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String externalId)? imageUpload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskConfigImageUpload value) imageUpload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskConfigImageUpload value)? imageUpload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskConfigImageUpload value)? imageUpload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskConfigCopyWith<TaskConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskConfigCopyWith<$Res> {
  factory $TaskConfigCopyWith(
          TaskConfig value, $Res Function(TaskConfig) then) =
      _$TaskConfigCopyWithImpl<$Res>;
  $Res call({String externalId});
}

/// @nodoc
class _$TaskConfigCopyWithImpl<$Res> implements $TaskConfigCopyWith<$Res> {
  _$TaskConfigCopyWithImpl(this._value, this._then);

  final TaskConfig _value;
  // ignore: unused_field
  final $Res Function(TaskConfig) _then;

  @override
  $Res call({
    Object? externalId = freezed,
  }) {
    return _then(_value.copyWith(
      externalId: externalId == freezed
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$TaskConfigImageUploadCopyWith<$Res>
    implements $TaskConfigCopyWith<$Res> {
  factory _$$TaskConfigImageUploadCopyWith(_$TaskConfigImageUpload value,
          $Res Function(_$TaskConfigImageUpload) then) =
      __$$TaskConfigImageUploadCopyWithImpl<$Res>;
  @override
  $Res call({String externalId});
}

/// @nodoc
class __$$TaskConfigImageUploadCopyWithImpl<$Res>
    extends _$TaskConfigCopyWithImpl<$Res>
    implements _$$TaskConfigImageUploadCopyWith<$Res> {
  __$$TaskConfigImageUploadCopyWithImpl(_$TaskConfigImageUpload _value,
      $Res Function(_$TaskConfigImageUpload) _then)
      : super(_value, (v) => _then(v as _$TaskConfigImageUpload));

  @override
  _$TaskConfigImageUpload get _value => super._value as _$TaskConfigImageUpload;

  @override
  $Res call({
    Object? externalId = freezed,
  }) {
    return _then(_$TaskConfigImageUpload(
      externalId: externalId == freezed
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskConfigImageUpload extends TaskConfigImageUpload {
  const _$TaskConfigImageUpload({required this.externalId}) : super._();

  factory _$TaskConfigImageUpload.fromJson(Map<String, dynamic> json) =>
      _$$TaskConfigImageUploadFromJson(json);

  @override
  final String externalId;

  @override
  String toString() {
    return 'TaskConfig.imageUpload(externalId: $externalId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskConfigImageUpload &&
            const DeepCollectionEquality()
                .equals(other.externalId, externalId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(externalId));

  @JsonKey(ignore: true)
  @override
  _$$TaskConfigImageUploadCopyWith<_$TaskConfigImageUpload> get copyWith =>
      __$$TaskConfigImageUploadCopyWithImpl<_$TaskConfigImageUpload>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String externalId) imageUpload,
  }) {
    return imageUpload(externalId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String externalId)? imageUpload,
  }) {
    return imageUpload?.call(externalId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String externalId)? imageUpload,
    required TResult orElse(),
  }) {
    if (imageUpload != null) {
      return imageUpload(externalId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskConfigImageUpload value) imageUpload,
  }) {
    return imageUpload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskConfigImageUpload value)? imageUpload,
  }) {
    return imageUpload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskConfigImageUpload value)? imageUpload,
    required TResult orElse(),
  }) {
    if (imageUpload != null) {
      return imageUpload(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskConfigImageUploadToJson(
      this,
    );
  }
}

abstract class TaskConfigImageUpload extends TaskConfig {
  const factory TaskConfigImageUpload({required final String externalId}) =
      _$TaskConfigImageUpload;
  const TaskConfigImageUpload._() : super._();

  factory TaskConfigImageUpload.fromJson(Map<String, dynamic> json) =
      _$TaskConfigImageUpload.fromJson;

  @override
  String get externalId;
  @override
  @JsonKey(ignore: true)
  _$$TaskConfigImageUploadCopyWith<_$TaskConfigImageUpload> get copyWith =>
      throw _privateConstructorUsedError;
}
