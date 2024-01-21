// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginAuthModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginAuthModelCopyWith<LoginAuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginAuthModelCopyWith<$Res> {
  factory $LoginAuthModelCopyWith(
          LoginAuthModel value, $Res Function(LoginAuthModel) then) =
      _$LoginAuthModelCopyWithImpl<$Res, LoginAuthModel>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginAuthModelCopyWithImpl<$Res, $Val extends LoginAuthModel>
    implements $LoginAuthModelCopyWith<$Res> {
  _$LoginAuthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginAuthModelImplCopyWith<$Res>
    implements $LoginAuthModelCopyWith<$Res> {
  factory _$$LoginAuthModelImplCopyWith(_$LoginAuthModelImpl value,
          $Res Function(_$LoginAuthModelImpl) then) =
      __$$LoginAuthModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginAuthModelImplCopyWithImpl<$Res>
    extends _$LoginAuthModelCopyWithImpl<$Res, _$LoginAuthModelImpl>
    implements _$$LoginAuthModelImplCopyWith<$Res> {
  __$$LoginAuthModelImplCopyWithImpl(
      _$LoginAuthModelImpl _value, $Res Function(_$LoginAuthModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginAuthModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginAuthModelImpl extends _LoginAuthModel {
  _$LoginAuthModelImpl({required this.email, required this.password})
      : super._();

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginAuthModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginAuthModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginAuthModelImplCopyWith<_$LoginAuthModelImpl> get copyWith =>
      __$$LoginAuthModelImplCopyWithImpl<_$LoginAuthModelImpl>(
          this, _$identity);
}

abstract class _LoginAuthModel extends LoginAuthModel {
  factory _LoginAuthModel(
      {required final String email,
      required final String password}) = _$LoginAuthModelImpl;
  _LoginAuthModel._() : super._();

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginAuthModelImplCopyWith<_$LoginAuthModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
