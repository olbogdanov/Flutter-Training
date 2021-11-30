import 'package:shopping_cart_api/shopping_cart_api.dart';

/// This product is a (data class, record) with a correctly implemented equals and copyWith method
///
/// It is used as domain object/entity
class Product {
  final String name;

  /// price in cents (Euro)
  final int price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  Product copyWith({
    String? name,
    int? price,
    String? productImage,
  }) {
    return Product(
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: productImage ?? imageUrl,
    );
  }

  @override
  String toString() {
    return 'Product{name: $name, price: $price, productImage: $imageUrl}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          price == other.price &&
          imageUrl == other.imageUrl);

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ imageUrl.hashCode;
}

extension ProductListMapper on List<ProductDTO> {
  List<Product> mapToProducts() => map((it) => it.toProduct()).toList();
}

extension ProductMapper on ProductDTO {
  Product toProduct() {
    final dto = this;
    return Product(
      name: dto.name,
      price: (dto.price * 100).toInt(),
      imageUrl: dto.imageUrl,
    );
  }
}
