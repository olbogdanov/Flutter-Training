import 'package:flutter/material.dart';
import 'package:state_management_cart/api/product.dart';
import 'package:state_management_cart/product_grid.dart';

class ProductList extends StatelessWidget {
  static PageRoute<void> route() {
    return MaterialPageRoute(builder: (context) => ProductList());
  }

  @override
  Widget build(BuildContext context) {
    // TODO get products from ProductsModel
    final List<Product> products = [];

    // TODO get loading state from ProductsModel
    bool isLoading = false;
    assert(
      () {
        isLoading = true;
        return true;
      }(),
    );

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ProductGrid(
      products: products,
      onProductAdd: (product) {
        // TODO add product to cart
      },
      onProductRemove: (product) {
        // TODO remove product from cart
      },
    );
  }
}
