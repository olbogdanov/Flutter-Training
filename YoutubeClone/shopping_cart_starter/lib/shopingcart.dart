import 'package:flutter/material.dart';
import 'package:state_management_cart/api/product.dart';

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
