import 'dart:io';

import 'package:flutter/material.dart';
import 'package:excel/excel.dart';

import 'package:flutter_excel_firestore/models/product.dart';

class ExcelProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late dynamic _excelFile;
  List<String> firstRows = [];
  List<String> rowTitles = [];

  Map<String, int> productOptions = {'Price': 0, 'Name': 0, 'Stock': 0};
  List<Product> products = [];

  ExcelProvider();

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  void saveProductValues(String key, String value) {
    productOptions[key] = firstRows.indexOf(value);
  }

  void excelKeys(String path) async {
    final bytes = File(path).readAsBytesSync();
    _excelFile = Excel.decodeBytes(bytes);
    //- Almacenar excel en vez del path
    final excelFirstSheet = _excelFile.tables.keys.first;
    for (var row in _excelFile.tables[excelFirstSheet].rows.first) {
      firstRows.add(row.value);
    }
    rowTitles = [...firstRows];
    notifyListeners();
  }

  Future<List<Product>> saveProducts() async {
    //- Excel rows
    final firtsPage = _excelFile.tables.keys.first;
    final rows = _excelFile.tables[firtsPage]!.rows;
    //- Products
    for (int i = 0; i < rows.length; i++) {
      if (rows[i][productOptions['Price']].value != null &&
          rows[i][productOptions['Name']].value != null &&
          rows[i][productOptions['Stock']].value != null) {
        products.add(Product(
          qty: rows[i][productOptions['Stock']].value.toString(),
          name: rows[i][productOptions['Name']].value,
          price: rows[i][productOptions['Price']].value.toString(),
        ));
      }
    }
    return products;
  }

  clearData() {
    _excelFile = null;
    products.clear();
    rowTitles.clear();
    firstRows.clear();
  }
}
