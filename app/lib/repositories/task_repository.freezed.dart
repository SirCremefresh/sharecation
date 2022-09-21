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

/// @nodoc
mixin _$TaskRun {
  TaskConfig get taskConfig => throw _privateConstructorUsedError;
  String get taskRunId => throw _privateConstructorUsedError;
  TaskState get taskState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskRunCopyWith<TaskRun> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskRunCopyWith<$Res> {
  factory $TaskRunCopyWith(TaskRun value, $Res Function(TaskRun) then) =
      _$TaskRunCopyWithImpl<$Res>;
  $Res call({TaskConfig taskConfig, String taskRunId, TaskState taskState});

  $TaskConfigCopyWith<$Res> get taskConfig;
}

/// @nodoc
class _$TaskRunCopyWithImpl<$Res> implements $TaskRunCopyWith<$Res> {
  _$TaskRunCopyWithImpl(this._value, this._then);

  final TaskRun _value;
  // ignore: unused_field
  final $Res Function(TaskRun) _then;

  @override
  $Res call({
    Object? taskConfig = freezed,
    Object? taskRunId = freezed,
    Object? taskState = freezed,
  }) {
    return _then(_value.copyWith(
      taskConfig: taskConfig == freezed
          ? _value.taskConfig
          : taskConfig // ignore: cast_nullable_to_non_nullable
              as TaskConfig,
      taskRunId: taskRunId == freezed
          ? _value.taskRunId
          : taskRunId // ignore: cast_nullable_to_non_nullable
              as String,
      taskState: taskState == freezed
          ? _value.taskState
          : taskState // ignore: cast_nullable_to_non_nullable
              as TaskState,
    ));
  }

  @override
  $TaskConfigCopyWith<$Res> get taskConfig {
    return $TaskConfigCopyWith<$Res>(_value.taskConfig, (value) {
      return _then(_value.copyWith(taskConfig: value));
    });
  }
}

/// @nodoc
abstract class _$$_TaskRunCopyWith<$Res> implements $TaskRunCopyWith<$Res> {
  factory _$$_TaskRunCopyWith(
          _$_TaskRun value, $Res Function(_$_TaskRun) then) =
      __$$_TaskRunCopyWithImpl<$Res>;
  @override
  $Res call({TaskConfig taskConfig, String taskRunId, TaskState taskState});

  @override
  $TaskConfigCopyWith<$Res> get taskConfig;
}

/// @nodoc
class __$$_TaskRunCopyWithImpl<$Res> extends _$TaskRunCopyWithImpl<$Res>
    implements _$$_TaskRunCopyWith<$Res> {
  __$$_TaskRunCopyWithImpl(_$_TaskRun _value, $Res Function(_$_TaskRun) _then)
      : super(_value, (v) => _then(v as _$_TaskRun));

  @override
  _$_TaskRun get _value => super._value as _$_TaskRun;

  @override
  $Res call({
    Object? taskConfig = freezed,
    Object? taskRunId = freezed,
    Object? taskState = freezed,
  }) {
    return _then(_$_TaskRun(
      taskConfig: taskConfig == freezed
          ? _value.taskConfig
          : taskConfig // ignore: cast_nullable_to_non_nullable
              as TaskConfig,
      taskRunId: taskRunId == freezed
          ? _value.taskRunId
          : taskRunId // ignore: cast_nullable_to_non_nullable
              as String,
      taskState: taskState == freezed
          ? _value.taskState
          : taskState // ignore: cast_nullable_to_non_nullable
              as TaskState,
    ));
  }
}

/// @nodoc

class _$_TaskRun implements _TaskRun {
  const _$_TaskRun(
      {required this.taskConfig,
      required this.taskRunId,
      required this.taskState});

  @override
  final TaskConfig taskConfig;
  @override
  final String taskRunId;
  @override
  final TaskState taskState;

  @override
  String toString() {
    return 'TaskRun(taskConfig: $taskConfig, taskRunId: $taskRunId, taskState: $taskState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskRun &&
            const DeepCollectionEquality()
                .equals(other.taskConfig, taskConfig) &&
            const DeepCollectionEquality().equals(other.taskRunId, taskRunId) &&
            const DeepCollectionEquality().equals(other.taskState, taskState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(taskConfig),
      const DeepCollectionEquality().hash(taskRunId),
      const DeepCollectionEquality().hash(taskState));

  @JsonKey(ignore: true)
  @override
  _$$_TaskRunCopyWith<_$_TaskRun> get copyWith =>
      __$$_TaskRunCopyWithImpl<_$_TaskRun>(this, _$identity);
}

abstract class _TaskRun implements TaskRun {
  const factory _TaskRun(
      {required final TaskConfig taskConfig,
      required final String taskRunId,
      required final TaskState taskState}) = _$_TaskRun;

  @override
  TaskConfig get taskConfig;
  @override
  String get taskRunId;
  @override
  TaskState get taskState;
  @override
  @JsonKey(ignore: true)
  _$$_TaskRunCopyWith<_$_TaskRun> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskConfig _$TaskConfigFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'imageUpload':
      return TaskConfigImageUpload.fromJson(json);
    case 'createImage':
      return TaskConfigCreateImage.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'TaskConfig', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$TaskConfig {
  String get groupId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String externalId, String groupId) imageUpload,
    required TResult Function(String groupId) createImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String externalId, String groupId)? imageUpload,
    TResult Function(String groupId)? createImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String externalId, String groupId)? imageUpload,
    TResult Function(String groupId)? createImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskConfigImageUpload value) imageUpload,
    required TResult Function(TaskConfigCreateImage value) createImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskConfigImageUpload value)? imageUpload,
    TResult Function(TaskConfigCreateImage value)? createImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskConfigImageUpload value)? imageUpload,
    TResult Function(TaskConfigCreateImage value)? createImage,
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
  $Res call({String groupId});
}

