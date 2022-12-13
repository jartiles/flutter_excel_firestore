import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_excel_firestore/screens/products_screen.dart';
import 'package:flutter_excel_firestore/screens/upload_screen.dart';
import 'package:flutter_excel_firestore/widgets/custom_navigation.dart';

import 'package:flutter_excel_firestore/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => ExcelProvider()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: const [_Pages(), _PositionedContainer()],
          ),
        ),
      ),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return PageView(
      controller: navigationProvider.getPageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [ProductsScreen(), UploadScreen()],
    );
  }
}

class _PositionedContainer extends StatelessWidget {
  const _PositionedContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: const CustomNavigation(),
      ),
    );
  }
}
