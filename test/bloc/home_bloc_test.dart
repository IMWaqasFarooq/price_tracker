import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:price_tracker/features/home/data/models/symbol_price_model.dart';
import 'package:price_tracker/features/home/domain/entity/error_entity.dart';
import 'package:price_tracker/features/home/domain/entity/symbol_entity.dart';
import 'package:price_tracker/features/home/domain/use_cases/close_web_socket_use_case.dart';
import 'package:price_tracker/features/home/domain/use_cases/connect_web_socket_use_case.dart';
import 'package:price_tracker/features/home/domain/use_cases/get_symbols_use_case.dart';
import 'package:price_tracker/features/home/domain/use_cases/listen_price_use_case.dart';
import 'package:price_tracker/features/home/domain/use_cases/subscribe_to_symbol_use_case.dart';
import 'package:price_tracker/features/home/presentation/ui/bloc/home_bloc.dart';
import 'package:price_tracker/features/home/presentation/ui/bloc/home_event.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([
  GetSymbolsUseCase,
  ConnectWebSocketUseCase,
  SubscribeToWebSocketUseCase,
  ListenToPriceUpdatesUseCase,
  CloseWebSocketUseCase,
])
void main() {
  late HomeBloc homeBloc;
  late MockListenToPriceUpdatesUseCase mockListenToPriceUpdatesUseCase;
  late MockCloseWebSocketUseCase mockCloseWebSocketUseCase;
  late MockSubscribeToWebSocketUseCase mockSubscribeToWebSocketUseCase;
  late MockGetSymbolsUseCase mockGetSymbolsUseCase;
  late MockConnectWebSocketUseCase mockConnectWebSocketUseCase;

  setUp(() {
    mockListenToPriceUpdatesUseCase = MockListenToPriceUpdatesUseCase();
    mockCloseWebSocketUseCase = MockCloseWebSocketUseCase();
    mockSubscribeToWebSocketUseCase = MockSubscribeToWebSocketUseCase();
    mockGetSymbolsUseCase = MockGetSymbolsUseCase();
    mockConnectWebSocketUseCase = MockConnectWebSocketUseCase();

    when(mockCloseWebSocketUseCase.call()).thenAnswer((_) async => const Right("closed"));
    when(mockConnectWebSocketUseCase.call()).thenAnswer((_) async => const Right("connected"));


    homeBloc = HomeBloc(
      listenToPriceUpdatesUseCase: mockListenToPriceUpdatesUseCase,
      closeWebSocketUseCase: mockCloseWebSocketUseCase,
      subscribeToWebSocketUseCase: mockSubscribeToWebSocketUseCase,
      getSymbolsUseCase: mockGetSymbolsUseCase,
      connectWebSocketUseCase: mockConnectWebSocketUseCase,
    );
  });

  tearDown(() {
    homeBloc.close();
  });

  test('bloc initialisation', () {
    expect(homeBloc.state, HomeState.initial());
  });

  blocTest<HomeBloc, HomeState>(
    'Get Symbol success',
    build: () {
      final testSymbolPriceUpdates = [
        SymbolPriceUpdate(c: null, p: 1.3, s: "test", t: 123, v: 1),
      ];

      when(mockGetSymbolsUseCase.call())
          .thenAnswer((_) async => Right([testSymbolEntity])); // Updated here
      when(mockSubscribeToWebSocketUseCase.call("test"))
          .thenAnswer((_) async => const Right("subscribe"));  // Stub the subscription use case
      when(mockListenToPriceUpdatesUseCase.call())
          .thenAnswer((_) => Stream.value(Right(testSymbolPriceUpdates)));

      return homeBloc;
    },
    act: (bloc) => bloc.add(GetSymbolsEvent()),
    expect: () => [
      HomeState(isLoading: true, isSuccess: false, error: '', symbolsList: []),
      HomeState(isLoading: false, isSuccess: true, error: '', symbolsList: [testSymbolEntity]),
      HomeState(isLoading: false, isSuccess: true, error: '', symbolsList: [testSymbolEntity])

      // HomeState(isLoading: true, isSuccess: false, error: '', symbolsList: []),
      // HomeState(isLoading: false, isSuccess: true, error: '', symbolsList: [testSymbolEntity]),
      // HomeState(isLoading: false, isSuccess: true, error: '', symbolsList: [testSymbolEntity]),
    ],
  );

  blocTest<HomeBloc, HomeState>(
    'Get symbol Failure',
    build: () {
      final errorEntity = ErrorEntity(message: "error");

      when(mockGetSymbolsUseCase.call())
          .thenAnswer((_) async => Left(errorEntity)); // Updated here
      when(mockSubscribeToWebSocketUseCase.call("test"))
          .thenAnswer((_) async => const Right("subscribe"));
      when(mockListenToPriceUpdatesUseCase.call())
          .thenAnswer((_) => Stream.value(Left(errorEntity)));

      return homeBloc;
    },
    act: (bloc) => bloc.add(GetSymbolsEvent()),
    expect: () => [
      HomeState(isLoading: true),
      HomeState(isLoading: false, isSuccess: false, error: "error"),
    ],
  );

  blocTest<HomeBloc, HomeState>(
    'Close Websocket Connection',
    build: () {
      return homeBloc;
    },
    act: (bloc) => bloc.close(),
    verify: (_) {
      verify(mockCloseWebSocketUseCase.call()).called(1); // Updated here
    },
  );
}

