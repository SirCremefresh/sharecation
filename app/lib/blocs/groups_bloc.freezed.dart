// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'groups_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GroupsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool force) loadEvent,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool force)? loadEvent,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool force)? loadEvent,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEvent value) loadEvent,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadEvent value)? loadEvent,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEvent value)? loadEvent,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupsEventCopyWith<$Res> {
  factory $GroupsEventCopyWith(
          GroupsEvent value, $Res Function(GroupsEvent) then) =
      _$GroupsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GroupsEventCopyWithImpl<$Res> implements $GroupsEventCopyWith<$Res> {
  _$GroupsEventCopyWithImpl(this._value, this._then);

  final GroupsEvent _value;
  // ignore: unused_field
  final $Res Function(GroupsEvent) _then;
}

/// @nodoc
abstract class _$$_LoadEventCopyWith<$Res> {
  factory _$$_LoadEventCopyWith(
          _$_LoadEvent value, $Res Function(_$_LoadEvent) then) =
      __$$_LoadEventCopyWithImpl<$Res>;
  $Res call({bool force});
}

/// @nodoc
class __$$_LoadEventCopyWithImpl<$Res> extends _$GroupsEventCopyWithImpl<$Res>
    implements _$$_LoadEventCopyWith<$Res> {
  __$$_LoadEventCopyWithImpl(
      _$_LoadEvent _value, $Res Function(_$_LoadEvent) _then)
      : super(_value, (v) => _then(v as _$_LoadEvent));

  @override
  _$_LoadEvent get _value => super._value as _$_LoadEvent;

  @override
  $Res call({
    Object? force = freezed,
  }) {
    return _then(_$_LoadEvent(
      force: force == freezed
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadEvent implements _LoadEvent {
  const _$_LoadEvent({this.force = false});

  @override
  @JsonKey()
  final bool force;

  @override
  String toString() {
    return 'GroupsEvent.loadEvent(force: $force)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadEvent &&
            const DeepCollectionEquality().equals(other.force, force));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(force));

  @JsonKey(ignore: true)
  @override
  _$$_LoadEventCopyWith<_$_LoadEvent> get copyWith =>
      __$$_LoadEventCopyWithImpl<_$_LoadEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool force) loadEvent,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) {
    return loadEvent(force);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool force)? loadEvent,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) {
    return loadEvent?.call(force);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool force)? loadEvent,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
    required TResult orElse(),
  }) {
    if (loadEvent != null) {
      return loadEvent(force);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEvent value) loadEvent,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) {
    return loadEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadEvent value)? loadEvent,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) {
    return loadEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEvent value)? loadEvent,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
    required TResult orElse(),
  }) {
    if (loadEvent != null) {
      return loadEvent(this);
    }
    return orElse();
  }
}

abstract class _LoadEvent implements GroupsEvent {
  const factory _LoadEvent({final bool force}) = _$_LoadEvent;

