import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_excel_firestore/providers/products_provider.dart';
import 'package:flutter_excel_firestore/widgets/products/product_card.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final productsList = productsProvider.productsList;
    int colorIndex = 0;
    return Expanded(
      child: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (_, index) {
          if (colorIndex == 4) {
            colorIndex = 0;
          } else {
            colorIndex++;
          }
          return ProductCard(
            index: colorIndex,
            product: productsList[index],
          );
        },
      ),
    );
  }
}
