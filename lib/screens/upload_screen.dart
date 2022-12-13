import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_excel_firestore/widgets/widgets.dart';
import 'package:flutter_excel_firestore/providers/providers.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final excelProvider = Provider.of<ExcelProvider>(context);
    final productProvider = Provider.of<ProductsProvider>(context);
    final productsLoading = productProvider.getLoading;

    final List excelOptTitles = excelProvider.rowTitles;
    final Map<String, int> productOptList = excelProvider.productOptions;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            SelectFile(excelProvider: excelProvider),
            const SizedBox(height: 20),
            ...productOptList.keys.map((option) {
              return UploadInput(
                optList: excelOptTitles,
                title: option,
              );
            }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: productsLoading
                  ? null
                  : () async {
                      final products = await excelProvider.saveProducts();
                      await productProvider.updateProductsFromExcel(products);
                      excelProvider.clearData();
                    },
              child: productsLoading
                  ? const CircularProgressIndicator()
                  : const Text('Save'),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
