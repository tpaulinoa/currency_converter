import 'package:currency_converter/app/model/currency.dart';
import 'package:flutter/material.dart';

class CurrencyLine extends StatelessWidget {
  final List<Currency> items;
  final Currency selectedItem;
  final TextEditingController fromTextController;
  final void Function(Currency?) onChanged;

  const CurrencyLine(
      {Key? key,
      required this.items,
      required this.fromTextController,
      required this.onChanged,
      required this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 57,
            child: DropdownButton<Currency>(
              isExpanded: true,
              // iconEnabledColor: Colors.blue,
              // iconDisabledColor: Colors.red,
              icon: Icon(Icons.arrow_drop_down_circle_outlined),
              value: selectedItem,
              underline: Container(
                height: 1,
                color: Colors.yellow,
              ),
              items: items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: fromTextController,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow))),
          ),
        ),
      ],
    );
  }
}
