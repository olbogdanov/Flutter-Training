import 'package:flutter/material.dart';
import 'package:shopping_cart_api/shopping_cart_api.dart';
import 'package:state_management_cart/api/product.dart';

import 'api/fake_shop_api.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _productList = [];

  List<Product> get products => _productList;

  Future<void> loadData() async {
    final api = FakeShopApi();
    List<ProductDTO> productsDTO = await api.getAllProducts();
    _productList = productsDTO.mapToProducts();
    notifyListeners();
  }
}
