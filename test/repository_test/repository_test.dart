
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:price_tracker/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:price_tracker/features/home/data/models/symbol_model.dart';
import 'package:price_tracker/features/home/data/repositories/home_repository_impl.dart';
import 'package:price_tracker/features/home/domain/entity/error_entity.dart';


import 'repository_test.mocks.dart';


@GenerateMocks([HomeRemoteDataSource,InternetConnectionChecker])
void main() {
  late HomeRepositoryImpl repository;
  late MockHomeRemoteDataSource mockRemoteDataSource;
  late MockInternetConnectionChecker mockConnectionChecker;

  setUp(() {
    mockRemoteDataSource = MockHomeRemoteDataSource();
    mockConnectionChecker = MockInternetConnectionChecker();
    repository = HomeRepositoryImpl(
      homeRemoteDataSource: mockRemoteDataSource,
      connection: mockConnectionChecker,
    );
  });

  group('getSymbols', () {
    test('symbol success', () async {
      final symbols = [SymbolModel(symbol: 'OANDA:EUR_USD', displaySymbol: 'EUR/USD')];

      when(mockConnectionChecker.hasConnection)
          .thenAnswer((_) async => true);
      when(mockRemoteDataSource.getSymbols())
          .thenAnswer((_) async => Right(symbols));

      final result = await repository.getSymbols();

      expect(result, Right(symbols));
      verify(mockRemoteDataSource.getSymbols());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('symbol failure', () async {
      when(mockConnectionChecker.hasConnection)
          .thenAnswer((_) async => false);

      final result = await repository.getSymbols();

      expect(result, Left(ErrorEntity(message: 'No Internet')));
      verify(mockRemoteDataSource.getSymbols());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });

}