/// @nodoc
class _$TaskConfigCopyWithImpl<$Res> implements $TaskConfigCopyWith<$Res> {
  _$TaskConfigCopyWithImpl(this._value, this._then);

  final TaskConfig _value;
  // ignore: unused_field
  final $Res Function(TaskConfig) _then;

  @override
  $Res call({
    Object? groupId = freezed,
  }) {
    return _then(_value.copyWith(
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
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
  $Res call({String externalId, String groupId});
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
    Object? groupId = freezed,
  }) {
    return _then(_$TaskConfigImageUpload(
      externalId: externalId == freezed
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskConfigImageUpload extends TaskConfigImageUpload {
  const _$TaskConfigImageUpload(
      {required this.externalId, required this.groupId, final String? $type})
      : $type = $type ?? 'imageUpload',
        super._();

  factory _$TaskConfigImageUpload.fromJson(Map<String, dynamic> json) =>
      _$$TaskConfigImageUploadFromJson(json);

  @override
  final String externalId;
  @override
  final String groupId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'TaskConfig.imageUpload(externalId: $externalId, groupId: $groupId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskConfigImageUpload &&
            const DeepCollectionEquality()
                .equals(other.externalId, externalId) &&
            const DeepCollectionEquality().equals(other.groupId, groupId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(externalId),
      const DeepCollectionEquality().hash(groupId));

  @JsonKey(ignore: true)
  @override
  _$$TaskConfigImageUploadCopyWith<_$TaskConfigImageUpload> get copyWith =>
      __$$TaskConfigImageUploadCopyWithImpl<_$TaskConfigImageUpload>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String externalId, String groupId) imageUpload,
    required TResult Function(String groupId) createImage,
  }) {
    return imageUpload(externalId, groupId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String externalId, String groupId)? imageUpload,
    TResult Function(String groupId)? createImage,
  }) {
    return imageUpload?.call(externalId, groupId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String externalId, String groupId)? imageUpload,
    TResult Function(String groupId)? createImage,
    required TResult orElse(),
  }) {
    if (imageUpload != null) {
      return imageUpload(externalId, groupId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskConfigImageUpload value) imageUpload,
    required TResult Function(TaskConfigCreateImage value) createImage,
  }) {
    return imageUpload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskConfigImageUpload value)? imageUpload,
    TResult Function(TaskConfigCreateImage value)? createImage,
  }) {
    return imageUpload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskConfigImageUpload value)? imageUpload,
    TResult Function(TaskConfigCreateImage value)? createImage,
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
  const factory TaskConfigImageUpload(
      {required final String externalId,
      required final String groupId}) = _$TaskConfigImageUpload;
  const TaskConfigImageUpload._() : super._();

  factory TaskConfigImageUpload.fromJson(Map<String, dynamic> json) =
      _$TaskConfigImageUpload.fromJson;

  String get externalId;
  @override
  String get groupId;
  @override
  @JsonKey(ignore: true)
  _$$TaskConfigImageUploadCopyWith<_$TaskConfigImageUpload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskConfigCreateImageCopyWith<$Res>
    implements $TaskConfigCopyWith<$Res> {
  factory _$$TaskConfigCreateImageCopyWith(_$TaskConfigCreateImage value,
          $Res Function(_$TaskConfigCreateImage) then) =
      __$$TaskConfigCreateImageCopyWithImpl<$Res>;
  @override
  $Res call({String groupId});
}

