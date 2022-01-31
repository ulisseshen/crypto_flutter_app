import 'dart:async';

import 'package:crypto_app2/data/crypto_data.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/cupertino.dart';

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() {
    // TODO: implement fetchCurrencies
    return new Future.value(currencies);
  }
}

var currencies = <Crypto>[
  new Crypto(name: "Bitcoin", price_usd: "800.60", percent_change_1h: "-0.7", icon: Icon(CryptoFontIcons.BTC,)),
  new Crypto(name: "Ethereum", price_usd: "650.30", percent_change_1h: "0.85", icon: Icon(CryptoFontIcons.ETH)),
  new Crypto(name: "Ripple", price_usd: "300.00", percent_change_1h: "-0.25", icon: Icon(CryptoFontIcons.XRP)),
];
