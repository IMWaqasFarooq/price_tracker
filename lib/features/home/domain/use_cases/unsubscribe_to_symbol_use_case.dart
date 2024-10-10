import 'package:dartz/dartz.dart';

import '../entity/error_entity.dart';
import '../repositories/home_repository.dart';

class UnsubscribeToWebSocketUseCase {
  final HomeRepository homeRepository;
  UnsubscribeToWebSocketUseCase({required this.homeRepository});

  Future<Either<ErrorEntity, String>> call(String symbol) {
    return homeRepository.unsubscribeFromSymbol(symbol);
  }
}