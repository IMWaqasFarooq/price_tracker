
import 'package:dartz/dartz.dart';
import 'package:price_tracker/features/home/domain/entity/error_entity.dart';
import 'package:price_tracker/features/home/domain/entity/symbol_entity.dart';

import '../../data/models/symbol_price_model.dart';


abstract class HomeRepository {
  Future<Either<ErrorEntity, List<SymbolEntity>>> getSymbols();
  Future<Either<ErrorEntity, String>> connectToWebSocket();
  Future<Either<ErrorEntity, String>> subscribeToSymbol(String symbol);
  Future<Either<ErrorEntity, String>> unsubscribeFromSymbol(String symbol);
  Future<Either<ErrorEntity, String>> closeWebSocket();
  Stream<Either<ErrorEntity, List<SymbolPriceUpdate>>> listenToPriceUpdates();
}
