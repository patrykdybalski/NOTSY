import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:primary_school/app/features/home/pages/notes_page/cubit/note_cubit.dart';
import 'package:primary_school/app/features/home/pages/notes_page/screens/edit_note_screen/cubit/edit_note_cubit.dart';
import 'package:primary_school/app/features/home/pages/notes_page/screens/note_reader_screen/cubit/reader_screen_cubit.dart';
import 'package:primary_school/app/features/home/pages/weather_page/cubit/weather_cubit.dart';
import 'package:primary_school/data/remote_data_sources/note_remote_data_source.dart';
import 'package:primary_school/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
import 'package:primary_school/domain/repositories/weather/weather_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  //Bloc
  getIt.registerFactory(() => WeatherCubit(getIt()));
  getIt.registerFactory(() => NoteCubit(getIt()));
  getIt.registerFactory(() => ReaderScreenCubit(getIt()));
   getIt.registerFactory(() => EditNoteCubit(getIt()));


  //Repositories
  getIt.registerFactory(() => WeatherRepository(getIt()));
  getIt.registerFactory(() => NoteRepository(getIt()));

  //DataSources
  getIt.registerFactory(() => WeatherRemoteRetrofitDataSource(Dio()));
  getIt.registerFactory(() => NoteRemoteDataSource());
}
