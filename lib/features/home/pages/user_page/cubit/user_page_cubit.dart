import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
part 'user_page_state.dart';

class UserPageCubit extends Cubit<UserPageState> {
  UserPageCubit() : super(const UserPageState());
}
