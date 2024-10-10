import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:price_tracker/features/home/data/models/symbol_price_model.dart';

part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getSymbols() = GetSymbolsEvent;
  const factory HomeEvent.updateSymbolPrices(List<SymbolPriceUpdate> priceData) = UpdateSymbolPricesEvent;
}
