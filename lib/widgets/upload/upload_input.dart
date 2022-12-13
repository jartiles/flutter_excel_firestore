import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_excel_firestore/providers/excel_provider.dart';

class UploadInput extends StatelessWidget {
  const UploadInput({
    Key? key,
    required this.optList,
    required this.title,
  }) : super(key: key);

  final List optList;
  final String title;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final excelProvider = Provider.of<ExcelProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline6),
        Container(
          width: mediaQuery.width * 0.5,
          margin: const EdgeInsets.all(10),
          height: 55,
          child: DropdownButtonFormField<String>(
            decoration: _selectDecoration(),
            validator: (value) {
              if (value == null) {
                return 'You must select an option';
              }
            },
            onChanged: (value) => excelProvider.saveProductValues(
              title,
              value!,
            ),
            items: [
              ...optList.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e, style: const TextStyle(fontSize: 12)),
                );
              })
            ],
          ),
        )
      ],
    );
  }

  InputDecoration _selectDecoration() {
    return const InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
      ),
    );
  }
}
