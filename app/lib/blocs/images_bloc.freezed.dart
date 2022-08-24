// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'images_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImagesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() addEvent,
    required TResult Function() uploadEvent,
    required TResult Function(String groupId, bool force) loadEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? addEvent,
    TResult Function()? uploadEvent,
    TResult Function(String groupId, bool force)? loadEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? addEvent,
    TResult Function()? uploadEvent,
    TResult Function(String groupId, bool force)? loadEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddEvent value) addEvent,
    required TResult Function(_UploadEvent value) uploadEvent,
    required TResult Function(_LoadEvent value) loadEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddEvent value)? addEvent,
    TResult Function(_UploadEvent value)? uploadEvent,
    TResult Function(_LoadEvent value)? loadEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddEvent value)? addEvent,
    TResult Function(_UploadEvent value)? uploadEvent,
    TResult Function(_LoadEvent value)? loadEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesEventCopyWith<$Res> {
  factory $ImagesEventCopyWith(
          ImagesEvent value, $Res Function(ImagesEvent) then) =
      _$ImagesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImagesEventCopyWithImpl<$Res> implements $ImagesEventCopyWith<$Res> {
  _$ImagesEventCopyWithImpl(this._value, this._then);

  final ImagesEvent _value;
  // ignore: unused_field
  final $Res Function(ImagesEvent) _then;
}

/// @nodoc
abstract class _$$_AddEventCopyWith<$Res> {
  factory _$$_AddEventCopyWith(
          _$_AddEvent value, $Res Function(_$_AddEvent) then) =
      __$$_AddEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AddEventCopyWithImpl<$Res> extends _$ImagesEventCopyWithImpl<$Res>
    implements _$$_AddEventCopyWith<$Res> {
  __$$_AddEventCopyWithImpl(
      _$_AddEvent _value, $Res Function(_$_AddEvent) _then)
      : super(_value, (v) => _then(v as _$_AddEvent));

  @override
  _$_AddEvent get _value => super._value as _$_AddEvent;
}

/// @nodoc

class _$_AddEvent implements _AddEvent {
  const _$_AddEvent();

  @override
  String toString() {
    return 'ImagesEvent.addEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AddEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() addEvent,
    required TResult Function() uploadEvent,
    required TResult Function(String groupId, bool force) loadEvent,
  }) {
    return addEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? addEvent,
    TResult Function()? uploadEvent,
    TResult Function(String groupId, bool force)? loadEvent,
  }) {
    return addEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? addEvent,
    TResult Function()? uploadEvent,
    TResult Function(String groupId, bool force)? loadEvent,
    required TResult orElse(),
  }) {
    if (addEvent != null) {
      return addEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddEvent value) addEvent,
    required TResult Function(_UploadEvent value) uploadEvent,
    required TResult Function(_LoadEvent value) loadEvent,
  }) {
    return addEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddEvent value)? addEvent,
    TResult Function(_UploadEvent value)? uploadEvent,
    TResult Function(_LoadEvent value)? loadEvent,
  }) {
    return addEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddEvent value)? addEvent,
    TResult Function(_UploadEvent value)? uploadEvent,
    TResult Function(_LoadEvent value)? loadEvent,
    required TResult orElse(),
  }) {
    if (addEvent != null) {
      return addEvent(this);
    }
    return orElse();
  }
}

abstract class _AddEvent implements ImagesEvent {
  const factory _AddEvent() = _$_AddEvent;
}

/// @nodoc
abstract class _$$_UploadEventCopyWith<$Res> {
  factory _$$_UploadEventCopyWith(
          _$_UploadEvent value, $Res Function(_$_UploadEvent) then) =
      __$$_UploadEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UploadEventCopyWithImpl<$Res> extends _$ImagesEventCopyWithImpl<$Res>
    implements _$$_UploadEventCopyWith<$Res> {
  __$$_UploadEventCopyWithImpl(
      _$_UploadEvent _value, $Res Function(_$_UploadEvent) _then)
      : super(_value, (v) => _then(v as _$_UploadEvent));

  @override
  _$_UploadEvent get _value => super._value as _$_UploadEvent;
}

/// @nodoc

class _$_UploadEvent implements _UploadEvent {
  const _$_UploadEvent();