/// @nodoc
class __$$TaskConfigCreateImageCopyWithImpl<$Res>
    extends _$TaskConfigCopyWithImpl<$Res>
    implements _$$TaskConfigCreateImageCopyWith<$Res> {
  __$$TaskConfigCreateImageCopyWithImpl(_$TaskConfigCreateImage _value,
      $Res Function(_$TaskConfigCreateImage) _then)
      : super(_value, (v) => _then(v as _$TaskConfigCreateImage));

  @override
  _$TaskConfigCreateImage get _value => super._value as _$TaskConfigCreateImage;

  @override
  $Res call({
    Object? groupId = freezed,
  }) {
    return _then(_$TaskConfigCreateImage(
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskConfigCreateImage extends TaskConfigCreateImage {
  const _$TaskConfigCreateImage({required this.groupId, final String? $type})
      : $type = $type ?? 'createImage',
        super._();

  factory _$TaskConfigCreateImage.fromJson(Map<String, dynamic> json) =>
      _$$TaskConfigCreateImageFromJson(json);

  @override
  final String groupId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'TaskConfig.createImage(groupId: $groupId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskConfigCreateImage &&
            const DeepCollectionEquality().equals(other.groupId, groupId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(groupId));

  @JsonKey(ignore: true)
  @override
  _$$TaskConfigCreateImageCopyWith<_$TaskConfigCreateImage> get copyWith =>
      __$$TaskConfigCreateImageCopyWithImpl<_$TaskConfigCreateImage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String externalId, String groupId) imageUpload,
    required TResult Function(String groupId) createImage,
  }) {
    return createImage(groupId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String externalId, String groupId)? imageUpload,
    TResult Function(String groupId)? createImage,
  }) {
    return createImage?.call(groupId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String externalId, String groupId)? imageUpload,
    TResult Function(String groupId)? createImage,
    required TResult orElse(),
  }) {
    if (createImage != null) {
      return createImage(groupId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskConfigImageUpload value) imageUpload,
    required TResult Function(TaskConfigCreateImage value) createImage,
  }) {
    return createImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskConfigImageUpload value)? imageUpload,
    TResult Function(TaskConfigCreateImage value)? createImage,
  }) {
    return createImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskConfigImageUpload value)? imageUpload,
    TResult Function(TaskConfigCreateImage value)? createImage,
    required TResult orElse(),
  }) {
    if (createImage != null) {
      return createImage(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskConfigCreateImageToJson(
      this,
    );
  }
}

abstract class TaskConfigCreateImage extends TaskConfig {
  const factory TaskConfigCreateImage({required final String groupId}) =
      _$TaskConfigCreateImage;
  const TaskConfigCreateImage._() : super._();

  factory TaskConfigCreateImage.fromJson(Map<String, dynamic> json) =
      _$TaskConfigCreateImage.fromJson;

  @override
  String get groupId;
  @override
  @JsonKey(ignore: true)
  _$$TaskConfigCreateImageCopyWith<_$TaskConfigCreateImage> get copyWith =>
      throw _privateConstructorUsedError;
}