  bool get force => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_LoadEventCopyWith<_$_LoadEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SelectEventCopyWith<$Res> {
  factory _$$_SelectEventCopyWith(
          _$_SelectEvent value, $Res Function(_$_SelectEvent) then) =
      __$$_SelectEventCopyWithImpl<$Res>;
  $Res call({String groupId});
}

/// @nodoc
class __$$_SelectEventCopyWithImpl<$Res> extends _$GroupsEventCopyWithImpl<$Res>
    implements _$$_SelectEventCopyWith<$Res> {
  __$$_SelectEventCopyWithImpl(
      _$_SelectEvent _value, $Res Function(_$_SelectEvent) _then)
      : super(_value, (v) => _then(v as _$_SelectEvent));

  @override
  _$_SelectEvent get _value => super._value as _$_SelectEvent;

  @override
  $Res call({
    Object? groupId = freezed,
  }) {
    return _then(_$_SelectEvent(
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SelectEvent implements _SelectEvent {
  const _$_SelectEvent({required this.groupId});

  @override
  final String groupId;

  @override
  String toString() {
    return 'GroupsEvent.selectEvent(groupId: $groupId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectEvent &&
            const DeepCollectionEquality().equals(other.groupId, groupId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(groupId));

  @JsonKey(ignore: true)
  @override
  _$$_SelectEventCopyWith<_$_SelectEvent> get copyWith =>
      __$$_SelectEventCopyWithImpl<_$_SelectEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool force) loadEvent,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) {
    return selectEvent(groupId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool force)? loadEvent,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) {
    return selectEvent?.call(groupId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool force)? loadEvent,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
    required TResult orElse(),
  }) {
    if (selectEvent != null) {
      return selectEvent(groupId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEvent value) loadEvent,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) {
    return selectEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadEvent value)? loadEvent,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) {
    return selectEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEvent value)? loadEvent,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
    required TResult orElse(),
  }) {
    if (selectEvent != null) {
      return selectEvent(this);
    }
    return orElse();
  }
}

abstract class _SelectEvent implements GroupsEvent {
  const factory _SelectEvent({required final String groupId}) = _$_SelectEvent;

  String get groupId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_SelectEventCopyWith<_$_SelectEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddEventCopyWith<$Res> {
  factory _$$_AddEventCopyWith(
          _$_AddEvent value, $Res Function(_$_AddEvent) then) =
      __$$_AddEventCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class __$$_AddEventCopyWithImpl<$Res> extends _$GroupsEventCopyWithImpl<$Res>
    implements _$$_AddEventCopyWith<$Res> {
  __$$_AddEventCopyWithImpl(
      _$_AddEvent _value, $Res Function(_$_AddEvent) _then)
      : super(_value, (v) => _then(v as _$_AddEvent));

  @override
  _$_AddEvent get _value => super._value as _$_AddEvent;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_AddEvent(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddEvent implements _AddEvent {
  const _$_AddEvent({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'GroupsEvent.addEvent(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddEvent &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_AddEventCopyWith<_$_AddEvent> get copyWith =>
      __$$_AddEventCopyWithImpl<_$_AddEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool force) loadEvent,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) {
    return addEvent(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool force)? loadEvent,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) {
    return addEvent?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool force)? loadEvent,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
    required TResult orElse(),
  }) {
    if (addEvent != null) {
      return addEvent(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEvent value) loadEvent,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) {
    return addEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadEvent value)? loadEvent,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) {
    return addEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEvent value)? loadEvent,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
    required TResult orElse(),
  }) {
    if (addEvent != null) {
      return addEvent(this);
    }
    return orElse();
  }
}

abstract class _AddEvent implements GroupsEvent {
  const factory _AddEvent({required final String name}) = _$_AddEvent;

  String get name => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_AddEventCopyWith<_$_AddEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GroupsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingState,
    required TResult Function(List<Group> groups, Group activeGroup)
        loadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<Group> groups, Group activeGroup)? loadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<Group> groups, Group activeGroup)? loadedState,
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
abstract class $GroupsStateCopyWith<$Res> {
  factory $GroupsStateCopyWith(
          GroupsState value, $Res Function(GroupsState) then) =
      _$GroupsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GroupsStateCopyWithImpl<$Res> implements $GroupsStateCopyWith<$Res> {
  _$GroupsStateCopyWithImpl(this._value, this._then);

  final GroupsState _value;
  // ignore: unused_field
  final $Res Function(GroupsState) _then;
}

/// @nodoc
abstract class _$$_LoadingStateCopyWith<$Res> {
  factory _$$_LoadingStateCopyWith(
          _$_LoadingState value, $Res Function(_$_LoadingState) then) =
      __$$_LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingStateCopyWithImpl<$Res>
    extends _$GroupsStateCopyWithImpl<$Res>
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
    return 'GroupsState.loadingState()';
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
    required TResult Function(List<Group> groups, Group activeGroup)
        loadedState,
  }) {
    return loadingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<Group> groups, Group activeGroup)? loadedState,
  }) {
    return loadingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<Group> groups, Group activeGroup)? loadedState,
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

