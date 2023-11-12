import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:primary_school/app/features/home/pages/weather_page/cubit/weather_cubit.dart';
import 'package:primary_school/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:primary_school/domain/repositories/weather/weather_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  //Bloc
  getIt.registerFactory(() => WeatherCubit(getIt()));

  //Repositories
  getIt.registerFactory(() => WeatherRepository(getIt()));

  //DataSources
  getIt.registerFactory(() => WeatherRemoteRetrofitDataSource(Dio()));
}
