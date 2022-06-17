// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) signedInEvent,
    required TResult Function() signedOutEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? signedInEvent,
    TResult Function()? signedOutEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? signedInEvent,
    TResult Function()? signedOutEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignedInEvent value) signedInEvent,
    required TResult Function(_SignedOutEvent value) signedOutEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignedInEvent value)? signedInEvent,
    TResult Function(_SignedOutEvent value)? signedOutEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignedInEvent value)? signedInEvent,
    TResult Function(_SignedOutEvent value)? signedOutEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  final AuthenticationEvent _value;
  // ignore: unused_field
  final $Res Function(AuthenticationEvent) _then;
}

/// @nodoc
abstract class _$$_SignedInEventCopyWith<$Res> {
  factory _$$_SignedInEventCopyWith(
          _$_SignedInEvent value, $Res Function(_$_SignedInEvent) then) =
      __$$_SignedInEventCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class __$$_SignedInEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$$_SignedInEventCopyWith<$Res> {
  __$$_SignedInEventCopyWithImpl(
      _$_SignedInEvent _value, $Res Function(_$_SignedInEvent) _then)
      : super(_value, (v) => _then(v as _$_SignedInEvent));

  @override
  _$_SignedInEvent get _value => super._value as _$_SignedInEvent;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$_SignedInEvent(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignedInEvent implements _SignedInEvent {
  const _$_SignedInEvent({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'AuthenticationEvent.signedInEvent(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignedInEvent &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_SignedInEventCopyWith<_$_SignedInEvent> get copyWith =>
      __$$_SignedInEventCopyWithImpl<_$_SignedInEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) signedInEvent,
    required TResult Function() signedOutEvent,
  }) {
    return signedInEvent(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? signedInEvent,
    TResult Function()? signedOutEvent,
  }) {
    return signedInEvent?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? signedInEvent,
    TResult Function()? signedOutEvent,
    required TResult orElse(),
  }) {
    if (signedInEvent != null) {
      return signedInEvent(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignedInEvent value) signedInEvent,
    required TResult Function(_SignedOutEvent value) signedOutEvent,
  }) {
    return signedInEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignedInEvent value)? signedInEvent,
    TResult Function(_SignedOutEvent value)? signedOutEvent,
  }) {
    return signedInEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignedInEvent value)? signedInEvent,
    TResult Function(_SignedOutEvent value)? signedOutEvent,
    required TResult orElse(),
  }) {
    if (signedInEvent != null) {
      return signedInEvent(this);
    }
    return orElse();
  }
}

abstract class _SignedInEvent implements AuthenticationEvent {
  const factory _SignedInEvent({required final String userId}) =
      _$_SignedInEvent;

  String get userId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_SignedInEventCopyWith<_$_SignedInEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignedOutEventCopyWith<$Res> {
  factory _$$_SignedOutEventCopyWith(
          _$_SignedOutEvent value, $Res Function(_$_SignedOutEvent) then) =
      __$$_SignedOutEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignedOutEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$$_SignedOutEventCopyWith<$Res> {
  __$$_SignedOutEventCopyWithImpl(
      _$_SignedOutEvent _value, $Res Function(_$_SignedOutEvent) _then)
      : super(_value, (v) => _then(v as _$_SignedOutEvent));

  @override
  _$_SignedOutEvent get _value => super._value as _$_SignedOutEvent;
}

/// @nodoc

class _$_SignedOutEvent implements _SignedOutEvent {
  const _$_SignedOutEvent();

  @override
  String toString() {
    return 'AuthenticationEvent.signedOutEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignedOutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) signedInEvent,
    required TResult Function() signedOutEvent,
  }) {
    return signedOutEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? signedInEvent,
    TResult Function()? signedOutEvent,
  }) {
    return signedOutEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? signedInEvent,
    TResult Function()? signedOutEvent,
    required TResult orElse(),
  }) {
    if (signedOutEvent != null) {
      return signedOutEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignedInEvent value) signedInEvent,
    required TResult Function(_SignedOutEvent value) signedOutEvent,
  }) {
    return signedOutEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignedInEvent value)? signedInEvent,
    TResult Function(_SignedOutEvent value)? signedOutEvent,
  }) {
    return signedOutEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignedInEvent value)? signedInEvent,
    TResult Function(_SignedOutEvent value)? signedOutEvent,
    required TResult orElse(),
  }) {
    if (signedOutEvent != null) {
      return signedOutEvent(this);
    }
    return orElse();
  }
}

abstract class _SignedOutEvent implements AuthenticationEvent {
  const factory _SignedOutEvent() = _$_SignedOutEvent;
}

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() unAuthenticatedState,
    required TResult Function(String userId) signedInState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? unAuthenticatedState,
    TResult Function(String userId)? signedInState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? unAuthenticatedState,
    TResult Function(String userId)? signedInState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initialState,
    required TResult Function(_UnAuthenticatedState value) unAuthenticatedState,
    required TResult Function(_SignedInState value) signedInState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    TResult Function(_UnAuthenticatedState value)? unAuthenticatedState,
    TResult Function(_SignedInState value)? signedInState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    TResult Function(_UnAuthenticatedState value)? unAuthenticatedState,
    TResult Function(_SignedInState value)? signedInState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;
}

