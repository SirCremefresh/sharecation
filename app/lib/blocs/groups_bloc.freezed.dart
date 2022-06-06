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
    required TResult Function(
            String userId, bool loadFromFile, bool loadFromServer)
        loadGroupsForUser,
    required TResult Function(bool loadFromFile, bool loadFromServer)
        loadGroups,
    required TResult Function() loadImages,
    required TResult Function(SharecationGroups groups) initialLoad,
    required TResult Function(String groupId, List<SharecationImage> images)
        patchImages,
    required TResult Function(List<SharecationEmptyGroup> groups) groupsLoaded,
    required TResult Function(String groupId, SharecationImage image)
        imageUpdated,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadGroupsForUser value) loadGroupsForUser,
    required TResult Function(_LoadGroups value) loadGroups,
    required TResult Function(_LoadImages value) loadImages,
    required TResult Function(_InitialLoadEvent value) initialLoad,
    required TResult Function(_PatchImagesEvent value) patchImages,
    required TResult Function(_GroupsLoadedEvent value) groupsLoaded,
    required TResult Function(_ImageUpdatedEvent value) imageUpdated,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
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
abstract class _$$_LoadGroupsForUserCopyWith<$Res> {
  factory _$$_LoadGroupsForUserCopyWith(_$_LoadGroupsForUser value,
          $Res Function(_$_LoadGroupsForUser) then) =
      __$$_LoadGroupsForUserCopyWithImpl<$Res>;
  $Res call({String userId, bool loadFromFile, bool loadFromServer});
}

