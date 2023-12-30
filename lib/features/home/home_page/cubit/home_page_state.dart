part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState({
    @Default(0) int currentIndex,
    String? errorMessage,
  }) = _HomePageState;
}
