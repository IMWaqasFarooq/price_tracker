import 'package:dartz/dartz.dart';
import 'package:price_tracker/features/home/data/models/symbol_model.dart';
import 'package:price_tracker/features/home/domain/entity/error_entity.dart';

import '../../models/symbol_price_model.dart';

abstract class HomeRemoteDataSource {

  Future<Either<ErrorEntity, List<SymbolModel>>> getSymbols();
  Future<Either<ErrorEntity, String>> connectToWebSocket();
  Future<Either<ErrorEntity, String>> subscribeToSymbol(String symbol);
  Future<Either<ErrorEntity, String>> unsubscribeFromSymbol(String symbol);
  Future<Either<ErrorEntity, String>> closeWebSocket();
  Stream<Either<ErrorEntity, List<SymbolPriceUpdate>>> listenToPriceUpdates();

}
