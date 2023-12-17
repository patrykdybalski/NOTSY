// ignore_for_file: unused_element

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart';
part 'root_state.dart';
part 'root_cubit.freezed.dart';

@injectable
class RootCubit extends Cubit<RootState> {
  RootCubit(this._loginAuthRepository)
      : super(
          RootState(
            user: null,
          ),
        );

  final LoginAuthRepository _loginAuthRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      RootState(
        user: null,
        status: Status.loading,
      ),
    );

    try {
      _streamSubscription = _loginAuthRepository.start().listen((user) {
        emit(RootState(
          user: user,
          status: Status.success,
        ));
      });
    } catch (error) {
      emit(RootState(
        user: null,
        status: Status.error,
        errorMessage: error.toString(),
      ));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
