import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_cart/ProductsProvider.dart';
import 'package:state_management_cart/product_grid.dart';
import 'package:state_management_cart/shopingcart.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);
    ShoppingCardProvider shoppingCardProvider = Provider.of<ShoppingCardProvider>(context);

    if (productsProvider.products.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return ProductGrid(
      products: productsProvider.products,
      onProductAdd: (product) {
        shoppingCardProvider.addProductListItem(product);
      },
      onProductRemove: (product) {
        shoppingCardProvider.removeProductListItem(product.name);
      },
    );
  }
}
