import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:primary_school/app/cubit/root_cubit.dart';

import 'package:primary_school/data/remote_data_sources/event_remote_data_source.dart';
import 'package:primary_school/data/remote_data_sources/login_auth_data_source.dart';
import 'package:primary_school/data/remote_data_sources/note_remote_data_source.dart';
import 'package:primary_school/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:primary_school/domain/repositories/event/events_repository.dart';
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
import 'package:primary_school/domain/repositories/weather/weather_repository.dart';
import 'package:primary_school/features/features/auth/login_page/cubit/login_cubit.dart';
import 'package:primary_school/features/features/home/pages/event_page/add_event_dialog/cubit/add_event_cubit.dart';
import 'package:primary_school/features/features/home/pages/event_page/edit_event_screen/cubit/edit_event_cubit.dart';
import 'package:primary_school/features/features/home/pages/notes_page/cubit/note_cubit.dart';
import 'package:primary_school/features/features/home/pages/notes_page/screens/edit_note_screen/cubit/edit_note_cubit.dart';
import 'package:primary_school/features/features/home/pages/notes_page/screens/note_reader_screen/cubit/reader_screen_cubit.dart';
import 'package:primary_school/features/features/home/pages/weather_page/cubit/weather_cubit.dart';

import '../features/features/home/pages/event_page/cubit/event_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  //Bloc
  getIt.registerFactory(() => WeatherCubit(getIt()));
  getIt.registerFactory(() => NoteCubit(getIt()));
  getIt.registerFactory(() => ReaderScreenCubit(getIt()));
  getIt.registerFactory(() => EditNoteCubit(getIt()));
   getIt.registerFactory(() => RootCubit(getIt()));
   getIt.registerFactory(() => LoginCubit(getIt()));
   getIt.registerFactory(() => EventCubit(getIt()));
   getIt.registerFactory(() => EditEventCubit(getIt()));
     getIt.registerFactory(() => AddEventCubit(getIt()));
   

  //Repositories
  getIt.registerFactory(() => WeatherRepository(getIt()));
  getIt.registerFactory(() => NoteRepository(getIt()));
  getIt.registerFactory(() => EventsRepository(getIt()));
  getIt.registerFactory(() => LoginAuthRepository(getIt()));

  //DataSources
  getIt.registerFactory(() => WeatherRemoteRetrofitDataSource(Dio()));
  getIt.registerFactory(() => NoteRemoteDataSource());
  getIt.registerFactory(() => EventRemoteDataSource());
  getIt.registerFactory(() => LoginAuthDataSource());
}
