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