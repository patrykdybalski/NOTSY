// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:primary_school/app/root_page/cubit/root_cubit.dart' as _i11;
import 'package:primary_school/data/remote_data_sources_api/weather_remote_data_source.dart'
    as _i13;
import 'package:primary_school/data/remote_data_sources_firebase/event_remote_data_source.dart'
    as _i3;
import 'package:primary_school/data/remote_data_sources_firebase/login_auth_data_source.dart'
    as _i5;
import 'package:primary_school/data/remote_data_sources_firebase/note_remote_data_source.dart'
    as _i8;
import 'package:primary_school/domain/repositories/event/events_repository.dart'
    as _i4;
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart'
    as _i6;
import 'package:primary_school/domain/repositories/note/note_repository.dart'
    as _i9;
import 'package:primary_school/domain/repositories/weather/weather_repository.dart'
    as _i12;
import 'package:primary_school/features/features/auth/login_page/cubit/login_cubit.dart'
    as _i7;
import 'package:primary_school/features/features/home/pages/event_page/add_event_dialog/cubit/add_event_cubit.dart'
    as _i14;
import 'package:primary_school/features/features/home/pages/event_page/cubit/event_cubit.dart'
    as _i17;
import 'package:primary_school/features/features/home/pages/event_page/edit_event_screen/cubit/edit_event_cubit.dart'
    as _i15;
import 'package:primary_school/features/features/home/pages/notes_page/cubit/note_cubit.dart'
    as _i18;
import 'package:primary_school/features/features/home/pages/notes_page/screens/edit_note_screen/cubit/edit_note_cubit.dart'
    as _i16;
import 'package:primary_school/features/features/home/pages/notes_page/screens/note_reader_screen/cubit/reader_screen_cubit.dart'
    as _i10;
import 'package:primary_school/features/features/home/pages/weather_page/cubit/weather_cubit.dart'
    as _i19;

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
    gh.factory<_i3.EventRemoteDataSource>(() => _i3.EventRemoteDataSource());
    gh.factory<_i4.EventsRepository>(
        () => _i4.EventsRepository(gh<_i3.EventRemoteDataSource>()));
    gh.factory<_i5.LoginAuthDataSource>(() => _i5.LoginAuthDataSource());
    gh.factory<_i6.LoginAuthRepository>(
        () => _i6.LoginAuthRepository(gh<_i5.LoginAuthDataSource>()));
    gh.factory<_i7.LoginCubit>(
        () => _i7.LoginCubit(gh<_i6.LoginAuthRepository>()));
    gh.factory<_i8.NoteRemoteDataSource>(() => _i8.NoteRemoteDataSource());
    gh.factory<_i9.NoteRepository>(
        () => _i9.NoteRepository(gh<_i8.NoteRemoteDataSource>()));
    gh.factory<_i10.ReaderScreenCubit>(
        () => _i10.ReaderScreenCubit(gh<_i9.NoteRepository>()));
    gh.factory<_i11.RootCubit>(
        () => _i11.RootCubit(gh<_i6.LoginAuthRepository>()));
    gh.factory<_i12.WeatherRepository>(() =>
        _i12.WeatherRepository(gh<_i13.WeatherRemoteRetrofitDataSource>()));
    gh.factory<_i14.AddEventCubit>(
        () => _i14.AddEventCubit(gh<_i4.EventsRepository>()));
    gh.factory<_i15.EditEventCubit>(
        () => _i15.EditEventCubit(gh<_i4.EventsRepository>()));
    gh.factory<_i16.EditNoteCubit>(
        () => _i16.EditNoteCubit(gh<_i9.NoteRepository>()));
    gh.factory<_i17.EventCubit>(
        () => _i17.EventCubit(gh<_i4.EventsRepository>()));
    gh.factory<_i18.NoteCubit>(() => _i18.NoteCubit(gh<_i9.NoteRepository>()));
    gh.factory<_i19.WeatherCubit>(
        () => _i19.WeatherCubit(gh<_i12.WeatherRepository>()));
    return this;
  }
}
