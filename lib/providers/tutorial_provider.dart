import 'package:flutter/material.dart';

class TutorialProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> pages = [
    {
      'child': Image.asset('assets/load_products.png'),
      'title': 'Uplod your products on the tab "Upload Products"'
    },
    {
      'child': Image.asset('assets/select_file.png'),
      'title': 'Upload your Excel file using the button "Select file"'
    },
    {
      'child': Image.asset('assets/excel_format.png'),
      'title':
          'The Excel file requires the columns Name, Price and Stock in the first row of the file.'
    },
    {
      'child': Image.asset('assets/select_row.png'),
      'title':
          'After uploading the file you only have to select which column belongs to the Name, Price and Stock.'
    },
  ];

  double _activePage = 0;
  final PageController tutorialController = PageController();

  set setActivePage(double value) {
    _activePage = value;
    notifyListeners();
  }

  get getActivePage => _activePage;

  backPage() {
    if (_activePage > 0) {
      final int backPage = _activePage.toInt() - 1;
      tutorialController.animateToPage(
        backPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  nextPage() {
    if (_activePage < pages.length - 1) {
      final int nextPage = _activePage.toInt() + 1;
      tutorialController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }
}
