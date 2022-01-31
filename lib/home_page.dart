import 'package:crypto_app2/data/crypto_data.dart';
import 'package:crypto_app2/modules/crypto_presenter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements CryptoListViewContract {
  late CryptoListPresenter _presenter;
  late List<Crypto> _currencies;
  late bool _isLoading;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  _HomePageState() {
    _presenter = new CryptoListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  AppBar(
          title:  Text("Crypto App"),
          elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
        ),
        body: _isLoading
            ?  Center(
          child:  CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: _currencies.length,
          itemBuilder: (BuildContext context,int index)=>
              _getRowWithDivider(index),)
    );
  }

  Widget _getRowWithDivider(int i) {
    final Crypto currency = _currencies[i];
    var children = <Widget>[
       Padding(
          padding:  EdgeInsets.all(10.0),
          child: _getListItemUi(currency)
      ),
       Divider(height: 5.0),
    ];

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  ListTile _getListItemUi(Crypto currency) {
    return  ListTile(
      leading: CircleAvatar(child: currency.icon),
      title:  Text(currency.name,
          style: new TextStyle(fontWeight: FontWeight.bold)),
      subtitle:
      _getSubtitleText(currency.price_usd, currency.percent_change_1h),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUSD\n", style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour: $percentageChange%";
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }

    return new RichText(
        text: new TextSpan(
            children: [priceTextWidget, percentageChangeTextWidget]));
  }

  @override
  void onLoadCryptoComplete(List<Crypto> items) {
    // TODO: implement onLoadCryptoComplete

    setState(() {
      _currencies = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadCryptoError() {
    // TODO: implement onLoadCryptoError
  }
}
