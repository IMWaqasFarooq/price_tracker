import 'package:dartz/dartz.dart';

import '../entity/error_entity.dart';
import '../repositories/home_repository.dart';

class CloseWebSocketUseCase {
  final HomeRepository homeRepository;
  CloseWebSocketUseCase({required this.homeRepository});

  Future<Either<ErrorEntity, String>> call() {
    return homeRepository.closeWebSocket();
  }
}