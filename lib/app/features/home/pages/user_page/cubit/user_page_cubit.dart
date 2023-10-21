import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
part 'user_page_state.dart';

class UserPageCubit extends Cubit<UserPageState> {
  UserPageCubit(this._noteRepository) : super(const UserPageState());

  final NoteRepository _noteRepository;
  Future<void> signOut() async {
    try {
      await _noteRepository.signOut();
      emit(const UserPageState());
    } catch (error) {
      emit(
        UserPageState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
