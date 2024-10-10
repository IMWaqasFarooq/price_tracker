
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:price_tracker/features/home/data/models/symbol_model.dart';
import 'package:price_tracker/features/home/domain/entity/error_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../../core/constants/app_contstants.dart';
import '../../../../../core/constants/error_constants.dart';
import '../../models/symbol_price_model.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final Dio dio;
  WebSocketChannel? _channel;


  HomeRemoteDataSourceImpl({required this.dio});

  @override
  Future<Either<ErrorEntity, List<SymbolModel>>> getSymbols() async {
    // TODO: implement getSymbols

    try {
      final result = await dio.get(
        AppConstants.getSymbol,
      );

      if (result.statusCode == 200) {
        final List<dynamic> parsed = json.decode(result.data);
        List<SymbolModel> symbolsList = parsed.map((json) => SymbolModel.fromJson(json)).take(10).toList();

        return Right(symbolsList);
      } else {
        return Left(ErrorEntity(
            statusCode: result.statusCode,
            message: result.statusMessage
        ));
      }
    } catch (e) {
      print(e.toString());

      return Left(ErrorEntity(
          statusCode: 0,
          status: "error",
          message: ErrorsConstants.somethingWrong
      )
      );
    }
  }

  @override
  Future<Either<ErrorEntity, String>> connectToWebSocket() async {
    try {
      _channel =  WebSocketChannel.connect(Uri.parse(AppConstants.webSocketUrl));
      await _channel?.ready;
      print("WebSocket connected successfully");
      return Right("WebSocket connected successfully");
    } catch (e) {
      print("WebSocket channel is not connected.");
      print(e.toString());

      return Left(ErrorEntity(
        statusCode: 0,
        message: "Failed to connect to WebSocket: ${e.toString()}",
      ));
    }
  }

  @override
  Future<Either<ErrorEntity, String>> subscribeToSymbol(String symbol) async {
    try {
      if (_channel != null) {
        final request = {"type": "subscribe", "symbol": symbol};
        _channel?.sink.add(jsonEncode(request));
        print("Subscribed to symbol $symbol successfully");
        return Right("Subscribed to symbol $symbol successfully");
      } else {
        print("failed to subscribe $symbol.");

        return Left(ErrorEntity(
          statusCode: 0,
          message: "WebSocket channel is not connected.",
        ));
      }
    } catch (e) {
      print(e.toString());
      return Left(ErrorEntity(
        statusCode: 0,
        message: "Error while subscribing to symbol: ${e.toString()}",
      ));
    }
  }

  @override
  Future<Either<ErrorEntity, String>> unsubscribeFromSymbol(String symbol) async {
    try {
      if (_channel != null) {
        final request = {"type": "unsubscribe", "symbol": symbol};
        _channel?.sink.add(jsonEncode(request));
        return Right("Unsubscribed from symbol $symbol successfully");
      } else {
        return Left(ErrorEntity(
          statusCode: 0,
          message: "WebSocket channel is not connected.",
        ));
      }
    } catch (e) {
      return Left(ErrorEntity(
        statusCode: 0,
        message: "Error while unsubscribing from symbol: ${e.toString()}",
      ));
    }
  }

  @override
  Future<Either<ErrorEntity, String>> closeWebSocket() async {
    try {
      _channel?.sink.close();
      print("WebSocket closed successfully");
      return Right("WebSocket closed successfully");
    } catch (e) {
      print(e.toString());
      return Left(ErrorEntity(
        statusCode: 0,
        message: "Failed to close WebSocket connection: ${e.toString()}",
      ));
    }
  }

  @override
  Stream<Either<ErrorEntity, List<SymbolPriceUpdate>>> listenToPriceUpdates() async* {
    try {
      if (_channel == null) {
        yield Left(ErrorEntity(
          statusCode: 0,
          message: "WebSocket not connected",
        ));
      } else {
        await for (var message in _channel!.stream) {
          try {
            // final data = jsonDecode(message) as Map<String, dynamic>;
            print(message.toString());
            SymbolPriceModel symbolPriceModel = SymbolPriceModel.fromJson(json.decode(message));
            yield Right(symbolPriceModel.symbolPriceUpdate??[]);
          } catch (e) {
            print(e.toString());
            yield Left(ErrorEntity(
              statusCode: 0,
              message: "Error parsing WebSocket message: ${e.toString()}",
            ));
          }
        }
      }
    } catch (e) {
      print(e.toString());
      print("Error listening to WebSocket:");
      yield Left(ErrorEntity(
        statusCode: 0,
        message: "Error listening to WebSocket: ${e.toString()}",
      ));
    }
  }
}