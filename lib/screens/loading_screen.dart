import 'package:flutter/material.dart';

import 'package:flutter_excel_firestore/providers/preferences_provider.dart';

import 'package:flutter_excel_firestore/widgets/widgets.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Prefences.showTutorial(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushReplacementNamed(context, '/tutorial');
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacementNamed(context, '/home');
              });
            }
            return const Loading();
          },
        ),
      ),
    );
  }
}
