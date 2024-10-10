// Mocks generated by Mockito 5.4.4 from annotations
// in price_tracker/test/bloc/home_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:price_tracker/features/home/data/models/symbol_price_model.dart'
    as _i11;
import 'package:price_tracker/features/home/domain/entity/error_entity.dart'
    as _i6;
import 'package:price_tracker/features/home/domain/entity/symbol_entity.dart'
    as _i7;
import 'package:price_tracker/features/home/domain/repositories/home_repository.dart'
    as _i2;
import 'package:price_tracker/features/home/domain/use_cases/close_web_socket_use_case.dart'
    as _i12;
import 'package:price_tracker/features/home/domain/use_cases/connect_web_socket_use_case.dart'
    as _i8;
import 'package:price_tracker/features/home/domain/use_cases/get_symbols_use_case.dart'
    as _i4;
import 'package:price_tracker/features/home/domain/use_cases/listen_price_use_case.dart'
    as _i10;
import 'package:price_tracker/features/home/domain/use_cases/subscribe_to_symbol_use_case.dart'
    as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHomeRepository_0 extends _i1.SmartFake
    implements _i2.HomeRepository {
  _FakeHomeRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetSymbolsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSymbolsUseCase extends _i1.Mock implements _i4.GetSymbolsUseCase {
  MockGetSymbolsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HomeRepository get homeRepository => (super.noSuchMethod(
        Invocation.getter(#homeRepository),
        returnValue: _FakeHomeRepository_0(
          this,
          Invocation.getter(#homeRepository),
        ),
      ) as _i2.HomeRepository);

  @override
  _i5.Future<_i3.Either<_i6.ErrorEntity, List<_i7.SymbolEntity>>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i5
            .Future<_i3.Either<_i6.ErrorEntity, List<_i7.SymbolEntity>>>.value(
            _FakeEither_1<_i6.ErrorEntity, List<_i7.SymbolEntity>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.ErrorEntity, List<_i7.SymbolEntity>>>);
}

/// A class which mocks [ConnectWebSocketUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectWebSocketUseCase extends _i1.Mock
    implements _i8.ConnectWebSocketUseCase {
  MockConnectWebSocketUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HomeRepository get homeRepository => (super.noSuchMethod(
        Invocation.getter(#homeRepository),
        returnValue: _FakeHomeRepository_0(
          this,
          Invocation.getter(#homeRepository),
        ),
      ) as _i2.HomeRepository);

  @override
  _i5.Future<_i3.Either<_i6.ErrorEntity, String>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.ErrorEntity, String>>.value(
            _FakeEither_1<_i6.ErrorEntity, String>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.ErrorEntity, String>>);
}

/// A class which mocks [SubscribeToWebSocketUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSubscribeToWebSocketUseCase extends _i1.Mock
    implements _i9.SubscribeToWebSocketUseCase {
  MockSubscribeToWebSocketUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HomeRepository get homeRepository => (super.noSuchMethod(
        Invocation.getter(#homeRepository),
        returnValue: _FakeHomeRepository_0(
          this,
          Invocation.getter(#homeRepository),
        ),
      ) as _i2.HomeRepository);

  @override
  _i5.Future<_i3.Either<_i6.ErrorEntity, String>> call(String? symbol) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [symbol],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.ErrorEntity, String>>.value(
            _FakeEither_1<_i6.ErrorEntity, String>(
          this,
          Invocation.method(
            #call,
            [symbol],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.ErrorEntity, String>>);
}

/// A class which mocks [ListenToPriceUpdatesUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockListenToPriceUpdatesUseCase extends _i1.Mock
    implements _i10.ListenToPriceUpdatesUseCase {
  MockListenToPriceUpdatesUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HomeRepository get homeRepository => (super.noSuchMethod(
        Invocation.getter(#homeRepository),
        returnValue: _FakeHomeRepository_0(
          this,
          Invocation.getter(#homeRepository),
        ),
      ) as _i2.HomeRepository);

  @override
  _i5.Stream<_i3.Either<_i6.ErrorEntity, List<_i11.SymbolPriceUpdate>>>
      call() => (super.noSuchMethod(
            Invocation.method(
              #call,
              [],
            ),
            returnValue: _i5.Stream<
                _i3
                .Either<_i6.ErrorEntity, List<_i11.SymbolPriceUpdate>>>.empty(),
          ) as _i5.Stream<
              _i3.Either<_i6.ErrorEntity, List<_i11.SymbolPriceUpdate>>>);
}

/// A class which mocks [CloseWebSocketUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockCloseWebSocketUseCase extends _i1.Mock
    implements _i12.CloseWebSocketUseCase {
  MockCloseWebSocketUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HomeRepository get homeRepository => (super.noSuchMethod(
        Invocation.getter(#homeRepository),
        returnValue: _FakeHomeRepository_0(
          this,
          Invocation.getter(#homeRepository),
        ),
      ) as _i2.HomeRepository);

  @override
  _i5.Future<_i3.Either<_i6.ErrorEntity, String>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.ErrorEntity, String>>.value(
            _FakeEither_1<_i6.ErrorEntity, String>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.ErrorEntity, String>>);
}