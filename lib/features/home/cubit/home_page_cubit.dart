import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super((HomePageState()));

  void changeIndex(int newIndex) {
    emit(HomePageState(currentIndex: newIndex));
  }
}
