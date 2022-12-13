import 'package:flutter/material.dart';

class CustomTheme {
  static const Color primaryColor = Color(0xFFfea943);

  // Generate gradients
  static BoxDecoration containerProductGrad(
    List<Color> colors,
    Color shadowColor,
  ) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
        colors: colors,
        stops: const [0.05, 0.6, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      boxShadow: [
        BoxShadow(
          color: shadowColor.withOpacity(0.45),
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  //- Gradients products
  static BoxDecoration get yellowGradient => containerProductGrad([
        const Color(0xFFfdc683),
        const Color(0xFFfebb69),
        const Color(0xFFfea943)
      ], const Color(0xFFffdcb1));

  static BoxDecoration get pinkGradient => containerProductGrad([
        const Color(0xffE59BB8),
        const Color(0xffFB80A5),
        const Color(0xffF45D8B)
      ], const Color(0xFFf59fba));

  static BoxDecoration get blueGradient => containerProductGrad([
        const Color(0xff85E3FC),
        const Color(0xff66D5F4),
        const Color(0xff46C7EB)
      ], const Color(0xFF92dff5));

  static BoxDecoration get purpleGradient => containerProductGrad([
        const Color(0xffB7A8F5),
        const Color(0xffA390F9),
        const Color(0xff9580F9)
      ], const Color(0xFFc9befb));

  //- Gradients widgets
  static const circleFabGradient = LinearGradient(
    colors: [
      Color(0xFFfdc683),
      Color(0xFFfebb69),
      Color(0xFFfea943),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const tutorialGradient = LinearGradient(
    colors: [Color(0xffE59BB8), Color(0xffFB80A5), Color(0xffF45D8B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  //- Product text shadow
  static List<Shadow> productShadow = [
    const Shadow(
      color: Colors.black54,
      offset: Offset(0.2, 1),
    )
  ];

  //- Theme
  static ThemeData theme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    primaryColorDark: primaryColor,
    scaffoldBackgroundColor: const Color(0xFF1e1e28),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: const StadiumBorder(),
        fixedSize: const Size(150, 40),
      ),
    ),
  );
}