abstract class _LoadingState implements GroupsState {
  const factory _LoadingState() = _$_LoadingState;
}

/// @nodoc
abstract class _$$_LoadedStateCopyWith<$Res> {
  factory _$$_LoadedStateCopyWith(
          _$_LoadedState value, $Res Function(_$_LoadedState) then) =
      __$$_LoadedStateCopyWithImpl<$Res>;
  $Res call({List<Group> groups, Group activeGroup});
}

/// @nodoc
class __$$_LoadedStateCopyWithImpl<$Res> extends _$GroupsStateCopyWithImpl<$Res>
    implements _$$_LoadedStateCopyWith<$Res> {
  __$$_LoadedStateCopyWithImpl(
      _$_LoadedState _value, $Res Function(_$_LoadedState) _then)
      : super(_value, (v) => _then(v as _$_LoadedState));

  @override
  _$_LoadedState get _value => super._value as _$_LoadedState;

  @override
  $Res call({
    Object? groups = freezed,
    Object? activeGroup = freezed,
  }) {
    return _then(_$_LoadedState(
      groups: groups == freezed
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      activeGroup: activeGroup == freezed
          ? _value.activeGroup
          : activeGroup // ignore: cast_nullable_to_non_nullable
              as Group,
    ));
  }
}

/// @nodoc

class _$_LoadedState implements _LoadedState {
  const _$_LoadedState(
      {required final List<Group> groups, required this.activeGroup})
      : _groups = groups;

  final List<Group> _groups;
  @override
  List<Group> get groups {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final Group activeGroup;

  @override
  String toString() {
    return 'GroupsState.loadedState(groups: $groups, activeGroup: $activeGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedState &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality()
                .equals(other.activeGroup, activeGroup));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(activeGroup));

  @JsonKey(ignore: true)
  @override
  _$$_LoadedStateCopyWith<_$_LoadedState> get copyWith =>
      __$$_LoadedStateCopyWithImpl<_$_LoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingState,
    required TResult Function(List<Group> groups, Group activeGroup)
        loadedState,
  }) {
    return loadedState(groups, activeGroup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<Group> groups, Group activeGroup)? loadedState,
  }) {
    return loadedState?.call(groups, activeGroup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<Group> groups, Group activeGroup)? loadedState,
    required TResult orElse(),
  }) {
    if (loadedState != null) {
      return loadedState(groups, activeGroup);
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

abstract class _LoadedState implements GroupsState {
  const factory _LoadedState(
      {required final List<Group> groups,
      required final Group activeGroup}) = _$_LoadedState;

  List<Group> get groups => throw _privateConstructorUsedError;
  Group get activeGroup => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_LoadedStateCopyWith<_$_LoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

SharecationImage _$SharecationImageFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'locale':
      return _SharecationImageLocal.fromJson(json);
    case 'remote':
      return _SharecationImageRemote.fromJson(json);
    case 'synced':
      return _SharecationImageSynced.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'SharecationImage',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$SharecationImage {
  String get externalId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String externalId, String path) locale,
    required TResult Function(String externalId, String imageId, String url)
        remote,
    required TResult Function(
            String externalId, String imageId, String url, String path)
        synced,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String externalId, String path)? locale,
    TResult Function(String externalId, String imageId, String url)? remote,
    TResult Function(
            String externalId, String imageId, String url, String path)?
        synced,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String externalId, String path)? locale,
    TResult Function(String externalId, String imageId, String url)? remote,
    TResult Function(
            String externalId, String imageId, String url, String path)?
        synced,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SharecationImageLocal value) locale,
    required TResult Function(_SharecationImageRemote value) remote,
    required TResult Function(_SharecationImageSynced value) synced,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SharecationImageLocal value)? locale,
    TResult Function(_SharecationImageRemote value)? remote,
    TResult Function(_SharecationImageSynced value)? synced,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SharecationImageLocal value)? locale,
    TResult Function(_SharecationImageRemote value)? remote,
    TResult Function(_SharecationImageSynced value)? synced,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SharecationImageCopyWith<SharecationImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharecationImageCopyWith<$Res> {
  factory $SharecationImageCopyWith(
          SharecationImage value, $Res Function(SharecationImage) then) =
      _$SharecationImageCopyWithImpl<$Res>;
  $Res call({String externalId});
}

