import 'package:crypto_app2/data/crypto_data.dart';
import 'package:crypto_app2/dependency_injection.dart';

abstract class CryptoListViewContract {
  void onLoadCryptoComplete(List<Crypto> items);
  void onLoadCryptoError();
}

class CryptoListPresenter {
  late CryptoListViewContract _view;
  late CryptoRepository _repository;

  CryptoListPresenter(this._view) {
    _repository = new Injector().cryptoRepository;
  }

  void loadCurrencies() {
    _repository
        .fetchCurrencies()
        .then((c) => _view.onLoadCryptoComplete(c))
        .catchError((onError) => _view.onLoadCryptoError());
  }
}
