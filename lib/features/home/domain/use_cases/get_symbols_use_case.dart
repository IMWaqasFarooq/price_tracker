import 'package:dartz/dartz.dart';
import 'package:price_tracker/features/home/domain/entity/error_entity.dart';
import 'package:price_tracker/features/home/domain/entity/symbol_entity.dart';
import 'package:price_tracker/features/home/domain/repositories/home_repository.dart';


class GetSymbolsUseCase {
  final HomeRepository homeRepository;

  GetSymbolsUseCase({required this.homeRepository});

Future<Either<ErrorEntity, List<SymbolEntity>>> call() {
  return homeRepository.getSymbols();
}

}