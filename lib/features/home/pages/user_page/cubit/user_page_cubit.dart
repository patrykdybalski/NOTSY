import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primary_school/app/core/enums.dart';
part 'user_page_state.dart';
part 'user_page_cubit.freezed.dart';

class UserPageCubit extends Cubit<UserPageState> {
  UserPageCubit() : super( UserPageState());
}
