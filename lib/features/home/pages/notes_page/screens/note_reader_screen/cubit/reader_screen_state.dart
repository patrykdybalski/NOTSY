part of 'reader_screen_cubit.dart';

@freezed
class ReaderScreenState with _$ReaderScreenState {
  factory ReaderScreenState({
     @Default(false)  bool delete,
   @Default('')   String errorMessage,
  
  
  }) = _ReaderScreenState;
}



