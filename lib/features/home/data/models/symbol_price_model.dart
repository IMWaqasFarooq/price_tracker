class SymbolPriceModel {
  List<SymbolPriceUpdate>? symbolPriceUpdate;
  String? type;

  SymbolPriceModel({this.symbolPriceUpdate, this.type});

  SymbolPriceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      symbolPriceUpdate = <SymbolPriceUpdate>[];
      json['data'].forEach((v) {
        symbolPriceUpdate!.add(SymbolPriceUpdate.fromJson(v));
      });
    }
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (symbolPriceUpdate != null) {
      data['data'] = symbolPriceUpdate!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    return data;
  }
}

class SymbolPriceUpdate {
  dynamic c;
  double? p;
  String? s;
  double? t;
  double? v;

  SymbolPriceUpdate({this.c, this.p, this.s, this.t, this.v});

  SymbolPriceUpdate.fromJson(Map<String, dynamic> json) {
    c = json['c'];

    p = (json['p'] is int) ? (json['p'] as int).toDouble() : json['p']?.toDouble();

    s = json['s'];

    t = (json['t'] is int) ? (json['t'] as int).toDouble() : json['t']?.toDouble();

    v = (json['v'] is int) ? (json['v'] as int).toDouble() : json['v']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['c'] = c;
    data['p'] = p;
    data['s'] = s;
    data['t'] = t;
    data['v'] = v;
    return data;
  }
}
