import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_cart/ProductsProvider.dart';
import 'package:state_management_cart/api/product.dart';
import 'package:state_management_cart/product_grid.dart';
import 'package:state_management_cart/shopingcart.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ShoppingCardProvider shoppingCardProvider =
        Provider.of<ShoppingCardProvider>(context);
    Result productsStateProvider = context.watch<Result>();

    if (productsStateProvider is ResultState) {
      List<Product> products = (productsStateProvider as ResultState).products;

      return ProductGrid(
        products: products,
        onProductAdd: (product) {
          shoppingCardProvider.addProductListItem(product);
        },
        onProductRemove: (product) {
          shoppingCardProvider.removeProductListItem(product.name);
        },
      );
    } else if (productsStateProvider is ResultLoading) {
      // productsStateProvider.loadData();
      return const Center(child: CircularProgressIndicator());
    }
    return Text("404");
  }
}
