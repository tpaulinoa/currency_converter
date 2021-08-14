import 'package:currency_converter/app/model/currency.dart';
import 'package:flutter/cupertino.dart';

class HomeController {

  late List<Currency> currencies;

  late Currency fromCurrency;
  late Currency toCurrency;

  late final TextEditingController fromText;
  late final TextEditingController toText;

  HomeController(this.fromText, this.toText) {
    currencies = Currency.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert() {
    double value = double.tryParse(fromText.text) ?? 1.0;
    double convertedValue = 0;
    if (toCurrency.name == 'BRL') {
      convertedValue = value * fromCurrency.brl;
    } else if (toCurrency.name == 'USD') {
      convertedValue = value * fromCurrency.usd;
    } else if (toCurrency.name == 'EUR') {
      convertedValue = value * fromCurrency.eur;
    }

    toText.text = convertedValue.toStringAsFixed(2);
  }
}