  @override
  String toString() {
    return 'ImagesEvent.uploadEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UploadEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() addEvent,
    required TResult Function() uploadEvent,
    required TResult Function(String groupId, bool force) loadEvent,
  }) {
    return uploadEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? addEvent,
    TResult Function()? uploadEvent,
    TResult Function(String groupId, bool force)? loadEvent,
  }) {
    return uploadEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? addEvent,
    TResult Function()? uploadEvent,
    TResult Function(String groupId, bool force)? loadEvent,
    required TResult orElse(),
  }) {
    if (uploadEvent != null) {
      return uploadEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddEvent value) addEvent,
    required TResult Function(_UploadEvent value) uploadEvent,
    required TResult Function(_LoadEvent value) loadEvent,
  }) {
    return uploadEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddEvent value)? addEvent,
    TResult Function(_UploadEvent value)? uploadEvent,
    TResult Function(_LoadEvent value)? loadEvent,
  }) {
    return uploadEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddEvent value)? addEvent,
    TResult Function(_UploadEvent value)? uploadEvent,
    TResult Function(_LoadEvent value)? loadEvent,
    required TResult orElse(),
  }) {
    if (uploadEvent != null) {
      return uploadEvent(this);
    }
    return orElse();
  }
}

abstract class _UploadEvent implements ImagesEvent {
  const factory _UploadEvent() = _$_UploadEvent;
}

/// @nodoc
abstract class _$$_LoadEventCopyWith<$Res> {
  factory _$$_LoadEventCopyWith(
          _$_LoadEvent value, $Res Function(_$_LoadEvent) then) =
      __$$_LoadEventCopyWithImpl<$Res>;
  $Res call({String groupId, bool force});
}

/// @nodoc
class __$$_LoadEventCopyWithImpl<$Res> extends _$ImagesEventCopyWithImpl<$Res>
    implements _$$_LoadEventCopyWith<$Res> {
  __$$_LoadEventCopyWithImpl(
      _$_LoadEvent _value, $Res Function(_$_LoadEvent) _then)
      : super(_value, (v) => _then(v as _$_LoadEvent));

  @override
  _$_LoadEvent get _value => super._value as _$_LoadEvent;

  @override
  $Res call({
    Object? groupId = freezed,
    Object? force = freezed,
  }) {
    return _then(_$_LoadEvent(
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      force: force == freezed
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadEvent implements _LoadEvent {
  const _$_LoadEvent({required this.groupId, this.force = false});

  @override
  final String groupId;
  @override
  @JsonKey()
  final bool force;

  @override
  String toString() {
    return 'ImagesEvent.loadEvent(groupId: $groupId, force: $force)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadEvent &&
            const DeepCollectionEquality().equals(other.groupId, groupId) &&
            const DeepCollectionEquality().equals(other.force, force));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(groupId),
      const DeepCollectionEquality().hash(force));

  @JsonKey(ignore: true)
  @override
  _$$_LoadEventCopyWith<_$_LoadEvent> get copyWith =>
      __$$_LoadEventCopyWithImpl<_$_LoadEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() addEvent,
    required TResult Function() uploadEvent,
    required TResult Function(String groupId, bool force) loadEvent,
  }) {
    return loadEvent(groupId, force);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? addEvent,
    TResult Function()? uploadEvent,
    TResult Function(String groupId, bool force)? loadEvent,
  }) {
    return loadEvent?.call(groupId, force);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? addEvent,
    TResult Function()? uploadEvent,
    TResult Function(String groupId, bool force)? loadEvent,
    required TResult orElse(),
  }) {
    if (loadEvent != null) {
      return loadEvent(groupId, force);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddEvent value) addEvent,
    required TResult Function(_UploadEvent value) uploadEvent,
    required TResult Function(_LoadEvent value) loadEvent,
  }) {
    return loadEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddEvent value)? addEvent,
    TResult Function(_UploadEvent value)? uploadEvent,
    TResult Function(_LoadEvent value)? loadEvent,
  }) {
    return loadEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddEvent value)? addEvent,
    TResult Function(_UploadEvent value)? uploadEvent,
    TResult Function(_LoadEvent value)? loadEvent,
    required TResult orElse(),
  }) {
    if (loadEvent != null) {
      return loadEvent(this);
    }
    return orElse();
  }
}

abstract class _LoadEvent implements ImagesEvent {
  const factory _LoadEvent({required final String groupId, final bool force}) =
      _$_LoadEvent;

