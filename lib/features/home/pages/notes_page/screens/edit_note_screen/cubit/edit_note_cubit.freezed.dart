// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_note_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditNoteState {
  bool get saved => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditNoteStateCopyWith<EditNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditNoteStateCopyWith<$Res> {
  factory $EditNoteStateCopyWith(
          EditNoteState value, $Res Function(EditNoteState) then) =
      _$EditNoteStateCopyWithImpl<$Res, EditNoteState>;
  @useResult
  $Res call({bool saved, String errorMessage});
}

/// @nodoc
class _$EditNoteStateCopyWithImpl<$Res, $Val extends EditNoteState>
    implements $EditNoteStateCopyWith<$Res> {
  _$EditNoteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditNoteStateImplCopyWith<$Res>
    implements $EditNoteStateCopyWith<$Res> {
  factory _$$EditNoteStateImplCopyWith(
          _$EditNoteStateImpl value, $Res Function(_$EditNoteStateImpl) then) =
      __$$EditNoteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool saved, String errorMessage});
}

/// @nodoc
class __$$EditNoteStateImplCopyWithImpl<$Res>
    extends _$EditNoteStateCopyWithImpl<$Res, _$EditNoteStateImpl>
    implements _$$EditNoteStateImplCopyWith<$Res> {
  __$$EditNoteStateImplCopyWithImpl(
      _$EditNoteStateImpl _value, $Res Function(_$EditNoteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
  }) {
    return _then(_$EditNoteStateImpl(
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditNoteStateImpl implements _EditNoteState {
  _$EditNoteStateImpl({this.saved = false, this.errorMessage = ''});

  @override
  @JsonKey()
  final bool saved;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'EditNoteState(saved: $saved, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditNoteStateImpl &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, saved, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditNoteStateImplCopyWith<_$EditNoteStateImpl> get copyWith =>
      __$$EditNoteStateImplCopyWithImpl<_$EditNoteStateImpl>(this, _$identity);
}

abstract class _EditNoteState implements EditNoteState {
  factory _EditNoteState({final bool saved, final String errorMessage}) =
      _$EditNoteStateImpl;

  @override
  bool get saved;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$EditNoteStateImplCopyWith<_$EditNoteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
