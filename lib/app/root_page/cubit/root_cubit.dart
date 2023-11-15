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

  final LoginAuthRepository _loginAuthRepository;
  StreamSubscription? _streamSubscription;

  Future<void> signOut() async {
    try {
      await _loginAuthRepository.signOut();
      emit(
        RootState(
          user: null,
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

  Future<void> start() async {
    emit(
      RootState(
        user: null,
        isLoadnig: true,
        errorMessage: '',
      ),
    );

    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(
        RootState(
          user: user,
          isLoadnig: false,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              RootState(
                user: null,
                isLoadnig: false,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
