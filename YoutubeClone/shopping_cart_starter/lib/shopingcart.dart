import 'package:flutter/material.dart';

class ShopingCart with ChangeNotifier {
  List<Product> _productList = [];

  List<Product> get product => _productList;

  void addProductListItem(Product product) {
    _productList.add(product);
    notifyListeners();
  }

  void removeProductListItem(String name) {
    _productList.removeWhere((element) => element.name == name);
  }
}

class Product {
  Product({required this.name, required this.price, required this.imgUrl});

  final String name;
  final double price;
  final String imgUrl;
}
