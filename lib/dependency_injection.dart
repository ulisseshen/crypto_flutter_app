
import 'package:crypto_app2/data/crypto_data.dart';
import 'package:crypto_app2/data/crypto_data_mock.dart';
import 'package:crypto_app2/data/crypto_data_prod.dart';

enum Flavor { MOCK, PROD }

//DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static late Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  CryptoRepository get cryptoRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return  MockCryptoRepository();
      default:
        return  ProdCryptoRepository();
    }
  }
}
