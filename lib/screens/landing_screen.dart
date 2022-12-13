import 'package:flutter/material.dart';
//- Widgets
import 'package:flutter_excel_firestore/widgets/widgets.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TransformContainer(),
            //- Titles
            const SizedBox(height: 40),
            const _TitleText(
                title: 'All the products you need on your hand', size: 30),
            const _TitleText(
              title: 'Import your products from an Excel file',
              size: 20,
            ),
            const SizedBox(height: 20),
            //- Button
            CircleFab(
              onPress: () =>
                  Navigator.pushReplacementNamed(context, '/loading'),
            )
          ],
        ),
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText({Key? key, required this.title, required this.size})
      : super(key: key);

  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
