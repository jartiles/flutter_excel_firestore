import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_excel_firestore/providers/tutorial_provider.dart';

class Dots extends StatelessWidget {
  const Dots({Key? key, required this.dots}) : super(key: key);
  final int dots;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(dots, (index) => _Dot(index: index)),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final actualIndex = Provider.of<TutorialProvider>(context).getActivePage;
    final activeDot =
        (actualIndex - 0.5 <= index && actualIndex + 0.5 >= index);

    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: activeDot ? Colors.white : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
