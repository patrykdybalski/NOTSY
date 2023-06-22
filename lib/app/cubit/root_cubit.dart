import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit()
      : super(
          RootState(
            user: null,
            isLoadnig: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> createUser(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
