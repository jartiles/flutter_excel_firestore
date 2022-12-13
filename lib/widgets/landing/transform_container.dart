import 'package:flutter/material.dart';
import 'package:flutter_excel_firestore/theme/custom_theme.dart';

class TransformContainer extends StatelessWidget {
  const TransformContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: const [_Background(), FlutterLogo(size: 100)],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewY(-0.15),
      child: Container(decoration: CustomTheme.yellowGradient),
    );
  }
}
