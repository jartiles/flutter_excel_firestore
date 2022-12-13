import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:flutter_excel_firestore/models/product.dart';

import 'package:flutter_excel_firestore/widgets/products/product_stock.dart';
import 'package:flutter_excel_firestore/theme/custom_theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.index, required this.product})
      : super(key: key);
  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: const Duration(milliseconds: 300),
      from: 20,
      child: Container(
        height: 70,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: _getGradient(index),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _TitleStock(product: product)),
            Container(
              alignment: Alignment.center,
              width: 70,
              child: Text(
                '\$${product.price}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  shadows: CustomTheme.productShadow,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _getGradient(index) {
    switch (index) {
      case 0:
        return CustomTheme.pinkGradient;
      case 1:
        return CustomTheme.yellowGradient;
      case 2:
        return CustomTheme.purpleGradient;
      case 3:
        return CustomTheme.blueGradient;
      default:
        return CustomTheme.yellowGradient;
    }
  }
}

class _TitleStock extends StatelessWidget {
  const _TitleStock({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          maxLines: 2,
          overflow: TextOverflow.fade,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: CustomTheme.productShadow,
          ),
        ),
        ProductStock(qty: product.qty),
      ],
    );
  }
}
