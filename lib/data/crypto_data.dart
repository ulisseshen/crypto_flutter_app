import 'dart:async';

import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/cupertino.dart';

class Crypto {
  String name;
  String price_usd;
  String percent_change_1h;
  Icon icon;

  Crypto(
      {required this.name,
      required this.price_usd,
      required this.percent_change_1h, required this.icon});

  Crypto.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        price_usd = map['price_usd'],
        percent_change_1h = map['percent_change_1h'],
        icon = const Icon(CryptoFontIcons.BTC);
}

abstract class CryptoRepository {
  Future<List<Crypto>> fetchCurrencies();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
