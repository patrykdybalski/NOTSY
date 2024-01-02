import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primary_school/app/core/enums.dart';
part 'user_drawer_state.dart';
part 'user_drawer_cubit.freezed.dart';

class UserDrawerCubit extends Cubit<UserDrawerState> {
  UserDrawerCubit() : super( UserDrawerState());
}
