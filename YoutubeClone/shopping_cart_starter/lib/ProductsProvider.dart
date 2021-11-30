import 'package:flutter/material.dart';
import 'package:shopping_cart_api/shopping_cart_api.dart';
import 'package:state_management_cart/api/product.dart';
import 'package:state_notifier/state_notifier.dart';

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

class ProductsStateProvider extends StateNotifier<Result> {
  ProductsStateProvider(Result state) : super(state);

  Result get products => state;

  Future<void> loadData() async {
    final api = FakeShopApi();
    List<ProductDTO> productsDTO = await api.getAllProducts();

    state = ResultState(productsDTO.mapToProducts());
  }
}

class Result {}

class ResultState extends Result {
  List<Product> products = [];

  ResultState(this.products);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultState &&
          runtimeType == other.runtimeType &&
          products == other.products;

  @override
  int get hashCode => products.hashCode;
}

class ResultLoading extends Result {
  //empty
}
