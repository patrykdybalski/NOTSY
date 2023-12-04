
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_auth_model.freezed.dart';

@freezed
class LoginAuthModel with _$LoginAuthModel {
  const LoginAuthModel._();
  factory LoginAuthModel(
     { required String email,
      required String password,
    }
    
  ) = _LoginAuthModel;

 
}


