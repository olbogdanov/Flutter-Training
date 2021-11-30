import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_management_cart/api/product.dart';

class CartOverview extends StatelessWidget {
  const CartOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO get from ProductsModel somewhere
    final List<Product> products = [];

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
                  // TODO remove item from cart
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
