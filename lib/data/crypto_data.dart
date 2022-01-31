import 'dart:async';

class Crypto {
  String name;
  String price_usd;
  String percent_change_1h;
  String symbol;

  Crypto(
      {required this.name,
      required this.price_usd,
      required this.percent_change_1h, required this.symbol});

  Crypto.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        price_usd = map['price_usd'],
        percent_change_1h = map['percent_change_1h'],
        symbol = map['symbol'];
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