/// @nodoc
class _$SharecationImageCopyWithImpl<$Res>
    implements $SharecationImageCopyWith<$Res> {
  _$SharecationImageCopyWithImpl(this._value, this._then);

  final SharecationImage _value;
  // ignore: unused_field
  final $Res Function(SharecationImage) _then;

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
abstract class _$$_SharecationImageLocalCopyWith<$Res>
    implements $SharecationImageCopyWith<$Res> {
  factory _$$_SharecationImageLocalCopyWith(_$_SharecationImageLocal value,
          $Res Function(_$_SharecationImageLocal) then) =
      __$$_SharecationImageLocalCopyWithImpl<$Res>;
  @override
  $Res call({String externalId, String path});
}

/// @nodoc
class __$$_SharecationImageLocalCopyWithImpl<$Res>
    extends _$SharecationImageCopyWithImpl<$Res>
    implements _$$_SharecationImageLocalCopyWith<$Res> {
  __$$_SharecationImageLocalCopyWithImpl(_$_SharecationImageLocal _value,
      $Res Function(_$_SharecationImageLocal) _then)
      : super(_value, (v) => _then(v as _$_SharecationImageLocal));

  @override
  _$_SharecationImageLocal get _value =>
      super._value as _$_SharecationImageLocal;

  @override
  $Res call({
    Object? externalId = freezed,
    Object? path = freezed,
  }) {
    return _then(_$_SharecationImageLocal(
      externalId: externalId == freezed
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SharecationImageLocal implements _SharecationImageLocal {
  const _$_SharecationImageLocal(
      {required this.externalId, required this.path, final String? $type})
      : $type = $type ?? 'locale';

  factory _$_SharecationImageLocal.fromJson(Map<String, dynamic> json) =>
      _$$_SharecationImageLocalFromJson(json);

  @override
  final String externalId;
  @override
  final String path;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'SharecationImage.locale(externalId: $externalId, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SharecationImageLocal &&
            const DeepCollectionEquality()
                .equals(other.externalId, externalId) &&
            const DeepCollectionEquality().equals(other.path, path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(externalId),
      const DeepCollectionEquality().hash(path));

  @JsonKey(ignore: true)
  @override
  _$$_SharecationImageLocalCopyWith<_$_SharecationImageLocal> get copyWith =>
      __$$_SharecationImageLocalCopyWithImpl<_$_SharecationImageLocal>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String externalId, String path) locale,
    required TResult Function(String externalId, String imageId, String url)
        remote,
    required TResult Function(
            String externalId, String imageId, String url, String path)
        synced,
  }) {
    return locale(externalId, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String externalId, String path)? locale,
    TResult Function(String externalId, String imageId, String url)? remote,
    TResult Function(
            String externalId, String imageId, String url, String path)?
        synced,
  }) {
    return locale?.call(externalId, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String externalId, String path)? locale,
    TResult Function(String externalId, String imageId, String url)? remote,
    TResult Function(
            String externalId, String imageId, String url, String path)?
        synced,
    required TResult orElse(),
  }) {
    if (locale != null) {
      return locale(externalId, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SharecationImageLocal value) locale,
    required TResult Function(_SharecationImageRemote value) remote,
    required TResult Function(_SharecationImageSynced value) synced,
  }) {
    return locale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SharecationImageLocal value)? locale,
    TResult Function(_SharecationImageRemote value)? remote,
    TResult Function(_SharecationImageSynced value)? synced,
  }) {
    return locale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SharecationImageLocal value)? locale,
    TResult Function(_SharecationImageRemote value)? remote,
    TResult Function(_SharecationImageSynced value)? synced,
    required TResult orElse(),
  }) {
    if (locale != null) {
      return locale(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SharecationImageLocalToJson(this);
  }
}

abstract class _SharecationImageLocal implements SharecationImage {
  const factory _SharecationImageLocal(
      {required final String externalId,
      required final String path}) = _$_SharecationImageLocal;

  factory _SharecationImageLocal.fromJson(Map<String, dynamic> json) =
      _$_SharecationImageLocal.fromJson;

  @override
  String get externalId => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SharecationImageLocalCopyWith<_$_SharecationImageLocal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SharecationImageRemoteCopyWith<$Res>
    implements $SharecationImageCopyWith<$Res> {
  factory _$$_SharecationImageRemoteCopyWith(_$_SharecationImageRemote value,
          $Res Function(_$_SharecationImageRemote) then) =
      __$$_SharecationImageRemoteCopyWithImpl<$Res>;
  @override
  $Res call({String externalId, String imageId, String url});
}

/// @nodoc
class __$$_SharecationImageRemoteCopyWithImpl<$Res>
    extends _$SharecationImageCopyWithImpl<$Res>
    implements _$$_SharecationImageRemoteCopyWith<$Res> {
  __$$_SharecationImageRemoteCopyWithImpl(_$_SharecationImageRemote _value,
      $Res Function(_$_SharecationImageRemote) _then)
      : super(_value, (v) => _then(v as _$_SharecationImageRemote));

  @override
  _$_SharecationImageRemote get _value =>
      super._value as _$_SharecationImageRemote;

  @override
  $Res call({
    Object? externalId = freezed,
    Object? imageId = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_SharecationImageRemote(
      externalId: externalId == freezed
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String,
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SharecationImageRemote implements _SharecationImageRemote {
  const _$_SharecationImageRemote(
      {required this.externalId,
      required this.imageId,
      required this.url,
      final String? $type})
      : $type = $type ?? 'remote';

  factory _$_SharecationImageRemote.fromJson(Map<String, dynamic> json) =>
      _$$_SharecationImageRemoteFromJson(json);

  @override
  final String externalId;
  @override
  final String imageId;
  @override
  final String url;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'SharecationImage.remote(externalId: $externalId, imageId: $imageId, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SharecationImageRemote &&
            const DeepCollectionEquality()
                .equals(other.externalId, externalId) &&
            const DeepCollectionEquality().equals(other.imageId, imageId) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(externalId),
      const DeepCollectionEquality().hash(imageId),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_SharecationImageRemoteCopyWith<_$_SharecationImageRemote> get copyWith =>
      __$$_SharecationImageRemoteCopyWithImpl<_$_SharecationImageRemote>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String externalId, String path) locale,
    required TResult Function(String externalId, String imageId, String url)
        remote,
    required TResult Function(
            String externalId, String imageId, String url, String path)
        synced,
  }) {
    return remote(externalId, imageId, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String externalId, String path)? locale,
    TResult Function(String externalId, String imageId, String url)? remote,
    TResult Function(
            String externalId, String imageId, String url, String path)?
        synced,
  }) {
    return remote?.call(externalId, imageId, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String externalId, String path)? locale,
    TResult Function(String externalId, String imageId, String url)? remote,
    TResult Function(
            String externalId, String imageId, String url, String path)?
        synced,
    required TResult orElse(),
  }) {
    if (remote != null) {
      return remote(externalId, imageId, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SharecationImageLocal value) locale,
    required TResult Function(_SharecationImageRemote value) remote,
    required TResult Function(_SharecationImageSynced value) synced,
  }) {
    return remote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SharecationImageLocal value)? locale,
    TResult Function(_SharecationImageRemote value)? remote,
    TResult Function(_SharecationImageSynced value)? synced,
  }) {
    return remote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SharecationImageLocal value)? locale,
    TResult Function(_SharecationImageRemote value)? remote,
    TResult Function(_SharecationImageSynced value)? synced,
    required TResult orElse(),
  }) {
    if (remote != null) {
      return remote(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SharecationImageRemoteToJson(this);
  }
}

abstract class _SharecationImageRemote implements SharecationImage {
  const factory _SharecationImageRemote(
      {required final String externalId,
      required final String imageId,
      required final String url}) = _$_SharecationImageRemote;

  factory _SharecationImageRemote.fromJson(Map<String, dynamic> json) =
      _$_SharecationImageRemote.fromJson;

  @override
  String get externalId => throw _privateConstructorUsedError;
  String get imageId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SharecationImageRemoteCopyWith<_$_SharecationImageRemote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SharecationImageSyncedCopyWith<$Res>
    implements $SharecationImageCopyWith<$Res> {
  factory _$$_SharecationImageSyncedCopyWith(_$_SharecationImageSynced value,
          $Res Function(_$_SharecationImageSynced) then) =
      __$$_SharecationImageSyncedCopyWithImpl<$Res>;
  @override
  $Res call({String externalId, String imageId, String url, String path});
}

/// @nodoc
class __$$_SharecationImageSyncedCopyWithImpl<$Res>
    extends _$SharecationImageCopyWithImpl<$Res>
    implements _$$_SharecationImageSyncedCopyWith<$Res> {
  __$$_SharecationImageSyncedCopyWithImpl(_$_SharecationImageSynced _value,
      $Res Function(_$_SharecationImageSynced) _then)
      : super(_value, (v) => _then(v as _$_SharecationImageSynced));

  @override
  _$_SharecationImageSynced get _value =>
      super._value as _$_SharecationImageSynced;

  @override
  $Res call({
    Object? externalId = freezed,
    Object? imageId = freezed,
    Object? url = freezed,
    Object? path = freezed,
  }) {
    return _then(_$_SharecationImageSynced(
      externalId: externalId == freezed
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String,
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SharecationImageSynced implements _SharecationImageSynced {
  const _$_SharecationImageSynced(
      {required this.externalId,
      required this.imageId,
      required this.url,
      required this.path,
      final String? $type})
      : $type = $type ?? 'synced';

  factory _$_SharecationImageSynced.fromJson(Map<String, dynamic> json) =>
      _$$_SharecationImageSyncedFromJson(json);

  @override
  final String externalId;
  @override
  final String imageId;
  @override
  final String url;
  @override
  final String path;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'SharecationImage.synced(externalId: $externalId, imageId: $imageId, url: $url, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SharecationImageSynced &&
            const DeepCollectionEquality()
                .equals(other.externalId, externalId) &&
            const DeepCollectionEquality().equals(other.imageId, imageId) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.path, path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(externalId),
      const DeepCollectionEquality().hash(imageId),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(path));

  @JsonKey(ignore: true)
  @override
  _$$_SharecationImageSyncedCopyWith<_$_SharecationImageSynced> get copyWith =>
      __$$_SharecationImageSyncedCopyWithImpl<_$_SharecationImageSynced>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String externalId, String path) locale,
    required TResult Function(String externalId, String imageId, String url)
        remote,
    required TResult Function(
            String externalId, String imageId, String url, String path)
        synced,
  }) {
    return synced(externalId, imageId, url, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String externalId, String path)? locale,
    TResult Function(String externalId, String imageId, String url)? remote,
    TResult Function(
            String externalId, String imageId, String url, String path)?
        synced,
  }) {
    return synced?.call(externalId, imageId, url, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String externalId, String path)? locale,
    TResult Function(String externalId, String imageId, String url)? remote,
    TResult Function(
            String externalId, String imageId, String url, String path)?
        synced,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced(externalId, imageId, url, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SharecationImageLocal value) locale,
    required TResult Function(_SharecationImageRemote value) remote,
    required TResult Function(_SharecationImageSynced value) synced,
  }) {
    return synced(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SharecationImageLocal value)? locale,
    TResult Function(_SharecationImageRemote value)? remote,
    TResult Function(_SharecationImageSynced value)? synced,
  }) {
    return synced?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SharecationImageLocal value)? locale,
    TResult Function(_SharecationImageRemote value)? remote,
    TResult Function(_SharecationImageSynced value)? synced,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SharecationImageSyncedToJson(this);
  }
}

