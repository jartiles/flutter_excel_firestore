import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_excel_firestore/providers/products_provider.dart';
import 'package:flutter_excel_firestore/theme/custom_theme.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final landscape = size.height < 400;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: landscape ? size.height * 0.20 : size.height * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [_Title(), _SearchForm()],
      ),
    );
  }
}

//- Title
class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Find the products by name',
      maxLines: 2,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _SearchForm extends StatelessWidget {
  const _SearchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsServices =
        Provider.of<ProductsProvider>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 45,
      child: TextFormField(
        decoration: _circularInput(),
        style: const TextStyle(color: Colors.white),
        cursorHeight: 20,
        onChanged: (value) => productsServices.searchTitle(value),
      ),
    );
  }

  InputDecoration _circularInput() => InputDecoration(
        hintText: 'Search...',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: CustomTheme.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      );
}
