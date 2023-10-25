import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart';
part 'user_page_state.dart';

class UserPageCubit extends Cubit<UserPageState> {
  UserPageCubit(this._loginAuthRepository) : super(const UserPageState());

  final LoginAuthRepository _loginAuthRepository;

  Future<void> signOut() async {
    try {
      await _loginAuthRepository.signOut();
      emit(
        const UserPageState(
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        UserPageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