abstract class _SharecationImageSynced implements SharecationImage {
  const factory _SharecationImageSynced(
      {required final String externalId,
      required final String imageId,
      required final String url,
      required final String path}) = _$_SharecationImageSynced;

  factory _SharecationImageSynced.fromJson(Map<String, dynamic> json) =
      _$_SharecationImageSynced.fromJson;

  @override
  String get externalId => throw _privateConstructorUsedError;
  String get imageId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SharecationImageSyncedCopyWith<_$_SharecationImageSynced> get copyWith =>
      throw _privateConstructorUsedError;
}

SharecationGroup _$SharecationGroupFromJson(Map<String, dynamic> json) {
  return _SharecationGroup.fromJson(json);
}

/// @nodoc
mixin _$SharecationGroup {
  Map<String, SharecationImage> get images =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SharecationGroupCopyWith<SharecationGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharecationGroupCopyWith<$Res> {
  factory $SharecationGroupCopyWith(
          SharecationGroup value, $Res Function(SharecationGroup) then) =
      _$SharecationGroupCopyWithImpl<$Res>;
  $Res call({Map<String, SharecationImage> images});
}

/// @nodoc
class _$SharecationGroupCopyWithImpl<$Res>
    implements $SharecationGroupCopyWith<$Res> {
  _$SharecationGroupCopyWithImpl(this._value, this._then);

  final SharecationGroup _value;
  // ignore: unused_field
  final $Res Function(SharecationGroup) _then;

  @override
  $Res call({
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Map<String, SharecationImage>,
    ));
  }
}

