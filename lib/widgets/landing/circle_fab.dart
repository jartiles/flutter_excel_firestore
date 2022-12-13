import 'package:flutter/material.dart';
import 'package:flutter_excel_firestore/theme/custom_theme.dart';

class CircleFab extends StatelessWidget {
  const CircleFab({
    super.key,
    required this.onPress,
    this.gradient = CustomTheme.circleFabGradient,
    this.shadowColor = const Color(0xFFfea943),
    this.icon = Icons.chevron_right,
    this.marginTop = 0,
  });
  final Function onPress;
  final Gradient gradient;
  final Color shadowColor;
  final IconData icon;
  final double marginTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.only(top: marginTop),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0.5, 5),
          ),
        ],
      ),
      child: ClipRRect(
        child: FloatingActionButton(
          onPressed: () => onPress(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Icon(icon),
        ),
      ),
    );
  }
}
