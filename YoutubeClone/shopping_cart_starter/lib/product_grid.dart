import 'package:flutter/material.dart';
import 'package:state_management_cart/api/product.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
    required this.products,
    this.onProductAdd,
    this.onProductRemove,
  }) : super(key: key);

  final void Function(Product)? onProductAdd;
  final void Function(Product)? onProductRemove;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width ~/ 200,
      children: products.map((product) {
        final Widget image = Padding(
          padding: const EdgeInsets.only(bottom: 48),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black54,
                  ),
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "${(product.price / 100).toStringAsFixed(2)} €",
                    style: const TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

        return Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: [
                image,
                Positioned(
                  bottom: 0,
                  left: 8,
                  right: 8,
                  child: SizedBox(
                    height: 42,
                    child: Text(product.name),
                  ),
                ),
                Positioned(
                  bottom: 48,
                  left: 8,
                  child: _Button(
                    onTap: () => onProductAdd?.call(product),
                    icon: const Icon(Icons.add),
                  ),
                ),
                Positioned(
                  bottom: 48,
                  left: 48 + 8,
                  child: _Button(
                    onTap: () => onProductRemove?.call(product),
                    icon: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  final void Function()? onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconTheme.merge(
          data: const IconThemeData(size: 48, color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                top: 2,
                left: 2,
                child: IconTheme.merge(data: const IconThemeData(color: Colors.black), child: icon),
              ),
              icon,
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(100),
              highlightColor: Colors.blue.withAlpha(30),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