  String get groupId;
  bool get force;
  @JsonKey(ignore: true)
  _$$_LoadEventCopyWith<_$_LoadEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ImagesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingState,
    required TResult Function(List<SharecationImage> images, String groupId)
        loadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<SharecationImage> images, String groupId)?
        loadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<SharecationImage> images, String groupId)?
        loadedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadedState value) loadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadedState value)? loadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadedState value)? loadedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesStateCopyWith<$Res> {
  factory $ImagesStateCopyWith(
          ImagesState value, $Res Function(ImagesState) then) =
      _$ImagesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImagesStateCopyWithImpl<$Res> implements $ImagesStateCopyWith<$Res> {
  _$ImagesStateCopyWithImpl(this._value, this._then);

  final ImagesState _value;
  // ignore: unused_field
  final $Res Function(ImagesState) _then;
}

/// @nodoc
abstract class _$$_LoadingStateCopyWith<$Res> {
  factory _$$_LoadingStateCopyWith(
          _$_LoadingState value, $Res Function(_$_LoadingState) then) =
      __$$_LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingStateCopyWithImpl<$Res>
    extends _$ImagesStateCopyWithImpl<$Res>
    implements _$$_LoadingStateCopyWith<$Res> {
  __$$_LoadingStateCopyWithImpl(
      _$_LoadingState _value, $Res Function(_$_LoadingState) _then)
      : super(_value, (v) => _then(v as _$_LoadingState));

  @override
  _$_LoadingState get _value => super._value as _$_LoadingState;
}

/// @nodoc

class _$_LoadingState implements _LoadingState {
  const _$_LoadingState();

  @override
  String toString() {
    return 'ImagesState.loadingState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingState,
    required TResult Function(List<SharecationImage> images, String groupId)
        loadedState,
  }) {
    return loadingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<SharecationImage> images, String groupId)?
        loadedState,
  }) {
    return loadingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<SharecationImage> images, String groupId)?
        loadedState,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadedState value) loadedState,
  }) {
    return loadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadedState value)? loadedState,
  }) {
    return loadingState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadedState value)? loadedState,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements ImagesState {
  const factory _LoadingState() = _$_LoadingState;
}

/// @nodoc
abstract class _$$_LoadedStateCopyWith<$Res> {
  factory _$$_LoadedStateCopyWith(
          _$_LoadedState value, $Res Function(_$_LoadedState) then) =
      __$$_LoadedStateCopyWithImpl<$Res>;
  $Res call({List<SharecationImage> images, String groupId});
}

/// @nodoc
class __$$_LoadedStateCopyWithImpl<$Res> extends _$ImagesStateCopyWithImpl<$Res>
    implements _$$_LoadedStateCopyWith<$Res> {
  __$$_LoadedStateCopyWithImpl(
      _$_LoadedState _value, $Res Function(_$_LoadedState) _then)
      : super(_value, (v) => _then(v as _$_LoadedState));

  @override
  _$_LoadedState get _value => super._value as _$_LoadedState;

  @override
  $Res call({
    Object? images = freezed,
    Object? groupId = freezed,
  }) {
    return _then(_$_LoadedState(
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<SharecationImage>,
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoadedState implements _LoadedState {
  const _$_LoadedState(
      {required final List<SharecationImage> images, required this.groupId})
      : _images = images;

  final List<SharecationImage> _images;
  @override
  List<SharecationImage> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String groupId;

  @override
  String toString() {
    return 'ImagesState.loadedState(images: $images, groupId: $groupId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedState &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other.groupId, groupId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(groupId));

  @JsonKey(ignore: true)
  @override
  _$$_LoadedStateCopyWith<_$_LoadedState> get copyWith =>
      __$$_LoadedStateCopyWithImpl<_$_LoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingState,
    required TResult Function(List<SharecationImage> images, String groupId)
        loadedState,
  }) {
    return loadedState(images, groupId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<SharecationImage> images, String groupId)?
        loadedState,
  }) {
    return loadedState?.call(images, groupId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<SharecationImage> images, String groupId)?
        loadedState,
    required TResult orElse(),
  }) {
    if (loadedState != null) {
      return loadedState(images, groupId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadedState value) loadedState,
  }) {
    return loadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadedState value)? loadedState,
  }) {
    return loadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadedState value)? loadedState,
    required TResult orElse(),
  }) {
    if (loadedState != null) {
      return loadedState(this);
    }
    return orElse();
  }
}

abstract class _LoadedState implements ImagesState {
  const factory _LoadedState(
      {required final List<SharecationImage> images,
      required final String groupId}) = _$_LoadedState;

  List<SharecationImage> get images;
  String get groupId;
  @JsonKey(ignore: true)
  _$$_LoadedStateCopyWith<_$_LoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