/// @nodoc
abstract class _$$_InitialStateCopyWith<$Res> {
  factory _$$_InitialStateCopyWith(
          _$_InitialState value, $Res Function(_$_InitialState) then) =
      __$$_InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$_InitialStateCopyWith<$Res> {
  __$$_InitialStateCopyWithImpl(
      _$_InitialState _value, $Res Function(_$_InitialState) _then)
      : super(_value, (v) => _then(v as _$_InitialState));

  @override
  _$_InitialState get _value => super._value as _$_InitialState;
}

/// @nodoc

class _$_InitialState implements _InitialState {
  const _$_InitialState();

  @override
  String toString() {
    return 'AuthenticationState.initialState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() unAuthenticatedState,
    required TResult Function(String userId) signedInState,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? unAuthenticatedState,
    TResult Function(String userId)? signedInState,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? unAuthenticatedState,
    TResult Function(String userId)? signedInState,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initialState,
    required TResult Function(_UnAuthenticatedState value) unAuthenticatedState,
    required TResult Function(_SignedInState value) signedInState,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    TResult Function(_UnAuthenticatedState value)? unAuthenticatedState,
    TResult Function(_SignedInState value)? signedInState,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    TResult Function(_UnAuthenticatedState value)? unAuthenticatedState,
    TResult Function(_SignedInState value)? signedInState,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class _InitialState implements AuthenticationState {
  const factory _InitialState() = _$_InitialState;
}

/// @nodoc
abstract class _$$_UnAuthenticatedStateCopyWith<$Res> {
  factory _$$_UnAuthenticatedStateCopyWith(_$_UnAuthenticatedState value,
          $Res Function(_$_UnAuthenticatedState) then) =
      __$$_UnAuthenticatedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnAuthenticatedStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$_UnAuthenticatedStateCopyWith<$Res> {
  __$$_UnAuthenticatedStateCopyWithImpl(_$_UnAuthenticatedState _value,
      $Res Function(_$_UnAuthenticatedState) _then)
      : super(_value, (v) => _then(v as _$_UnAuthenticatedState));

  @override
  _$_UnAuthenticatedState get _value => super._value as _$_UnAuthenticatedState;
}

/// @nodoc

class _$_UnAuthenticatedState implements _UnAuthenticatedState {
  const _$_UnAuthenticatedState();

  @override
  String toString() {
    return 'AuthenticationState.unAuthenticatedState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnAuthenticatedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() unAuthenticatedState,
    required TResult Function(String userId) signedInState,
  }) {
    return unAuthenticatedState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? unAuthenticatedState,
    TResult Function(String userId)? signedInState,
  }) {
    return unAuthenticatedState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? unAuthenticatedState,
    TResult Function(String userId)? signedInState,
    required TResult orElse(),
  }) {
    if (unAuthenticatedState != null) {
      return unAuthenticatedState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initialState,
    required TResult Function(_UnAuthenticatedState value) unAuthenticatedState,
    required TResult Function(_SignedInState value) signedInState,
  }) {
    return unAuthenticatedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    TResult Function(_UnAuthenticatedState value)? unAuthenticatedState,
    TResult Function(_SignedInState value)? signedInState,
  }) {
    return unAuthenticatedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    TResult Function(_UnAuthenticatedState value)? unAuthenticatedState,
    TResult Function(_SignedInState value)? signedInState,
    required TResult orElse(),
  }) {
    if (unAuthenticatedState != null) {
      return unAuthenticatedState(this);
    }
    return orElse();
  }
}

abstract class _UnAuthenticatedState implements AuthenticationState {
  const factory _UnAuthenticatedState() = _$_UnAuthenticatedState;
}

/// @nodoc
abstract class _$$_SignedInStateCopyWith<$Res> {
  factory _$$_SignedInStateCopyWith(
          _$_SignedInState value, $Res Function(_$_SignedInState) then) =
      __$$_SignedInStateCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class __$$_SignedInStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$_SignedInStateCopyWith<$Res> {
  __$$_SignedInStateCopyWithImpl(
      _$_SignedInState _value, $Res Function(_$_SignedInState) _then)
      : super(_value, (v) => _then(v as _$_SignedInState));

  @override
  _$_SignedInState get _value => super._value as _$_SignedInState;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$_SignedInState(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignedInState implements _SignedInState {
  const _$_SignedInState({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'AuthenticationState.signedInState(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignedInState &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_SignedInStateCopyWith<_$_SignedInState> get copyWith =>
      __$$_SignedInStateCopyWithImpl<_$_SignedInState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() unAuthenticatedState,
    required TResult Function(String userId) signedInState,
  }) {
    return signedInState(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? unAuthenticatedState,
    TResult Function(String userId)? signedInState,
  }) {
    return signedInState?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? unAuthenticatedState,
    TResult Function(String userId)? signedInState,
    required TResult orElse(),
  }) {
    if (signedInState != null) {
      return signedInState(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initialState,
    required TResult Function(_UnAuthenticatedState value) unAuthenticatedState,
    required TResult Function(_SignedInState value) signedInState,
  }) {
    return signedInState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    TResult Function(_UnAuthenticatedState value)? unAuthenticatedState,
    TResult Function(_SignedInState value)? signedInState,
  }) {
    return signedInState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    TResult Function(_UnAuthenticatedState value)? unAuthenticatedState,
    TResult Function(_SignedInState value)? signedInState,
    required TResult orElse(),
  }) {
    if (signedInState != null) {
      return signedInState(this);
    }
    return orElse();
  }
}

abstract class _SignedInState implements AuthenticationState {
  const factory _SignedInState({required final String userId}) =
      _$_SignedInState;

  String get userId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_SignedInStateCopyWith<_$_SignedInState> get copyWith =>
      throw _privateConstructorUsedError;
}
