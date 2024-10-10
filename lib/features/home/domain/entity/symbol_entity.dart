import 'dart:ui';

import 'package:equatable/equatable.dart';

class SymbolEntity {
  String? description;
  String? displaySymbol;
  String? symbol;
  double? price;
  Color? color;

  SymbolEntity({this.description, this.displaySymbol, this.symbol, this.price, this.color});

  SymbolEntity copyWith({
    String? description,
    String? displaySymbol,
    String? symbol,
    double? price,
    Color? color,
  }) {
    return SymbolEntity(
      displaySymbol: displaySymbol ?? this.displaySymbol,
      price: price ?? this.price,
      description: description ?? this.description,
      symbol: symbol ?? this.symbol,
      color: color ?? this.color
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [description,displaySymbol, symbol, price];

}