// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_drawer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserDrawerState {
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDrawerStateCopyWith<UserDrawerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDrawerStateCopyWith<$Res> {
  factory $UserDrawerStateCopyWith(
          UserDrawerState value, $Res Function(UserDrawerState) then) =
      _$UserDrawerStateCopyWithImpl<$Res, UserDrawerState>;
  @useResult
  $Res call({Status status, String errorMessage});
}

/// @nodoc
class _$UserDrawerStateCopyWithImpl<$Res, $Val extends UserDrawerState>
    implements $UserDrawerStateCopyWith<$Res> {
  _$UserDrawerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDrawerStateImplCopyWith<$Res>
    implements $UserDrawerStateCopyWith<$Res> {
  factory _$$UserDrawerStateImplCopyWith(_$UserDrawerStateImpl value,
          $Res Function(_$UserDrawerStateImpl) then) =
      __$$UserDrawerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, String errorMessage});
}

/// @nodoc
class __$$UserDrawerStateImplCopyWithImpl<$Res>
    extends _$UserDrawerStateCopyWithImpl<$Res, _$UserDrawerStateImpl>
    implements _$$UserDrawerStateImplCopyWith<$Res> {
  __$$UserDrawerStateImplCopyWithImpl(
      _$UserDrawerStateImpl _value, $Res Function(_$UserDrawerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$UserDrawerStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserDrawerStateImpl implements _UserDrawerState {
  _$UserDrawerStateImpl({this.status = Status.initial, this.errorMessage = ''});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'UserDrawerState(status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDrawerStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDrawerStateImplCopyWith<_$UserDrawerStateImpl> get copyWith =>
      __$$UserDrawerStateImplCopyWithImpl<_$UserDrawerStateImpl>(
          this, _$identity);
}

abstract class _UserDrawerState implements UserDrawerState {
  factory _UserDrawerState({final Status status, final String errorMessage}) =
      _$UserDrawerStateImpl;

  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$UserDrawerStateImplCopyWith<_$UserDrawerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