/// @nodoc
abstract class _$$_SharecationGroupCopyWith<$Res>
    implements $SharecationGroupCopyWith<$Res> {
  factory _$$_SharecationGroupCopyWith(
          _$_SharecationGroup value, $Res Function(_$_SharecationGroup) then) =
      __$$_SharecationGroupCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, SharecationImage> images});
}

/// @nodoc
class __$$_SharecationGroupCopyWithImpl<$Res>
    extends _$SharecationGroupCopyWithImpl<$Res>
    implements _$$_SharecationGroupCopyWith<$Res> {
  __$$_SharecationGroupCopyWithImpl(
      _$_SharecationGroup _value, $Res Function(_$_SharecationGroup) _then)
      : super(_value, (v) => _then(v as _$_SharecationGroup));

  @override
  _$_SharecationGroup get _value => super._value as _$_SharecationGroup;

  @override
  $Res call({
    Object? images = freezed,
  }) {
    return _then(_$_SharecationGroup(
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as Map<String, SharecationImage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SharecationGroup implements _SharecationGroup {
  const _$_SharecationGroup(
      {required final Map<String, SharecationImage> images})
      : _images = images;

  factory _$_SharecationGroup.fromJson(Map<String, dynamic> json) =>
      _$$_SharecationGroupFromJson(json);

  final Map<String, SharecationImage> _images;
  @override
  Map<String, SharecationImage> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_images);
  }

  @override
  String toString() {
    return 'SharecationGroup(images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SharecationGroup &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  _$$_SharecationGroupCopyWith<_$_SharecationGroup> get copyWith =>
      __$$_SharecationGroupCopyWithImpl<_$_SharecationGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SharecationGroupToJson(this);
  }
}

abstract class _SharecationGroup implements SharecationGroup {
  const factory _SharecationGroup(
          {required final Map<String, SharecationImage> images}) =
      _$_SharecationGroup;

  factory _SharecationGroup.fromJson(Map<String, dynamic> json) =
      _$_SharecationGroup.fromJson;

  @override
  Map<String, SharecationImage> get images =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SharecationGroupCopyWith<_$_SharecationGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

SharecationGroups _$SharecationGroupsFromJson(Map<String, dynamic> json) {
  return _SharecationGroups.fromJson(json);
}

/// @nodoc
mixin _$SharecationGroups {
  Map<String, SharecationGroup> get groups =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SharecationGroupsCopyWith<SharecationGroups> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharecationGroupsCopyWith<$Res> {
  factory $SharecationGroupsCopyWith(
          SharecationGroups value, $Res Function(SharecationGroups) then) =
      _$SharecationGroupsCopyWithImpl<$Res>;
  $Res call({Map<String, SharecationGroup> groups});
}

/// @nodoc
class _$SharecationGroupsCopyWithImpl<$Res>
    implements $SharecationGroupsCopyWith<$Res> {
  _$SharecationGroupsCopyWithImpl(this._value, this._then);

  final SharecationGroups _value;
  // ignore: unused_field
  final $Res Function(SharecationGroups) _then;

  @override
  $Res call({
    Object? groups = freezed,
  }) {
    return _then(_value.copyWith(
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as Map<String, SharecationGroup>,
    ));
  }
}

/// @nodoc
abstract class _$$_SharecationGroupsCopyWith<$Res>
    implements $SharecationGroupsCopyWith<$Res> {
  factory _$$_SharecationGroupsCopyWith(_$_SharecationGroups value,
          $Res Function(_$_SharecationGroups) then) =
      __$$_SharecationGroupsCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, SharecationGroup> groups});
}

/// @nodoc
class __$$_SharecationGroupsCopyWithImpl<$Res>
    extends _$SharecationGroupsCopyWithImpl<$Res>
    implements _$$_SharecationGroupsCopyWith<$Res> {
  __$$_SharecationGroupsCopyWithImpl(
      _$_SharecationGroups _value, $Res Function(_$_SharecationGroups) _then)
      : super(_value, (v) => _then(v as _$_SharecationGroups));

  @override
  _$_SharecationGroups get _value => super._value as _$_SharecationGroups;

  @override
  $Res call({
    Object? groups = freezed,
  }) {
    return _then(_$_SharecationGroups(
      groups: groups == freezed
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as Map<String, SharecationGroup>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SharecationGroups implements _SharecationGroups {
  const _$_SharecationGroups(
      {required final Map<String, SharecationGroup> groups})
      : _groups = groups;

  factory _$_SharecationGroups.fromJson(Map<String, dynamic> json) =>
      _$$_SharecationGroupsFromJson(json);

  final Map<String, SharecationGroup> _groups;
  @override
  Map<String, SharecationGroup> get groups {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_groups);
  }

  @override
  String toString() {
    return 'SharecationGroups(groups: $groups)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SharecationGroups &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_groups));

  @JsonKey(ignore: true)
  @override
  _$$_SharecationGroupsCopyWith<_$_SharecationGroups> get copyWith =>
      __$$_SharecationGroupsCopyWithImpl<_$_SharecationGroups>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SharecationGroupsToJson(this);
  }
}

abstract class _SharecationGroups implements SharecationGroups {
  const factory _SharecationGroups(
          {required final Map<String, SharecationGroup> groups}) =
      _$_SharecationGroups;

  factory _SharecationGroups.fromJson(Map<String, dynamic> json) =
      _$_SharecationGroups.fromJson;

  @override
  Map<String, SharecationGroup> get groups =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SharecationGroupsCopyWith<_$_SharecationGroups> get copyWith =>
      throw _privateConstructorUsedError;
}
