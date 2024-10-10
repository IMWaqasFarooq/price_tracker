import 'dart:async';
import 'package:dartz/dartz.dart';
import '../entity/error_entity.dart';
import '../repositories/home_repository.dart';


class ConnectWebSocketUseCase {
  final HomeRepository homeRepository;
  ConnectWebSocketUseCase({required this.homeRepository});

  Future<Either<ErrorEntity, String>> call() {
    return homeRepository.connectToWebSocket();
  }
}
