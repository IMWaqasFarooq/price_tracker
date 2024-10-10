
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:price_tracker/features/home/domain/entity/error_entity.dart';
import 'package:price_tracker/features/home/domain/entity/symbol_entity.dart';
import 'package:price_tracker/features/home/domain/repositories/home_repository.dart';
import 'package:price_tracker/features/home/domain/use_cases/get_symbols_use_case.dart';

import 'symbol_use_case_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late HomeRepository mockRepository;
  late GetSymbolsUseCase getSymbolsUseCase;

  setUp(() {
    mockRepository = MockHomeRepository();
    getSymbolsUseCase = GetSymbolsUseCase(homeRepository: mockRepository);
  });

  test('symbol success case', () async {
    final symbols = [SymbolEntity(symbol: 'OANDA:EUR_USD', displaySymbol: 'EUR/USD')];
    when(mockRepository.getSymbols()).thenAnswer((_) async => Right(symbols));

    final result = await getSymbolsUseCase.call();

    expect(result, Right(symbols));
    verify(mockRepository.getSymbols());
    verifyNoMoreInteractions(mockRepository);
  });

  test('symbol failure case', () async {
    final error = ErrorEntity(statusCode: 500, message: 'Server error');
    when(mockRepository.getSymbols()).thenAnswer((_) async => Left(error));

    final result = await getSymbolsUseCase.call();

    expect(result, Left(error));
    verify(mockRepository.getSymbols());
    verifyNoMoreInteractions(mockRepository);
  });
}