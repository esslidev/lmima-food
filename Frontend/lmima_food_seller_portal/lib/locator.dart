import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/util/route_path_service.dart';
import 'core/util/localization_service.dart';
import 'features/data/data_sources/remote/auth_api_service.dart';
import 'features/data/data_sources/remote/user_api_service.dart';
import 'features/data/repository_impl/auth.dart';
import 'features/data/repository_impl/user.dart';
import 'features/domain/repository/auth.dart';
import 'features/domain/repository/user.dart';
import 'features/domain/usecases/auth.dart';
import 'features/domain/usecases/user.dart';
import 'features/presentation/bloc/app_blocs/route/route_bloc.dart';
import 'features/presentation/bloc/remote/auth/auth_bloc.dart';
import 'features/presentation/bloc/remote/user/user_bloc.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register RoutePathService
  locator.registerSingleton<RoutePathService>(RoutePathService());

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  // LocalizationService
  Locale systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
  LocalizationService localizationService =
      await LocalizationService.load(systemLocale);
  locator.registerSingleton<LocalizationService>(localizationService);

  // Dio
  locator.registerSingleton<Dio>(Dio());

  //Blocs
  locator.registerFactory<RemoteAuthBloc>(() => RemoteAuthBloc(locator()));
  locator.registerFactory<RemoteUserBloc>(() => RemoteUserBloc(locator()));
  locator.registerFactory<AppRouteBloc>(() => AppRouteBloc(locator()));

  // Dependencies
  locator.registerSingleton<UserApiService>(UserApiService(locator()));
  locator.registerSingleton<UserRepository>(UserRepositoryImpl(locator()));

  locator.registerSingleton<AuthApiService>(AuthApiService(locator()));
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));

  //UseCases
  locator.registerSingleton<UserUseCases>(UserUseCases(locator()));
  locator.registerSingleton<AuthUseCases>(AuthUseCases(locator()));
}
