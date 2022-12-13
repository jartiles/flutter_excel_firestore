import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter_excel_firestore/providers/excel_provider.dart';
import 'package:flutter_excel_firestore/theme/custom_theme.dart';

class SelectFile extends StatelessWidget {
  final ExcelProvider excelProvider;

  const SelectFile({Key? key, required this.excelProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 25,
        width: 90,
        decoration: BoxDecoration(
          gradient: CustomTheme.tutorialGradient,
          borderRadius: BorderRadius.circular(5),
        ),
        child: ElevatedButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              allowedExtensions: ['xlsx'],
              type: FileType.custom,
            );
            if (result != null) {
              excelProvider.excelKeys(result.files.single.path!);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          child: const Text(
            'Select file',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
