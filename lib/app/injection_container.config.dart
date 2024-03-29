// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:primary_school/app/injection_container.dart' as _i24;
import 'package:primary_school/app/root_page/cubit/root_cubit.dart' as _i11;
import 'package:primary_school/data/remote_data_sources_api/weather_remote_data_source.dart'
    as _i21;
import 'package:primary_school/data/remote_data_sources_firebase/event_remote_data_source.dart'
    as _i3;
import 'package:primary_school/data/remote_data_sources_firebase/login_auth_data_source.dart'
    as _i6;
import 'package:primary_school/data/remote_data_sources_firebase/note_remote_data_source.dart'
    as _i8;
import 'package:primary_school/domain/repositories/event/event_repository.dart'
    as _i4;
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart'
    as _i7;
import 'package:primary_school/domain/repositories/note/note_repository.dart'
    as _i9;
import 'package:primary_school/domain/repositories/weather/weather_repository.dart'
    as _i22;
import 'package:primary_school/features/auth/cubit/auth_cubit.dart' as _i15;
import 'package:primary_school/features/home/home_page/cubit/home_page_cubit.dart'
    as _i5;
import 'package:primary_school/features/home/pages/event_page/event_page/cubit/event_cubit.dart'
    as _i19;
import 'package:primary_school/features/home/pages/event_page/screens/add_event_dialog/cubit/add_event_cubit.dart'
    as _i13;
import 'package:primary_school/features/home/pages/event_page/screens/edit_event_screen/cubit/edit_event_cubit.dart'
    as _i17;
import 'package:primary_school/features/home/pages/notes_page/screens/add_note_screen/cubit/add_note_cubit.dart'
    as _i14;
import 'package:primary_school/features/home/pages/notes_page/screens/edit_note_screen/cubit/edit_note_cubit.dart'
    as _i18;
import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/cubit/note_cubit.dart'
    as _i20;
import 'package:primary_school/features/home/pages/notes_page/screens/note_reader_screen/cubit/reader_screen_cubit.dart'
    as _i10;
import 'package:primary_school/features/home/pages/user_drawer/cubit/user_drawer_cubit.dart'
    as _i12;
import 'package:primary_school/features/home/pages/weather_page/cubit/weather_cubit.dart'
    as _i23;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.EventRemoteDataSource>(() => _i3.EventRemoteDataSource());
    gh.factory<_i4.EventRepository>(
        () => _i4.EventRepository(gh<_i3.EventRemoteDataSource>()));
    gh.factory<_i5.HomePageCubit>(() => _i5.HomePageCubit());
    gh.factory<_i6.LoginAuthDataSource>(() => _i6.LoginAuthDataSource());
    gh.factory<_i7.LoginAuthRepository>(
        () => _i7.LoginAuthRepository(gh<_i6.LoginAuthDataSource>()));
    gh.factory<_i8.NoteRemoteDataSource>(() => _i8.NoteRemoteDataSource());
    gh.factory<_i9.NoteRepository>(
        () => _i9.NoteRepository(gh<_i8.NoteRemoteDataSource>()));
    gh.factory<_i10.ReaderScreenCubit>(
        () => _i10.ReaderScreenCubit(gh<_i9.NoteRepository>()));
    gh.factory<_i11.RootCubit>(
        () => _i11.RootCubit(gh<_i7.LoginAuthRepository>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i12.UserDrawerCubit>(() => _i12.UserDrawerCubit());
    gh.factory<_i13.AddEventCubit>(
        () => _i13.AddEventCubit(gh<_i4.EventRepository>()));
    gh.factory<_i14.AddNoteCubit>(
        () => _i14.AddNoteCubit(gh<_i9.NoteRepository>()));
    gh.factory<_i15.AuthCubit>(
        () => _i15.AuthCubit(gh<_i7.LoginAuthRepository>()));
    gh.lazySingleton<_i16.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i17.EditEventCubit>(
        () => _i17.EditEventCubit(gh<_i4.EventRepository>()));
    gh.factory<_i18.EditNoteCubit>(
        () => _i18.EditNoteCubit(gh<_i9.NoteRepository>()));
    gh.factory<_i19.EventCubit>(
        () => _i19.EventCubit(gh<_i4.EventRepository>()));
    gh.factory<_i20.NoteCubit>(() => _i20.NoteCubit(gh<_i9.NoteRepository>()));
    gh.factory<_i21.WeatherRemoteRetrofitDataSource>(
        () => _i21.WeatherRemoteRetrofitDataSource(gh<_i16.Dio>()));
    gh.factory<_i22.WeatherRepository>(() => _i22.WeatherRepository(
        weatherRemoteDataSource: gh<_i21.WeatherRemoteRetrofitDataSource>()));
    gh.factory<_i23.WeatherCubit>(
        () => _i23.WeatherCubit(gh<_i22.WeatherRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i24.RegisterModule {}
