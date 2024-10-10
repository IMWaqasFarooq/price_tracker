import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:price_tracker/core/di/dependency_injection.dart';
import 'package:price_tracker/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:price_tracker/features/home/domain/repositories/home_repository.dart';
import 'package:price_tracker/features/home/domain/use_cases/connect_web_socket_use_case.dart';
import 'package:price_tracker/features/home/domain/use_cases/get_symbols_use_case.dart';
import 'package:price_tracker/features/home/domain/use_cases/subscribe_to_symbol_use_case.dart';
import 'package:price_tracker/features/home/presentation/ui/bloc/home_bloc.dart';

void main() {
  setUp(() {
    sl.reset();
    init();
  });

  test('dependency injection test', () {
    final dio = sl<Dio>();

    expect(dio.options.connectTimeout, equals(Duration(seconds: 30)));
    expect(dio.options.receiveTimeout, equals(Duration(minutes: 5)));
    expect(dio.options.sendTimeout, equals(Duration(minutes: 5)));

    final hasLogInterceptor = dio.interceptors.any((interceptor) => interceptor is LogInterceptor);
    expect(hasLogInterceptor, isTrue, reason: 'LogInterceptor should be added to Dio.');

    expect(sl.isRegistered<HomeRemoteDataSource>(), isTrue);
    expect(sl.isRegistered<HomeRepository>(), isTrue);

    expect(sl.isRegistered<GetSymbolsUseCase>(), isTrue);
    expect(sl.isRegistered<ConnectWebSocketUseCase>(), isTrue);
    expect(sl.isRegistered<SubscribeToWebSocketUseCase>(), isTrue);
    expect(sl.isRegistered<HomeBloc>(), isTrue);

  });

}