final SymbolEntity testSymbolEntity = SymbolEntity(
  description: 'Test Symbol',
  displaySymbol: 'TS',
  symbol: 'test',
  price: 100.0,
  color: Colors.green,
);

final SymbolEntity updatedSymbolEntity = testSymbolEntity.copyWith(
  price: 101.5,
  color: Colors.red,
);

final List<SymbolPriceUpdate> testSymbolPriceUpdates = [
  SymbolPriceUpdate(p: 101.5, s: 'test', t: 1234567890, v: 100),
];



// void main() {
//   late HomeBloc homeBloc;
//   late MockListenToPriceUpdatesUseCase mockListenToPriceUpdatesUseCase;
//   late MockCloseWebSocketUseCase mockCloseWebSocketUseCase;
//   late MockSubscribeToWebSocketUseCase mockSubscribeToWebSocketUseCase;
//   late MockGetSymbolsUseCase mockGetSymbolsUseCase;
//   late MockConnectWebSocketUseCase mockConnectWebSocketUseCase;
//
//
//   setUp(() {
//     mockListenToPriceUpdatesUseCase = MockListenToPriceUpdatesUseCase();
//     mockCloseWebSocketUseCase = MockCloseWebSocketUseCase();
//     mockSubscribeToWebSocketUseCase = MockSubscribeToWebSocketUseCase();
//     mockGetSymbolsUseCase =MockGetSymbolsUseCase();
//     mockConnectWebSocketUseCase =MockConnectWebSocketUseCase();
//
//
//     homeBloc = HomeBloc(
//       listenToPriceUpdatesUseCase: mockListenToPriceUpdatesUseCase,
//       closeWebSocketUseCase: mockCloseWebSocketUseCase,
//       subscribeToWebSocketUseCase: mockSubscribeToWebSocketUseCase,
//       getSymbolsUseCase: mockGetSymbolsUseCase, connectWebSocketUseCase: mockConnectWebSocketUseCase,
//     );
//   });
//
//   tearDown(() {
//     homeBloc.close();
//   });
//
//   test('initial state is HomeState.initial()', () {
//     expect(homeBloc.state, HomeState.initial());
//   });
//
//   blocTest<HomeBloc, HomeState>(
//     'emits [loading, success] when symbols are fetched successfully',
//     build: () {
//       final testSymbolPriceUpdates = [
//         SymbolPriceUpdate(c:null,p:1.3,s: "test",t: 123,v: 1),
//       ];
//
//       when(mockSubscribeToWebSocketUseCase.call(any))
//           .thenAnswer((_) async => const Right("subscribe"));  // Stub the subscription use case
//       when(mockListenToPriceUpdatesUseCase.call())
//           .thenAnswer((_) => Stream.value(Right(testSymbolPriceUpdates)));
//
//       return homeBloc;
//     },
//     act: (bloc) => bloc.add(GetSymbolsEvent()),
//     expect: () => [
//       HomeState(isLoading: true),
//       HomeState(isLoading: false, isSuccess: true, symbolsList: [testSymbolEntity]),
//     ],
//   );
//
//   blocTest<HomeBloc, HomeState>(
//     'emits [loading, error] when an error occurs while fetching symbols',
//     build: () {
//       final errorEntity = ErrorEntity(message: "error");
//
//       when(mockSubscribeToWebSocketUseCase.call(any))
//           .thenAnswer((_) async => const Right("subscribe"));
//       when(mockListenToPriceUpdatesUseCase.call())
//           .thenAnswer((_) => Stream.value(Left(errorEntity)));
//
//       return homeBloc;
//     },
//     act: (bloc) => bloc.add(GetSymbolsEvent()),
//     expect: () => [
//       HomeState(isLoading: true),
//       HomeState(isLoading: false, isSuccess: false, error: "error"),
//     ],
//   );
//
//   blocTest<HomeBloc, HomeState>(
//     'calls CloseWebSocketUseCase when the bloc is closed',
//     build: () {
//       when(mockCloseWebSocketUseCase.call()).thenAnswer((_) async => const Right("closed"));
//
//       return homeBloc;
//     },
//     act: (bloc) => bloc.close(),
//     verify: (_) {
//       verify(mockCloseWebSocketUseCase.call()).called(1);
//     },
//   );
// }
//

// final SymbolEntity testSymbolEntity = SymbolEntity(
//   description: 'Test Symbol',
//   displaySymbol: 'TS',
//   symbol: 'TEST',
//   price: 100.0,
//   color: Colors.green,
// );
//
// final SymbolEntity updatedSymbolEntity = testSymbolEntity.copyWith(
//   price: 101.5,
//   color: Colors.red,
// );
//
// final List<SymbolPriceUpdate> testSymbolPriceUpdates = [
//   SymbolPriceUpdate(p: 101.5, s: 'TEST', t: 1234567890, v: 100),
// ];