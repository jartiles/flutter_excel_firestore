import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _activePage = 0;
  final PageController _pageController = PageController();

  get getActivePage => _activePage;

  set setActivePage(int page) {
    _activePage = page;
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
    notifyListeners();
  }

  get getPageController => _pageController;
}
