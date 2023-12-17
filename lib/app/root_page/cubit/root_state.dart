part of 'root_cubit.dart';


@freezed

class RootState with _$RootState {
  factory RootState({
       User? user,
     @Default(Status.loading) Status status,
    @Default('')   String errorMessage,
  }) = _RootState; }
 
 
 
  
