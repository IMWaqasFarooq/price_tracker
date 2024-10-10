import 'package:dartz/dartz.dart';

import '../entity/error_entity.dart';
import '../repositories/home_repository.dart';

class SubscribeToWebSocketUseCase {
  final HomeRepository homeRepository;
  SubscribeToWebSocketUseCase({required this.homeRepository});

  Future<Either<ErrorEntity, String>> call(String symbol) {
    return homeRepository.subscribeToSymbol(symbol);
  }
}