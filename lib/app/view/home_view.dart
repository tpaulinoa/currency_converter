import 'package:currency_converter/app/component/currency_line.dart';
import 'package:currency_converter/app/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(fromText, toText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 120, bottom: 30),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 130,
              width: 130,
            ),
            CurrencyLine(
              selectedItem: homeController.fromCurrency,
              fromTextController: fromText,
              items: homeController.currencies,
              onChanged: (value) {
                setState(() {
                  homeController.fromCurrency = value!;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            CurrencyLine(
              selectedItem: homeController.toCurrency,
              fromTextController: toText,
              items: homeController.currencies,
              onChanged: (value) {
                setState(() {
                  homeController.toCurrency = value!;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                homeController.convert();
              },
              child: Text(
                'Converter',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.yellow),
            )
          ],
        ),
      ),
    ));
  }
}
