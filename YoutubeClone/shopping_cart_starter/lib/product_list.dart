import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_cart/ProductsProvider.dart';
import 'package:state_management_cart/product_grid.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);
    // bool isLoading = false;
    // assert(
    //   () {
    //     isLoading = true;
    //     return true;
    //   }(),
    // );

    if (productsProvider.products.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return ProductGrid(
      products: productsProvider.products,
      onProductAdd: (product) {
        // TODO add product to cart
      },
      onProductRemove: (product) {
        // TODO remove product from cart
      },
    );
  }
}
