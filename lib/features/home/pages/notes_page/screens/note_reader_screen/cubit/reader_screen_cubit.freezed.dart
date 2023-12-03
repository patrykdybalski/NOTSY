// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reader_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReaderScreenState {
  bool get delete => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReaderScreenStateCopyWith<ReaderScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReaderScreenStateCopyWith<$Res> {
  factory $ReaderScreenStateCopyWith(
          ReaderScreenState value, $Res Function(ReaderScreenState) then) =
      _$ReaderScreenStateCopyWithImpl<$Res, ReaderScreenState>;
  @useResult
  $Res call({bool delete, String errorMessage});
}

/// @nodoc
class _$ReaderScreenStateCopyWithImpl<$Res, $Val extends ReaderScreenState>
    implements $ReaderScreenStateCopyWith<$Res> {
  _$ReaderScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delete = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      delete: null == delete
          ? _value.delete
          : delete // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReaderScreenStateImplCopyWith<$Res>
    implements $ReaderScreenStateCopyWith<$Res> {
  factory _$$ReaderScreenStateImplCopyWith(_$ReaderScreenStateImpl value,
          $Res Function(_$ReaderScreenStateImpl) then) =
      __$$ReaderScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool delete, String errorMessage});
}

/// @nodoc
class __$$ReaderScreenStateImplCopyWithImpl<$Res>
    extends _$ReaderScreenStateCopyWithImpl<$Res, _$ReaderScreenStateImpl>
    implements _$$ReaderScreenStateImplCopyWith<$Res> {
  __$$ReaderScreenStateImplCopyWithImpl(_$ReaderScreenStateImpl _value,
      $Res Function(_$ReaderScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delete = null,
    Object? errorMessage = null,
  }) {
    return _then(_$ReaderScreenStateImpl(
      delete: null == delete
          ? _value.delete
          : delete // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReaderScreenStateImpl implements _ReaderScreenState {
  _$ReaderScreenStateImpl({this.delete = false, this.errorMessage = ''});

  @override
  @JsonKey()
  final bool delete;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'ReaderScreenState(delete: $delete, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReaderScreenStateImpl &&
            (identical(other.delete, delete) || other.delete == delete) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, delete, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReaderScreenStateImplCopyWith<_$ReaderScreenStateImpl> get copyWith =>
      __$$ReaderScreenStateImplCopyWithImpl<_$ReaderScreenStateImpl>(
          this, _$identity);
}

abstract class _ReaderScreenState implements ReaderScreenState {
  factory _ReaderScreenState({final bool delete, final String errorMessage}) =
      _$ReaderScreenStateImpl;

  @override
  bool get delete;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ReaderScreenStateImplCopyWith<_$ReaderScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
