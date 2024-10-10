import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:price_tracker/features/home/data/models/symbol_model.dart';
import 'package:price_tracker/features/home/domain/entity/error_entity.dart';
import 'package:price_tracker/features/home/domain/entity/symbol_entity.dart';

import '../../../../core/constants/error_constants.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/remote/home_remote_data_source.dart';
import '../models/symbol_price_model.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  InternetConnectionChecker connection;

  HomeRepositoryImpl({required this.homeRemoteDataSource, required this.connection});

  @override
  Future<Either<ErrorEntity, List<SymbolEntity>>> getSymbols() async {
    // TODO: implement getSymbols
    if (await connection.hasConnection) {
      try {
        final result = await homeRemoteDataSource.getSymbols();
        return result.fold((error) {
          return Left(error);
        }, (model) async {
          List<SymbolEntity> list = model.map((e) => e.toEntity).toList();
          return Right(list);
        });
      } catch (e) {
        debugPrint(e.toString());
        return Left(ErrorEntity(statusCode: 0, status: "error", message: ErrorsConstants.somethingWrong));
      }
    } else {
      return Left(ErrorEntity(statusCode: 0, status: "error", message: ErrorsConstants.networkError));
    }
  }



  @override
  Future<Either<ErrorEntity, String>> connectToWebSocket() async {
    if (await connection.hasConnection) {
      try {
        final result = await homeRemoteDataSource.connectToWebSocket();
        return result.fold((error) {
          return Left(error);
        }, (model) async {
          return Right(model);
        });
      } catch (e) {
        debugPrint(e.toString());
        return Left(ErrorEntity(statusCode: 0, status: "error", message: ErrorsConstants.somethingWrong));
      }
    } else {
      return Left(ErrorEntity(statusCode: 0, status: "error", message: ErrorsConstants.networkError));
    }
  }

  @override
  Future<Either<ErrorEntity, String>> subscribeToSymbol(String symbol) async {
    if (await connection.hasConnection) {
      try {
        final result = await homeRemoteDataSource.subscribeToSymbol(symbol);
        return result.fold((error) {
          return Left(error);
        }, (model) async {
          return Right(model);
        });
      } catch (e) {
        debugPrint(e.toString());
        return Left(ErrorEntity(statusCode: 0, status: "error", message: ErrorsConstants.somethingWrong));
      }
    } else {
      return Left(ErrorEntity(statusCode: 0, status: "error", message: ErrorsConstants.networkError));
    }
  }

  @override
  Future<Either<ErrorEntity, String>> unsubscribeFromSymbol(String symbol) async {
    if (await connection.hasConnection) {
      try {
        final result = await homeRemoteDataSource.unsubscribeFromSymbol(symbol);
        return result.fold((error) {
          return Left(error);
        }, (model) async {
          return Right(model);
        });
      } catch (e) {
        debugPrint(e.toString());
        return Left(ErrorEntity(statusCode: 0, status: "error", message: ErrorsConstants.somethingWrong));
      }
    } else {
      return Left(ErrorEntity(statusCode: 0, status: "error", message: ErrorsConstants.networkError));
    }
  }

  @override
  Future<Either<ErrorEntity, String>> closeWebSocket() async {
    if (await connection.hasConnection) {
      try {
        final result = await homeRemoteDataSource.closeWebSocket();
        return result.fold((error) {
          return Left(error);
        }, (model) async {
          return Right(model);
        });
      } catch (e) {
        debugPrint(e.toString());
        return Left(ErrorEntity(statusCode: 0, status: "error", message: ErrorsConstants.somethingWrong));
      }
    } else {
      return Left(ErrorEntity(statusCode: 0, status: "error", message: ErrorsConstants.networkError));
    }
  }

  @override
  Stream<Either<ErrorEntity, List<SymbolPriceUpdate>>> listenToPriceUpdates() {
    return homeRemoteDataSource.listenToPriceUpdates();
  }
}
