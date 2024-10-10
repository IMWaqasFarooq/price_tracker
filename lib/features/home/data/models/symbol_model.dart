import '../../domain/entity/symbol_entity.dart';

class SymbolModel {
  String? description;
  String? displaySymbol;
  String? symbol;

  SymbolModel({this.description, this.displaySymbol, this.symbol});

  SymbolModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    displaySymbol = json['displaySymbol'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['displaySymbol'] = this.displaySymbol;
    data['symbol'] = this.symbol;
    return data;
  }
}


extension SymbolModelExtension on SymbolModel {
  SymbolEntity get toEntity=> SymbolEntity(
      description: description,
      displaySymbol: displaySymbol,
    symbol: symbol
  );
}