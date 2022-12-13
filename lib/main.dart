import 'package:flutter/material.dart';
import 'providers/preferences_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_excel_firestore/firebase_options.dart';

import 'package:flutter_excel_firestore/screens/screens.dart';
import 'package:flutter_excel_firestore/theme/custom_theme.dart';
import 'package:flutter_excel_firestore/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Prefences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyProvider());
}

class MyProvider extends StatelessWidget {
  const MyProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsProvider(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    return MaterialApp(
      scaffoldMessengerKey: productProvider.scaffoldMKey,
      title: 'Flutter Excel Firestore',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.theme,
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => const LandingScreen(),
        '/loading': (context) => const LoadingScreen(),
        '/tutorial': (context) => const TutorialScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
