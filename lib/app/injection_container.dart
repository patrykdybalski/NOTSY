import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection_container.config.dart';
	



final getIt = GetIt.instance;  
  
@InjectableInit(  
 
)  
void configureDependencies() => getIt.init();  

// final getIt = GetIt.instance;

// void configureDependencies() {
//   //Bloc
//   getIt.registerFactory(() => WeatherCubit(getIt()));
//   getIt.registerFactory(() => NoteCubit(getIt()));
//   getIt.registerFactory(() => ReaderScreenCubit(getIt()));
//   getIt.registerFactory(() => EditNoteCubit(getIt()));
//   getIt.registerFactory(() => RootCubit(getIt()));
//   getIt.registerFactory(() => LoginCubit(getIt()));
//   getIt.registerFactory(() => EventCubit(getIt()));
//   getIt.registerFactory(() => EditEventCubit(getIt()));
//   getIt.registerFactory(() => AddEventCubit(getIt()));

//   //Repositories
//   getIt.registerFactory(() => WeatherRepository(getIt()));
//   getIt.registerFactory(() => NoteRepository(getIt()));
//   getIt.registerFactory(() => EventsRepository(getIt()));
//   getIt.registerFactory(() => LoginAuthRepository(getIt()));

//   //DataSources
//   getIt.registerFactory(() => WeatherRemoteRetrofitDataSource(Dio()));
//   getIt.registerFactory(() => NoteRemoteDataSource());
//   getIt.registerFactory(() => EventRemoteDataSource());
//   getIt.registerFactory(() => LoginAuthDataSource());
// }
