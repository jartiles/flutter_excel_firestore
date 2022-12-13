import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_excel_firestore/providers/tutorial_provider.dart';
import 'package:flutter_excel_firestore/providers/preferences_provider.dart';

import 'package:flutter_excel_firestore/widgets/widgets.dart';

import 'package:flutter_excel_firestore/theme/custom_theme.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TutorialProvider(),
      child: Builder(
        builder: ((context) {
          final elements = Provider.of<TutorialProvider>(context).pages;
          return Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const _SkipBtn(),
                  Expanded(child: _PageCarrousel(pages: elements)),
                  BottomPainter(dotsQty: elements.length)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _PageCarrousel extends StatefulWidget {
  const _PageCarrousel({Key? key, required this.pages}) : super(key: key);
  final List pages;

  @override
  State<_PageCarrousel> createState() => _PageCarrouselState();
}

class _PageCarrouselState extends State<_PageCarrousel> {
  late PageController controller;

  @override
  void initState() {
    final tutorialProvider = Provider.of<TutorialProvider>(
      context,
      listen: false,
    );
    controller = tutorialProvider.tutorialController;
    controller.addListener(() {
      tutorialProvider.setActivePage = controller.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: PageView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: widget.pages
            .map((page) =>
                _PageElement(child: page['child'], title: page['title']))
            .toList(),
      ),
    );
  }
}

class _PageElement extends StatelessWidget {
  const _PageElement({required this.child, required this.title});
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(child: child),
        Text(
          title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}

class _SkipBtn extends StatelessWidget {
  const _SkipBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 25,
      width: 130,
      decoration: BoxDecoration(
        gradient: CustomTheme.tutorialGradient,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        onPressed: () {
          Prefences.dontShowTutorial();
          Navigator.pushReplacementNamed(context, '/home');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: const Text(
          'Dont show again',
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
