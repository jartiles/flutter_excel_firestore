import 'package:flutter/material.dart';
import 'package:flutter_excel_firestore/theme/custom_theme.dart';

class ProductStock extends StatelessWidget {
  const ProductStock({Key? key, required this.qty}) : super(key: key);
  final String qty;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 8,
          width: 8,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _returnColor(qty),
          ),
        ),
        Text(
          _returnStock(qty),
          style: TextStyle(shadows: CustomTheme.productShadow),
        ),
      ],
    );
  }

  Color _returnColor(String qty) {
    final stock = double.parse(qty);
    if (stock > 10) {
      return const Color(0xFF29bea2);
    } else {
      return Colors.red;
    }
  }

  String _returnStock(String qty) {
    final stock = double.parse(qty);
    if (stock > 10) {
      return 'Disponible';
    } else {
      return 'Pocas unidades';
    }
  }
}
