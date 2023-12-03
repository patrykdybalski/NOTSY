// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_event_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditEventState {
  bool get saved => throw _privateConstructorUsedError;
  dynamic get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditEventStateCopyWith<EditEventState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditEventStateCopyWith<$Res> {
  factory $EditEventStateCopyWith(
          EditEventState value, $Res Function(EditEventState) then) =
      _$EditEventStateCopyWithImpl<$Res, EditEventState>;
  @useResult
  $Res call({bool saved, dynamic errorMessage});
}

/// @nodoc
class _$EditEventStateCopyWithImpl<$Res, $Val extends EditEventState>
    implements $EditEventStateCopyWith<$Res> {
  _$EditEventStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditEventStateImplCopyWith<$Res>
    implements $EditEventStateCopyWith<$Res> {
  factory _$$EditEventStateImplCopyWith(_$EditEventStateImpl value,
          $Res Function(_$EditEventStateImpl) then) =
      __$$EditEventStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool saved, dynamic errorMessage});
}

/// @nodoc
class __$$EditEventStateImplCopyWithImpl<$Res>
    extends _$EditEventStateCopyWithImpl<$Res, _$EditEventStateImpl>
    implements _$$EditEventStateImplCopyWith<$Res> {
  __$$EditEventStateImplCopyWithImpl(
      _$EditEventStateImpl _value, $Res Function(_$EditEventStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$EditEventStateImpl(
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage:
          freezed == errorMessage ? _value.errorMessage! : errorMessage,
    ));
  }
}

/// @nodoc

class _$EditEventStateImpl implements _EditEventState {
  _$EditEventStateImpl({this.saved = false, this.errorMessage = ''});

  @override
  @JsonKey()
  final bool saved;
  @override
  @JsonKey()
  final dynamic errorMessage;

  @override
  String toString() {
    return 'EditEventState(saved: $saved, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditEventStateImpl &&
            (identical(other.saved, saved) || other.saved == saved) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, saved, const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditEventStateImplCopyWith<_$EditEventStateImpl> get copyWith =>
      __$$EditEventStateImplCopyWithImpl<_$EditEventStateImpl>(
          this, _$identity);
}

abstract class _EditEventState implements EditEventState {
  factory _EditEventState({final bool saved, final dynamic errorMessage}) =
      _$EditEventStateImpl;

  @override
  bool get saved;
  @override
  dynamic get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$EditEventStateImplCopyWith<_$EditEventStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
