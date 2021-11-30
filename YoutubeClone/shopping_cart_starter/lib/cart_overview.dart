import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_management_cart/api/product.dart';
import 'package:state_management_cart/shopingcart.dart';

class CartOverview extends StatelessWidget {
  const CartOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO get from ProductsModel somewhere
    ShoppingCardProvider shoppingCardProvider =
        Provider.of<ShoppingCardProvider>(context);
    final List<Product> products = shoppingCardProvider.product;

    if (products.isEmpty) {
      return const Center(
        child: Text('No products in cart'),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  shoppingCardProvider.removeProductListItem(product.name);
                },
                child: const Text("Remove"),
              ),
              Text("${product.price / 100}"),
            ],
          ),
        );
      },
    );
  }
}
