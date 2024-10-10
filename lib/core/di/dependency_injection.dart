import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:price_tracker/core/constants/app_contstants.dart';
import 'package:price_tracker/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:price_tracker/features/home/data/data_sources/remote/home_remote_data_source_impl.dart';
import 'package:price_tracker/features/home/domain/use_cases/close_web_socket_use_case.dart';
import 'package:price_tracker/features/home/domain/use_cases/connect_web_socket_use_case.dart';
import 'package:price_tracker/features/home/domain/use_cases/listen_price_use_case.dart';
import 'package:price_tracker/features/home/domain/use_cases/subscribe_to_symbol_use_case.dart';
import 'package:price_tracker/features/home/domain/use_cases/unsubscribe_to_symbol_use_case.dart';
import 'package:price_tracker/features/home/presentation/ui/bloc/home_bloc.dart';

import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/use_cases/get_symbols_use_case.dart';



final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton(
    () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(minutes: 5),
          sendTimeout: const Duration(minutes: 5),
          baseUrl: AppConstants.baseUrl,
          headers: {},
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
            responseBody: true,
            requestBody: true,
            responseHeader: true,
            requestHeader: true,
            request: true,
            error: true),
      );
      return dio;
    },
  );

  sl.registerLazySingleton(() => InternetConnectionChecker());

  ///Home
  // // DataSources
  sl.registerLazySingleton<HomeRemoteDataSource>(
          () => HomeRemoteDataSourceImpl(dio: sl()));

  // Repositories
  sl.registerLazySingleton<HomeRepository>(
          () => HomeRepositoryImpl(
              homeRemoteDataSource: sl(),
              connection: sl()));
  // Domain
  // Use cases
  sl.registerLazySingleton(() => GetSymbolsUseCase(homeRepository: sl()));
  sl.registerLazySingleton(() => CloseWebSocketUseCase(homeRepository: sl()));
  sl.registerLazySingleton(() => ConnectWebSocketUseCase(homeRepository: sl()));
  sl.registerLazySingleton(() => ListenToPriceUpdatesUseCase(homeRepository: sl()));
  sl.registerLazySingleton(() => SubscribeToWebSocketUseCase(homeRepository: sl()));
  sl.registerLazySingleton(() => UnsubscribeToWebSocketUseCase(homeRepository: sl()));

  // Presentation
  // BLoC
  sl.registerFactory(() => HomeBloc(
      getSymbolsUseCase: sl(),
    connectWebSocketUseCase: sl(),
    subscribeToWebSocketUseCase: sl(),
    closeWebSocketUseCase: sl(),
    listenToPriceUpdatesUseCase: sl(),
  ));

}
