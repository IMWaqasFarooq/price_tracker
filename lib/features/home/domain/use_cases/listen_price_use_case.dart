import 'package:dartz/dartz.dart';

import '../../data/models/symbol_price_model.dart';
import '../entity/error_entity.dart';
import '../repositories/home_repository.dart';

class ListenToPriceUpdatesUseCase {
  final HomeRepository homeRepository;
  ListenToPriceUpdatesUseCase({required this.homeRepository});

  Stream<Either<ErrorEntity, List<SymbolPriceUpdate>>> call() {
    return homeRepository.listenToPriceUpdates();
  }
}