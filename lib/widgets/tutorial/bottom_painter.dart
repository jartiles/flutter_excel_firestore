import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_excel_firestore/providers/tutorial_provider.dart';

import '../widgets.dart';

import 'package:flutter_excel_firestore/theme/custom_theme.dart';

class BottomPainter extends StatelessWidget {
  const BottomPainter({Key? key, required this.dotsQty}) : super(key: key);
  final int dotsQty;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: YellowGradientPainter(),
          ),
          //- Pages btns
          Positioned.fill(
            bottom: -50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const _ScrollBtn(title: 'Back'),
                Dots(dots: dotsQty),
                const _ScrollBtn(title: 'Next'),
              ],
            ),
          ),
          //- Navigation btn
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleFab(
                icon: Icons.arrow_forward,
                onPress: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScrollBtn extends StatelessWidget {
  const _ScrollBtn({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final tutorialProvider = Provider.of<TutorialProvider>(
          context,
          listen: false,
        );
        if (title == 'Back') {
          tutorialProvider.backPage();
        } else {
          if (tutorialProvider.getActivePage ==
              tutorialProvider.pages.length - 1) {
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            tutorialProvider.nextPage();
          }
        }
      },
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 14,
        ),
      ),
    );
  }
}

class YellowGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final widthPath = size.width;
    final heightPath = size.height;

    final rect = Rect.fromCircle(center: const Offset(0, 55.0), radius: 100);
    final painter = Paint()
      ..shader = CustomTheme.circleFabGradient.createShader(rect);

    final path = Path();
    path.quadraticBezierTo(
      0,
      heightPath * 0.2,
      widthPath * 0.2,
      heightPath * 0.2,
    );
    path.quadraticBezierTo(
      widthPath * 0.35,
      heightPath * 0.2,
      widthPath * 0.45,
      heightPath * 0.5,
    );
    path.quadraticBezierTo(
      widthPath * 0.5,
      heightPath * 0.65,
      widthPath * 0.55,
      heightPath * 0.5,
    );
    //- Center line
    path.quadraticBezierTo(
      widthPath * 0.65,
      heightPath * 0.2,
      widthPath * 0.8,
      heightPath * 0.2,
    );
    path.quadraticBezierTo(widthPath * .95, heightPath * 0.21, widthPath, 0);
    path.lineTo(widthPath, heightPath);
    path.lineTo(0, heightPath);

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