/// @nodoc
class __$$_LoadGroupsForUserCopyWithImpl<$Res>
    extends _$GroupsEventCopyWithImpl<$Res>
    implements _$$_LoadGroupsForUserCopyWith<$Res> {
  __$$_LoadGroupsForUserCopyWithImpl(
      _$_LoadGroupsForUser _value, $Res Function(_$_LoadGroupsForUser) _then)
      : super(_value, (v) => _then(v as _$_LoadGroupsForUser));

  @override
  _$_LoadGroupsForUser get _value => super._value as _$_LoadGroupsForUser;

  @override
  $Res call({
    Object? userId = freezed,
    Object? loadFromFile = freezed,
    Object? loadFromServer = freezed,
  }) {
    return _then(_$_LoadGroupsForUser(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      loadFromFile: loadFromFile == freezed
          ? _value.loadFromFile
          : loadFromFile // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFromServer: loadFromServer == freezed
          ? _value.loadFromServer
          : loadFromServer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadGroupsForUser implements _LoadGroupsForUser {
  const _$_LoadGroupsForUser(
      {required this.userId,
      this.loadFromFile = true,
      this.loadFromServer = false});

  @override
  final String userId;
  @override
  @JsonKey()
  final bool loadFromFile;
  @override
  @JsonKey()
  final bool loadFromServer;

  @override
  String toString() {
    return 'GroupsEvent.loadGroupsForUser(userId: $userId, loadFromFile: $loadFromFile, loadFromServer: $loadFromServer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadGroupsForUser &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.loadFromFile, loadFromFile) &&
            const DeepCollectionEquality()
                .equals(other.loadFromServer, loadFromServer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(loadFromFile),
      const DeepCollectionEquality().hash(loadFromServer));

  @JsonKey(ignore: true)
  @override
  _$$_LoadGroupsForUserCopyWith<_$_LoadGroupsForUser> get copyWith =>
      __$$_LoadGroupsForUserCopyWithImpl<_$_LoadGroupsForUser>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userId, bool loadFromFile, bool loadFromServer)
        loadGroupsForUser,
    required TResult Function(bool loadFromFile, bool loadFromServer)
        loadGroups,
    required TResult Function() loadImages,
    required TResult Function(SharecationGroups groups) initialLoad,
    required TResult Function(String groupId, List<SharecationImage> images)
        patchImages,
    required TResult Function(List<SharecationEmptyGroup> groups) groupsLoaded,
    required TResult Function(String groupId, SharecationImage image)
        imageUpdated,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) {
    return loadGroupsForUser(userId, loadFromFile, loadFromServer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) {
    return loadGroupsForUser?.call(userId, loadFromFile, loadFromServer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
    required TResult orElse(),
  }) {
    if (loadGroupsForUser != null) {
      return loadGroupsForUser(userId, loadFromFile, loadFromServer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadGroupsForUser value) loadGroupsForUser,
    required TResult Function(_LoadGroups value) loadGroups,
    required TResult Function(_LoadImages value) loadImages,
    required TResult Function(_InitialLoadEvent value) initialLoad,
    required TResult Function(_PatchImagesEvent value) patchImages,
    required TResult Function(_GroupsLoadedEvent value) groupsLoaded,
    required TResult Function(_ImageUpdatedEvent value) imageUpdated,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) {
    return loadGroupsForUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) {
    return loadGroupsForUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
    required TResult orElse(),
  }) {
    if (loadGroupsForUser != null) {
      return loadGroupsForUser(this);
    }
    return orElse();
  }
}

abstract class _LoadGroupsForUser implements GroupsEvent {
  const factory _LoadGroupsForUser(
      {required final String userId,
      final bool loadFromFile,
      final bool loadFromServer}) = _$_LoadGroupsForUser;

  String get userId => throw _privateConstructorUsedError;
  bool get loadFromFile => throw _privateConstructorUsedError;
  bool get loadFromServer => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_LoadGroupsForUserCopyWith<_$_LoadGroupsForUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadGroupsCopyWith<$Res> {
  factory _$$_LoadGroupsCopyWith(
          _$_LoadGroups value, $Res Function(_$_LoadGroups) then) =
      __$$_LoadGroupsCopyWithImpl<$Res>;
  $Res call({bool loadFromFile, bool loadFromServer});
}

/// @nodoc
class __$$_LoadGroupsCopyWithImpl<$Res> extends _$GroupsEventCopyWithImpl<$Res>
    implements _$$_LoadGroupsCopyWith<$Res> {
  __$$_LoadGroupsCopyWithImpl(
      _$_LoadGroups _value, $Res Function(_$_LoadGroups) _then)
      : super(_value, (v) => _then(v as _$_LoadGroups));

  @override
  _$_LoadGroups get _value => super._value as _$_LoadGroups;

  @override
  $Res call({
    Object? loadFromFile = freezed,
    Object? loadFromServer = freezed,
  }) {
    return _then(_$_LoadGroups(
      loadFromFile: loadFromFile == freezed
          ? _value.loadFromFile
          : loadFromFile // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFromServer: loadFromServer == freezed
          ? _value.loadFromServer
          : loadFromServer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadGroups implements _LoadGroups {
  const _$_LoadGroups({this.loadFromFile = true, this.loadFromServer = false});

  @override
  @JsonKey()
  final bool loadFromFile;
  @override
  @JsonKey()
  final bool loadFromServer;

  @override
  String toString() {
    return 'GroupsEvent.loadGroups(loadFromFile: $loadFromFile, loadFromServer: $loadFromServer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadGroups &&
            const DeepCollectionEquality()
                .equals(other.loadFromFile, loadFromFile) &&
            const DeepCollectionEquality()
                .equals(other.loadFromServer, loadFromServer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadFromFile),
      const DeepCollectionEquality().hash(loadFromServer));

  @JsonKey(ignore: true)
  @override
  _$$_LoadGroupsCopyWith<_$_LoadGroups> get copyWith =>
      __$$_LoadGroupsCopyWithImpl<_$_LoadGroups>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userId, bool loadFromFile, bool loadFromServer)
        loadGroupsForUser,
    required TResult Function(bool loadFromFile, bool loadFromServer)
        loadGroups,
    required TResult Function() loadImages,
    required TResult Function(SharecationGroups groups) initialLoad,
    required TResult Function(String groupId, List<SharecationImage> images)
        patchImages,
    required TResult Function(List<SharecationEmptyGroup> groups) groupsLoaded,
    required TResult Function(String groupId, SharecationImage image)
        imageUpdated,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) {
    return loadGroups(loadFromFile, loadFromServer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) {
    return loadGroups?.call(loadFromFile, loadFromServer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
    required TResult orElse(),
  }) {
    if (loadGroups != null) {
      return loadGroups(loadFromFile, loadFromServer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadGroupsForUser value) loadGroupsForUser,
    required TResult Function(_LoadGroups value) loadGroups,
    required TResult Function(_LoadImages value) loadImages,
    required TResult Function(_InitialLoadEvent value) initialLoad,
    required TResult Function(_PatchImagesEvent value) patchImages,
    required TResult Function(_GroupsLoadedEvent value) groupsLoaded,
    required TResult Function(_ImageUpdatedEvent value) imageUpdated,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) {
    return loadGroups(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) {
    return loadGroups?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
    required TResult orElse(),
  }) {
    if (loadGroups != null) {
      return loadGroups(this);
    }
    return orElse();
  }
}

abstract class _LoadGroups implements GroupsEvent {
  const factory _LoadGroups(
      {final bool loadFromFile, final bool loadFromServer}) = _$_LoadGroups;

  bool get loadFromFile => throw _privateConstructorUsedError;
  bool get loadFromServer => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_LoadGroupsCopyWith<_$_LoadGroups> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadImagesCopyWith<$Res> {
  factory _$$_LoadImagesCopyWith(
          _$_LoadImages value, $Res Function(_$_LoadImages) then) =
      __$$_LoadImagesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadImagesCopyWithImpl<$Res> extends _$GroupsEventCopyWithImpl<$Res>
    implements _$$_LoadImagesCopyWith<$Res> {
  __$$_LoadImagesCopyWithImpl(
      _$_LoadImages _value, $Res Function(_$_LoadImages) _then)
      : super(_value, (v) => _then(v as _$_LoadImages));

  @override
  _$_LoadImages get _value => super._value as _$_LoadImages;
}

/// @nodoc

class _$_LoadImages implements _LoadImages {
  const _$_LoadImages();

  @override
  String toString() {
    return 'GroupsEvent.loadImages()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadImages);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userId, bool loadFromFile, bool loadFromServer)
        loadGroupsForUser,
    required TResult Function(bool loadFromFile, bool loadFromServer)
        loadGroups,
    required TResult Function() loadImages,
    required TResult Function(SharecationGroups groups) initialLoad,
    required TResult Function(String groupId, List<SharecationImage> images)
        patchImages,
    required TResult Function(List<SharecationEmptyGroup> groups) groupsLoaded,
    required TResult Function(String groupId, SharecationImage image)
        imageUpdated,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) {
    return loadImages();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) {
    return loadImages?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
    required TResult orElse(),
  }) {
    if (loadImages != null) {
      return loadImages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadGroupsForUser value) loadGroupsForUser,
    required TResult Function(_LoadGroups value) loadGroups,
    required TResult Function(_LoadImages value) loadImages,
    required TResult Function(_InitialLoadEvent value) initialLoad,
    required TResult Function(_PatchImagesEvent value) patchImages,
    required TResult Function(_GroupsLoadedEvent value) groupsLoaded,
    required TResult Function(_ImageUpdatedEvent value) imageUpdated,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) {
    return loadImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) {
    return loadImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
    required TResult orElse(),
  }) {
    if (loadImages != null) {
      return loadImages(this);
    }
    return orElse();
  }
}

abstract class _LoadImages implements GroupsEvent {
  const factory _LoadImages() = _$_LoadImages;
}

/// @nodoc
abstract class _$$_InitialLoadEventCopyWith<$Res> {
  factory _$$_InitialLoadEventCopyWith(
          _$_InitialLoadEvent value, $Res Function(_$_InitialLoadEvent) then) =
      __$$_InitialLoadEventCopyWithImpl<$Res>;
  $Res call({SharecationGroups groups});

  $SharecationGroupsCopyWith<$Res> get groups;
}

/// @nodoc
class __$$_InitialLoadEventCopyWithImpl<$Res>
    extends _$GroupsEventCopyWithImpl<$Res>
    implements _$$_InitialLoadEventCopyWith<$Res> {
  __$$_InitialLoadEventCopyWithImpl(
      _$_InitialLoadEvent _value, $Res Function(_$_InitialLoadEvent) _then)
      : super(_value, (v) => _then(v as _$_InitialLoadEvent));

  @override
  _$_InitialLoadEvent get _value => super._value as _$_InitialLoadEvent;

  @override
  $Res call({
    Object? groups = freezed,
  }) {
    return _then(_$_InitialLoadEvent(
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as SharecationGroups,
    ));
  }

  @override
  $SharecationGroupsCopyWith<$Res> get groups {
    return $SharecationGroupsCopyWith<$Res>(_value.groups, (value) {
      return _then(_value.copyWith(groups: value));
    });
  }
}

/// @nodoc

class _$_InitialLoadEvent implements _InitialLoadEvent {
  const _$_InitialLoadEvent({required this.groups});

  @override
  final SharecationGroups groups;

  @override
  String toString() {
    return 'GroupsEvent.initialLoad(groups: $groups)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitialLoadEvent &&
            const DeepCollectionEquality().equals(other.groups, groups));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(groups));

  @JsonKey(ignore: true)
  @override
  _$$_InitialLoadEventCopyWith<_$_InitialLoadEvent> get copyWith =>
      __$$_InitialLoadEventCopyWithImpl<_$_InitialLoadEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userId, bool loadFromFile, bool loadFromServer)
        loadGroupsForUser,
    required TResult Function(bool loadFromFile, bool loadFromServer)
        loadGroups,
    required TResult Function() loadImages,
    required TResult Function(SharecationGroups groups) initialLoad,
    required TResult Function(String groupId, List<SharecationImage> images)
        patchImages,
    required TResult Function(List<SharecationEmptyGroup> groups) groupsLoaded,
    required TResult Function(String groupId, SharecationImage image)
        imageUpdated,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) {
    return initialLoad(groups);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) {
    return initialLoad?.call(groups);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
    required TResult orElse(),
  }) {
    if (initialLoad != null) {
      return initialLoad(groups);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadGroupsForUser value) loadGroupsForUser,
    required TResult Function(_LoadGroups value) loadGroups,
    required TResult Function(_LoadImages value) loadImages,
    required TResult Function(_InitialLoadEvent value) initialLoad,
    required TResult Function(_PatchImagesEvent value) patchImages,
    required TResult Function(_GroupsLoadedEvent value) groupsLoaded,
    required TResult Function(_ImageUpdatedEvent value) imageUpdated,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) {
    return initialLoad(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) {
    return initialLoad?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
    required TResult orElse(),
  }) {
    if (initialLoad != null) {
      return initialLoad(this);
    }
    return orElse();
  }
}

abstract class _InitialLoadEvent implements GroupsEvent {
  const factory _InitialLoadEvent({required final SharecationGroups groups}) =
      _$_InitialLoadEvent;

  SharecationGroups get groups => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_InitialLoadEventCopyWith<_$_InitialLoadEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PatchImagesEventCopyWith<$Res> {
  factory _$$_PatchImagesEventCopyWith(
          _$_PatchImagesEvent value, $Res Function(_$_PatchImagesEvent) then) =
      __$$_PatchImagesEventCopyWithImpl<$Res>;
  $Res call({String groupId, List<SharecationImage> images});
}

/// @nodoc
class __$$_PatchImagesEventCopyWithImpl<$Res>
    extends _$GroupsEventCopyWithImpl<$Res>
    implements _$$_PatchImagesEventCopyWith<$Res> {
  __$$_PatchImagesEventCopyWithImpl(
      _$_PatchImagesEvent _value, $Res Function(_$_PatchImagesEvent) _then)
      : super(_value, (v) => _then(v as _$_PatchImagesEvent));

  @override
  _$_PatchImagesEvent get _value => super._value as _$_PatchImagesEvent;

  @override
  $Res call({
    Object? groupId = freezed,
    Object? images = freezed,
  }) {
    return _then(_$_PatchImagesEvent(
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<SharecationImage>,
    ));
  }
}

/// @nodoc

class _$_PatchImagesEvent implements _PatchImagesEvent {
  const _$_PatchImagesEvent(
      {required this.groupId, required final List<SharecationImage> images})
      : _images = images;

  @override
  final String groupId;
  final List<SharecationImage> _images;
  @override
  List<SharecationImage> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'GroupsEvent.patchImages(groupId: $groupId, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatchImagesEvent &&
            const DeepCollectionEquality().equals(other.groupId, groupId) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(groupId),
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  _$$_PatchImagesEventCopyWith<_$_PatchImagesEvent> get copyWith =>
      __$$_PatchImagesEventCopyWithImpl<_$_PatchImagesEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userId, bool loadFromFile, bool loadFromServer)
        loadGroupsForUser,
    required TResult Function(bool loadFromFile, bool loadFromServer)
        loadGroups,
    required TResult Function() loadImages,
    required TResult Function(SharecationGroups groups) initialLoad,
    required TResult Function(String groupId, List<SharecationImage> images)
        patchImages,
    required TResult Function(List<SharecationEmptyGroup> groups) groupsLoaded,
    required TResult Function(String groupId, SharecationImage image)
        imageUpdated,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) {
    return patchImages(groupId, images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) {
    return patchImages?.call(groupId, images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
    required TResult orElse(),
  }) {
    if (patchImages != null) {
      return patchImages(groupId, images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadGroupsForUser value) loadGroupsForUser,
    required TResult Function(_LoadGroups value) loadGroups,
    required TResult Function(_LoadImages value) loadImages,
    required TResult Function(_InitialLoadEvent value) initialLoad,
    required TResult Function(_PatchImagesEvent value) patchImages,
    required TResult Function(_GroupsLoadedEvent value) groupsLoaded,
    required TResult Function(_ImageUpdatedEvent value) imageUpdated,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) {
    return patchImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) {
    return patchImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
    required TResult orElse(),
  }) {
    if (patchImages != null) {
      return patchImages(this);
    }
    return orElse();
  }
}

abstract class _PatchImagesEvent implements GroupsEvent {
  const factory _PatchImagesEvent(
      {required final String groupId,
      required final List<SharecationImage> images}) = _$_PatchImagesEvent;

  String get groupId => throw _privateConstructorUsedError;
  List<SharecationImage> get images => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_PatchImagesEventCopyWith<_$_PatchImagesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GroupsLoadedEventCopyWith<$Res> {
  factory _$$_GroupsLoadedEventCopyWith(_$_GroupsLoadedEvent value,
          $Res Function(_$_GroupsLoadedEvent) then) =
      __$$_GroupsLoadedEventCopyWithImpl<$Res>;
  $Res call({List<SharecationEmptyGroup> groups});
}

/// @nodoc
class __$$_GroupsLoadedEventCopyWithImpl<$Res>
    extends _$GroupsEventCopyWithImpl<$Res>
    implements _$$_GroupsLoadedEventCopyWith<$Res> {
  __$$_GroupsLoadedEventCopyWithImpl(
      _$_GroupsLoadedEvent _value, $Res Function(_$_GroupsLoadedEvent) _then)
      : super(_value, (v) => _then(v as _$_GroupsLoadedEvent));

  @override
  _$_GroupsLoadedEvent get _value => super._value as _$_GroupsLoadedEvent;

  @override
  $Res call({
    Object? groups = freezed,
  }) {
    return _then(_$_GroupsLoadedEvent(
      groups: groups == freezed
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<SharecationEmptyGroup>,
    ));
  }
}

/// @nodoc

class _$_GroupsLoadedEvent implements _GroupsLoadedEvent {
  const _$_GroupsLoadedEvent(
      {required final List<SharecationEmptyGroup> groups})
      : _groups = groups;

  final List<SharecationEmptyGroup> _groups;
  @override
  List<SharecationEmptyGroup> get groups {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  String toString() {
    return 'GroupsEvent.groupsLoaded(groups: $groups)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GroupsLoadedEvent &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_groups));

  @JsonKey(ignore: true)
  @override
  _$$_GroupsLoadedEventCopyWith<_$_GroupsLoadedEvent> get copyWith =>
      __$$_GroupsLoadedEventCopyWithImpl<_$_GroupsLoadedEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userId, bool loadFromFile, bool loadFromServer)
        loadGroupsForUser,
    required TResult Function(bool loadFromFile, bool loadFromServer)
        loadGroups,
    required TResult Function() loadImages,
    required TResult Function(SharecationGroups groups) initialLoad,
    required TResult Function(String groupId, List<SharecationImage> images)
        patchImages,
    required TResult Function(List<SharecationEmptyGroup> groups) groupsLoaded,
    required TResult Function(String groupId, SharecationImage image)
        imageUpdated,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) {
    return groupsLoaded(groups);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) {
    return groupsLoaded?.call(groups);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
    required TResult orElse(),
  }) {
    if (groupsLoaded != null) {
      return groupsLoaded(groups);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadGroupsForUser value) loadGroupsForUser,
    required TResult Function(_LoadGroups value) loadGroups,
    required TResult Function(_LoadImages value) loadImages,
    required TResult Function(_InitialLoadEvent value) initialLoad,
    required TResult Function(_PatchImagesEvent value) patchImages,
    required TResult Function(_GroupsLoadedEvent value) groupsLoaded,
    required TResult Function(_ImageUpdatedEvent value) imageUpdated,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) {
    return groupsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) {
    return groupsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
    required TResult orElse(),
  }) {
    if (groupsLoaded != null) {
      return groupsLoaded(this);
    }
    return orElse();
  }
}

abstract class _GroupsLoadedEvent implements GroupsEvent {
  const factory _GroupsLoadedEvent(
          {required final List<SharecationEmptyGroup> groups}) =
      _$_GroupsLoadedEvent;

  List<SharecationEmptyGroup> get groups => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_GroupsLoadedEventCopyWith<_$_GroupsLoadedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ImageUpdatedEventCopyWith<$Res> {
  factory _$$_ImageUpdatedEventCopyWith(_$_ImageUpdatedEvent value,
          $Res Function(_$_ImageUpdatedEvent) then) =
      __$$_ImageUpdatedEventCopyWithImpl<$Res>;
  $Res call({String groupId, SharecationImage image});

  $SharecationImageCopyWith<$Res> get image;
}

/// @nodoc
class __$$_ImageUpdatedEventCopyWithImpl<$Res>
    extends _$GroupsEventCopyWithImpl<$Res>
    implements _$$_ImageUpdatedEventCopyWith<$Res> {
  __$$_ImageUpdatedEventCopyWithImpl(
      _$_ImageUpdatedEvent _value, $Res Function(_$_ImageUpdatedEvent) _then)
      : super(_value, (v) => _then(v as _$_ImageUpdatedEvent));

  @override
  _$_ImageUpdatedEvent get _value => super._value as _$_ImageUpdatedEvent;

  @override
  $Res call({
    Object? groupId = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_ImageUpdatedEvent(
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as SharecationImage,
    ));
  }

  @override
  $SharecationImageCopyWith<$Res> get image {
    return $SharecationImageCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc

class _$_ImageUpdatedEvent implements _ImageUpdatedEvent {
  const _$_ImageUpdatedEvent({required this.groupId, required this.image});

  @override
  final String groupId;
  @override
  final SharecationImage image;

  @override
  String toString() {
    return 'GroupsEvent.imageUpdated(groupId: $groupId, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageUpdatedEvent &&
            const DeepCollectionEquality().equals(other.groupId, groupId) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(groupId),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_ImageUpdatedEventCopyWith<_$_ImageUpdatedEvent> get copyWith =>
      __$$_ImageUpdatedEventCopyWithImpl<_$_ImageUpdatedEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userId, bool loadFromFile, bool loadFromServer)
        loadGroupsForUser,
    required TResult Function(bool loadFromFile, bool loadFromServer)
        loadGroups,
    required TResult Function() loadImages,
    required TResult Function(SharecationGroups groups) initialLoad,
    required TResult Function(String groupId, List<SharecationImage> images)
        patchImages,
    required TResult Function(List<SharecationEmptyGroup> groups) groupsLoaded,
    required TResult Function(String groupId, SharecationImage image)
        imageUpdated,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) {
    return imageUpdated(groupId, image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) {
    return imageUpdated?.call(groupId, image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
    required TResult orElse(),
  }) {
    if (imageUpdated != null) {
      return imageUpdated(groupId, image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadGroupsForUser value) loadGroupsForUser,
    required TResult Function(_LoadGroups value) loadGroups,
    required TResult Function(_LoadImages value) loadImages,
    required TResult Function(_InitialLoadEvent value) initialLoad,
    required TResult Function(_PatchImagesEvent value) patchImages,
    required TResult Function(_GroupsLoadedEvent value) groupsLoaded,
    required TResult Function(_ImageUpdatedEvent value) imageUpdated,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) {
    return imageUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) {
    return imageUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
    required TResult orElse(),
  }) {
    if (imageUpdated != null) {
      return imageUpdated(this);
    }
    return orElse();
  }
}

abstract class _ImageUpdatedEvent implements GroupsEvent {
  const factory _ImageUpdatedEvent(
      {required final String groupId,
      required final SharecationImage image}) = _$_ImageUpdatedEvent;

  String get groupId => throw _privateConstructorUsedError;
  SharecationImage get image => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ImageUpdatedEventCopyWith<_$_ImageUpdatedEvent> get copyWith =>
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
    required TResult Function(
            String userId, bool loadFromFile, bool loadFromServer)
        loadGroupsForUser,
    required TResult Function(bool loadFromFile, bool loadFromServer)
        loadGroups,
    required TResult Function() loadImages,
    required TResult Function(SharecationGroups groups) initialLoad,
    required TResult Function(String groupId, List<SharecationImage> images)
        patchImages,
    required TResult Function(List<SharecationEmptyGroup> groups) groupsLoaded,
    required TResult Function(String groupId, SharecationImage image)
        imageUpdated,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) {
    return selectEvent(groupId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) {
    return selectEvent?.call(groupId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
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
    required TResult Function(_LoadGroupsForUser value) loadGroupsForUser,
    required TResult Function(_LoadGroups value) loadGroups,
    required TResult Function(_LoadImages value) loadImages,
    required TResult Function(_InitialLoadEvent value) initialLoad,
    required TResult Function(_PatchImagesEvent value) patchImages,
    required TResult Function(_GroupsLoadedEvent value) groupsLoaded,
    required TResult Function(_ImageUpdatedEvent value) imageUpdated,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) {
    return selectEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) {
    return selectEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
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
    required TResult Function(
            String userId, bool loadFromFile, bool loadFromServer)
        loadGroupsForUser,
    required TResult Function(bool loadFromFile, bool loadFromServer)
        loadGroups,
    required TResult Function() loadImages,
    required TResult Function(SharecationGroups groups) initialLoad,
    required TResult Function(String groupId, List<SharecationImage> images)
        patchImages,
    required TResult Function(List<SharecationEmptyGroup> groups) groupsLoaded,
    required TResult Function(String groupId, SharecationImage image)
        imageUpdated,
    required TResult Function(String groupId) selectEvent,
    required TResult Function(String name) addEvent,
  }) {
    return addEvent(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
    TResult Function(String groupId)? selectEvent,
    TResult Function(String name)? addEvent,
  }) {
    return addEvent?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, bool loadFromFile, bool loadFromServer)?
        loadGroupsForUser,
    TResult Function(bool loadFromFile, bool loadFromServer)? loadGroups,
    TResult Function()? loadImages,
    TResult Function(SharecationGroups groups)? initialLoad,
    TResult Function(String groupId, List<SharecationImage> images)?
        patchImages,
    TResult Function(List<SharecationEmptyGroup> groups)? groupsLoaded,
    TResult Function(String groupId, SharecationImage image)? imageUpdated,
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
    required TResult Function(_LoadGroupsForUser value) loadGroupsForUser,
    required TResult Function(_LoadGroups value) loadGroups,
    required TResult Function(_LoadImages value) loadImages,
    required TResult Function(_InitialLoadEvent value) initialLoad,
    required TResult Function(_PatchImagesEvent value) patchImages,
    required TResult Function(_GroupsLoadedEvent value) groupsLoaded,
    required TResult Function(_ImageUpdatedEvent value) imageUpdated,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_AddEvent value) addEvent,
  }) {
    return addEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_AddEvent value)? addEvent,
  }) {
    return addEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGroupsForUser value)? loadGroupsForUser,
    TResult Function(_LoadGroups value)? loadGroups,
    TResult Function(_LoadImages value)? loadImages,
    TResult Function(_InitialLoadEvent value)? initialLoad,
    TResult Function(_PatchImagesEvent value)? patchImages,
    TResult Function(_GroupsLoadedEvent value)? groupsLoaded,
    TResult Function(_ImageUpdatedEvent value)? imageUpdated,
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
    required TResult Function(SharecationGroups state, String userId)
        loadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(SharecationGroups state, String userId)? loadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(SharecationGroups state, String userId)? loadedState,
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
    required TResult Function(SharecationGroups state, String userId)
        loadedState,
  }) {
    return loadingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(SharecationGroups state, String userId)? loadedState,
  }) {
    return loadingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(SharecationGroups state, String userId)? loadedState,
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
  $Res call({SharecationGroups state, String userId});

  $SharecationGroupsCopyWith<$Res> get state;
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
    Object? state = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_LoadedState(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SharecationGroups,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $SharecationGroupsCopyWith<$Res> get state {
    return $SharecationGroupsCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$_LoadedState implements _LoadedState {
  const _$_LoadedState({required this.state, required this.userId});

  @override
  final SharecationGroups state;
  @override
  final String userId;

  @override
  String toString() {
    return 'GroupsState.loadedState(state: $state, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedState &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_LoadedStateCopyWith<_$_LoadedState> get copyWith =>
      __$$_LoadedStateCopyWithImpl<_$_LoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingState,
    required TResult Function(SharecationGroups state, String userId)
        loadedState,
  }) {
    return loadedState(state, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(SharecationGroups state, String userId)? loadedState,
  }) {
    return loadedState?.call(state, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(SharecationGroups state, String userId)? loadedState,
    required TResult orElse(),
  }) {
    if (loadedState != null) {
      return loadedState(state, userId);
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
      {required final SharecationGroups state,
      required final String userId}) = _$_LoadedState;

  SharecationGroups get state => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
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
  String get groupId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
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
  $Res call(
      {String groupId, String name, Map<String, SharecationImage> images});
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
    Object? groupId = freezed,
    Object? name = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call(
      {String groupId, String name, Map<String, SharecationImage> images});
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
    Object? groupId = freezed,
    Object? name = freezed,
    Object? images = freezed,
  }) {
    return _then(_$_SharecationGroup(
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
      {required this.groupId,
      required this.name,
      required final Map<String, SharecationImage> images})
      : _images = images;

  factory _$_SharecationGroup.fromJson(Map<String, dynamic> json) =>
      _$$_SharecationGroupFromJson(json);

  @override
  final String groupId;
  @override
  final String name;
  final Map<String, SharecationImage> _images;
  @override
  Map<String, SharecationImage> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_images);
  }

  @override
  String toString() {
    return 'SharecationGroup(groupId: $groupId, name: $name, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SharecationGroup &&
            const DeepCollectionEquality().equals(other.groupId, groupId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(groupId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_images));

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
          {required final String groupId,
          required final String name,
          required final Map<String, SharecationImage> images}) =
      _$_SharecationGroup;

  factory _SharecationGroup.fromJson(Map<String, dynamic> json) =
      _$_SharecationGroup.fromJson;

  @override
  String get groupId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  Map<String, SharecationImage> get images =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SharecationGroupCopyWith<_$_SharecationGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SharecationEmptyGroup {
  String get groupId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SharecationEmptyGroupCopyWith<SharecationEmptyGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharecationEmptyGroupCopyWith<$Res> {
  factory $SharecationEmptyGroupCopyWith(SharecationEmptyGroup value,
          $Res Function(SharecationEmptyGroup) then) =
      _$SharecationEmptyGroupCopyWithImpl<$Res>;
  $Res call({String groupId, String name});
}

/// @nodoc
class _$SharecationEmptyGroupCopyWithImpl<$Res>
    implements $SharecationEmptyGroupCopyWith<$Res> {
  _$SharecationEmptyGroupCopyWithImpl(this._value, this._then);

  final SharecationEmptyGroup _value;
  // ignore: unused_field
  final $Res Function(SharecationEmptyGroup) _then;

  @override
  $Res call({
    Object? groupId = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SharecationEmptyGroupCopyWith<$Res>
    implements $SharecationEmptyGroupCopyWith<$Res> {
  factory _$$_SharecationEmptyGroupCopyWith(_$_SharecationEmptyGroup value,
          $Res Function(_$_SharecationEmptyGroup) then) =
      __$$_SharecationEmptyGroupCopyWithImpl<$Res>;
  @override
  $Res call({String groupId, String name});
}

/// @nodoc
class __$$_SharecationEmptyGroupCopyWithImpl<$Res>
    extends _$SharecationEmptyGroupCopyWithImpl<$Res>
    implements _$$_SharecationEmptyGroupCopyWith<$Res> {
  __$$_SharecationEmptyGroupCopyWithImpl(_$_SharecationEmptyGroup _value,
      $Res Function(_$_SharecationEmptyGroup) _then)
      : super(_value, (v) => _then(v as _$_SharecationEmptyGroup));

  @override
  _$_SharecationEmptyGroup get _value =>
      super._value as _$_SharecationEmptyGroup;

  @override
  $Res call({
    Object? groupId = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_SharecationEmptyGroup(
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SharecationEmptyGroup extends _SharecationEmptyGroup {
  const _$_SharecationEmptyGroup({required this.groupId, required this.name})
      : super._();

  @override
  final String groupId;
  @override
  final String name;

  @override
  String toString() {
    return 'SharecationEmptyGroup(groupId: $groupId, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SharecationEmptyGroup &&
            const DeepCollectionEquality().equals(other.groupId, groupId) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(groupId),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_SharecationEmptyGroupCopyWith<_$_SharecationEmptyGroup> get copyWith =>
      __$$_SharecationEmptyGroupCopyWithImpl<_$_SharecationEmptyGroup>(
          this, _$identity);
}

abstract class _SharecationEmptyGroup extends SharecationEmptyGroup {
  const factory _SharecationEmptyGroup(
      {required final String groupId,
      required final String name}) = _$_SharecationEmptyGroup;
  const _SharecationEmptyGroup._() : super._();

  @override
  String get groupId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SharecationEmptyGroupCopyWith<_$_SharecationEmptyGroup> get copyWith =>
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
