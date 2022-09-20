// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskEvent {
  TaskRun get taskRun => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskRun taskRun) upsertTaskConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TaskRun taskRun)? upsertTaskConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskRun taskRun)? upsertTaskConfig,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpsertTaskConfig value) upsertTaskConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpsertTaskConfig value)? upsertTaskConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpsertTaskConfig value)? upsertTaskConfig,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskEventCopyWith<TaskEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEventCopyWith<$Res> {
  factory $TaskEventCopyWith(TaskEvent value, $Res Function(TaskEvent) then) =
      _$TaskEventCopyWithImpl<$Res>;
  $Res call({TaskRun taskRun});

  $TaskRunCopyWith<$Res> get taskRun;
}

/// @nodoc
class _$TaskEventCopyWithImpl<$Res> implements $TaskEventCopyWith<$Res> {
  _$TaskEventCopyWithImpl(this._value, this._then);

  final TaskEvent _value;
  // ignore: unused_field
  final $Res Function(TaskEvent) _then;

  @override
  $Res call({
    Object? taskRun = freezed,
  }) {
    return _then(_value.copyWith(
      taskRun: taskRun == freezed
          ? _value.taskRun
          : taskRun // ignore: cast_nullable_to_non_nullable
              as TaskRun,
    ));
  }

  @override
  $TaskRunCopyWith<$Res> get taskRun {
    return $TaskRunCopyWith<$Res>(_value.taskRun, (value) {
      return _then(_value.copyWith(taskRun: value));
    });
  }
}

/// @nodoc
abstract class _$$_UpsertTaskConfigCopyWith<$Res>
    implements $TaskEventCopyWith<$Res> {
  factory _$$_UpsertTaskConfigCopyWith(
          _$_UpsertTaskConfig value, $Res Function(_$_UpsertTaskConfig) then) =
      __$$_UpsertTaskConfigCopyWithImpl<$Res>;
  @override
  $Res call({TaskRun taskRun});

  @override
  $TaskRunCopyWith<$Res> get taskRun;
}

/// @nodoc
class __$$_UpsertTaskConfigCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res>
    implements _$$_UpsertTaskConfigCopyWith<$Res> {
  __$$_UpsertTaskConfigCopyWithImpl(
      _$_UpsertTaskConfig _value, $Res Function(_$_UpsertTaskConfig) _then)
      : super(_value, (v) => _then(v as _$_UpsertTaskConfig));

  @override
  _$_UpsertTaskConfig get _value => super._value as _$_UpsertTaskConfig;

  @override
  $Res call({
    Object? taskRun = freezed,
  }) {
    return _then(_$_UpsertTaskConfig(
      taskRun: taskRun == freezed
          ? _value.taskRun
          : taskRun // ignore: cast_nullable_to_non_nullable
              as TaskRun,
    ));
  }
}

/// @nodoc

class _$_UpsertTaskConfig implements _UpsertTaskConfig {
  const _$_UpsertTaskConfig({required this.taskRun});

  @override
  final TaskRun taskRun;

  @override
  String toString() {
    return 'TaskEvent.upsertTaskConfig(taskRun: $taskRun)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpsertTaskConfig &&
            const DeepCollectionEquality().equals(other.taskRun, taskRun));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(taskRun));

  @JsonKey(ignore: true)
  @override
  _$$_UpsertTaskConfigCopyWith<_$_UpsertTaskConfig> get copyWith =>
      __$$_UpsertTaskConfigCopyWithImpl<_$_UpsertTaskConfig>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskRun taskRun) upsertTaskConfig,
  }) {
    return upsertTaskConfig(taskRun);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TaskRun taskRun)? upsertTaskConfig,
  }) {
    return upsertTaskConfig?.call(taskRun);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskRun taskRun)? upsertTaskConfig,
    required TResult orElse(),
  }) {
    if (upsertTaskConfig != null) {
      return upsertTaskConfig(taskRun);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpsertTaskConfig value) upsertTaskConfig,
  }) {
    return upsertTaskConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpsertTaskConfig value)? upsertTaskConfig,
  }) {
    return upsertTaskConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpsertTaskConfig value)? upsertTaskConfig,
    required TResult orElse(),
  }) {
    if (upsertTaskConfig != null) {
      return upsertTaskConfig(this);
    }
    return orElse();
  }
}

abstract class _UpsertTaskConfig implements TaskEvent {
  const factory _UpsertTaskConfig({required final TaskRun taskRun}) =
      _$_UpsertTaskConfig;

  @override
  TaskRun get taskRun;
  @override
  @JsonKey(ignore: true)
  _$$_UpsertTaskConfigCopyWith<_$_UpsertTaskConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TaskState {
  List<TaskRun> get taskRuns => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskStateCopyWith<TaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStateCopyWith<$Res> {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) then) =
      _$TaskStateCopyWithImpl<$Res>;
  $Res call({List<TaskRun> taskRuns});
}

/// @nodoc
class _$TaskStateCopyWithImpl<$Res> implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._value, this._then);

  final TaskState _value;
  // ignore: unused_field
  final $Res Function(TaskState) _then;

  @override
  $Res call({
    Object? taskRuns = freezed,
  }) {
    return _then(_value.copyWith(
      taskRuns: taskRuns == freezed
          ? _value.taskRuns
          : taskRuns // ignore: cast_nullable_to_non_nullable
              as List<TaskRun>,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskStateCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory _$$_TaskStateCopyWith(
          _$_TaskState value, $Res Function(_$_TaskState) then) =
      __$$_TaskStateCopyWithImpl<$Res>;
  @override
  $Res call({List<TaskRun> taskRuns});
}

/// @nodoc
class __$$_TaskStateCopyWithImpl<$Res> extends _$TaskStateCopyWithImpl<$Res>
    implements _$$_TaskStateCopyWith<$Res> {
  __$$_TaskStateCopyWithImpl(
      _$_TaskState _value, $Res Function(_$_TaskState) _then)
      : super(_value, (v) => _then(v as _$_TaskState));

  @override
  _$_TaskState get _value => super._value as _$_TaskState;

  @override
  $Res call({
    Object? taskRuns = freezed,
  }) {
    return _then(_$_TaskState(
      taskRuns: taskRuns == freezed
          ? _value._taskRuns
          : taskRuns // ignore: cast_nullable_to_non_nullable
              as List<TaskRun>,
    ));
  }
}

/// @nodoc

class _$_TaskState implements _TaskState {
  const _$_TaskState({required final List<TaskRun> taskRuns})
      : _taskRuns = taskRuns;

  final List<TaskRun> _taskRuns;
  @override
  List<TaskRun> get taskRuns {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskRuns);
  }

  @override
  String toString() {
    return 'TaskState(taskRuns: $taskRuns)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskState &&
            const DeepCollectionEquality().equals(other._taskRuns, _taskRuns));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_taskRuns));

  @JsonKey(ignore: true)
  @override
  _$$_TaskStateCopyWith<_$_TaskState> get copyWith =>
      __$$_TaskStateCopyWithImpl<_$_TaskState>(this, _$identity);
}

abstract class _TaskState implements TaskState {
  const factory _TaskState({required final List<TaskRun> taskRuns}) =
      _$_TaskState;

  @override
  List<TaskRun> get taskRuns;
  @override
  @JsonKey(ignore: true)
  _$$_TaskStateCopyWith<_$_TaskState> get copyWith =>
      throw _privateConstructorUsedError;
}
