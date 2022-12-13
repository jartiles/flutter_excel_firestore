import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_excel_firestore/providers/products_provider.dart';

import 'package:flutter_excel_firestore/widgets/widgets.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      body: productsProvider.getLoading
          ? const Loading()
          : RefreshIndicator(
              onRefresh: () => productsProvider.loadProducts(),
              child: Container(
                height: double.infinity,
                decoration: _linearDecoration(),
                child: Column(
                  children: const [
                    SearchHeader(),
                    ProductsList(),
                  ],
                ),
              ),
            ),
    );
  }

  BoxDecoration _linearDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF211539),
            Color(0xFF1e1e28),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 0.8],
        ),
      );
}
