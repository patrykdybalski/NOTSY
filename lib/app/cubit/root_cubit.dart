import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart';
part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit(this._loginAuthRepository)
      : super(
          RootState(
            user: null,
            isLoadnig: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;
  final LoginAuthRepository _loginAuthRepository;

  Future<void> createUser(
      {required String email, required String password}) async {
    try {
      await _loginAuthRepository.createUsers(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(
        RootState(
          user: null,
          isLoadnig: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _loginAuthRepository.signInUser(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(
        RootState(
          user: null,
          isLoadnig: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> start({User? user}) async {
    emit(
      RootState(
        user: null,
        isLoadnig: true,
        errorMessage: '',
      ),
    );
    _loginAuthRepository.streamSubscriptionData(user: user);
    try {
      emit(
        RootState(
          user: user,
          isLoadnig: false,
          errorMessage: '',
        ),
      );
    } catch (error) {
      emit(
        RootState(
          user: null,
          isLoadnig: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
