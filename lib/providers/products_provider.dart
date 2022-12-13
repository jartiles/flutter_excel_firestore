import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_excel_firestore/models/product.dart';

class ProductsProvider extends ChangeNotifier {
  static final GlobalKey<ScaffoldMessengerState> _messengerKey =
      GlobalKey<ScaffoldMessengerState>();
  List<Product> allProductsList = [];
  List<Product> productsList = [];
  List<Product> copyProductsList = [];
  bool _isLoading = false;
  final db = FirebaseFirestore.instance;

  get getLoading => _isLoading;
  get scaffoldMKey => _messengerKey;

  ProductsProvider() {
    loadProducts();
  }

  Future getProducts() async {
    dynamic query = db.collection("products").orderBy('name');
    await query.get().then(
      (value) {
        final docs = value.docs;
        if (docs.isEmpty) return;
        for (var doc in docs) {
          final docData = doc.data();
          allProductsList.add(
            Product.fromFirestore(doc),
          );
          if (double.parse(docData['qty']) >= 1) {
            productsList.add(
              Product.fromFirestore(doc),
            );
          }
        }
      },
    ).catchError((onError) {
      print(onError);
    });
  }

  Future loadProducts() async {
    productsList.clear();
    allProductsList.clear();
    _isLoading = true;
    notifyListeners();
    await getProducts();
    _isLoading = false;
    notifyListeners();
  }

  Future searchTitle(String query) async {
    if (copyProductsList.isEmpty) copyProductsList = [...productsList];
    productsList = copyProductsList
        .where((element) => element.name.toLowerCase().contains(query))
        .toList();
    notifyListeners();
  }

  //- Upload
  Future updateProductsFromExcel(List<Product> products) async {
    _isLoading = true;
    notifyListeners();
    //- List variables
    List<Future> futures = [];
    List<Product> productsToCreate = [];
    List<Product> productsToUpdate = [];
    //- Validate creation
    for (int i = 1; i < products.length; i++) {
      final String validation = await validateProductExist(products[i]);
      if (validation == 'create') {
        productsToCreate.add(products[i]);
      } else if (validation != 'existing') {
        Product productUpdate = products[i];
        productUpdate.id = validation;
        productsToUpdate.add(productUpdate);
      }
    }
    //- Add futures
    if (productsToCreate.isNotEmpty) {
      futures.add(createProducts(productsToCreate));
    }
    if (productsToUpdate.isNotEmpty) {
      futures.add(updateProducts(productsToUpdate));
    }
    //- Execute futures
    await Future.wait(futures).then(
      (value) {
        showSnackBar(
          'Products Created: ${productsToCreate.length} - Products Updated: ${productsToUpdate.length}',
        );
      },
    );
    _isLoading = false;
    notifyListeners();
    loadProducts();
  }

  Future<String> validateProductExist(Product product) async {
    if (allProductsList.isEmpty) return 'create';
    //- Validate if product is already create
    final Product existingProduct = allProductsList.firstWhere(
      (element) => element.name == product.name,
      orElse: () => Product(qty: '0', name: '', price: ''),
    );
    if (existingProduct.id != null) {
      final update = existingProduct.validateIdentical(product);
      if (update) {
        return existingProduct.id!;
      } else {
        return 'existing';
      }
    }
    return 'create';
  }

  Future<String> createProducts(List<Product> products) async {
    final batch = db.batch();
    for (Product product in products) {
      var productRef = db.collection('products').doc();
      batch.set(productRef, product.toMap());
    }
    batch.commit();
    return '';
  }

  Future<String> updateProducts(List<Product> products) async {
    final batch = db.batch();
    for (Product product in products) {
      var productRef = db.collection('products').doc(product.id);
      batch.update(productRef, product.toMap());
    }
    batch.commit();
    return '';
  }

  static showSnackBar(String message) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.green,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
    //- Acá se muestra el snackbar
    _messengerKey.currentState!.showSnackBar(snackBar);
  }
}
