import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  Product({
    this.id,
    required this.qty,
    required this.name,
    required this.price,
  });

  String? id;
  String name;
  String price;
  String qty;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        qty: json["qty"],
        name: json["name"],
        price: json["price"],
      );

  factory Product.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Product(
      id: snapshot.id,
      name: data?['name'],
      price: data?['price'],
      qty: data?['qty'],
    );
  }

  Map<String, dynamic> toMap() => {
        "qty": qty,
        "name": name,
        "price": price,
      };

  bool validateIdentical(Product compare) {
    if (qty == compare.qty && name == compare.name && price == compare.price) {
      return false;
    }
    return true;
  }
}
