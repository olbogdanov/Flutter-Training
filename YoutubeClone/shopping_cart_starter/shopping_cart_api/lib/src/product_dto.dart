/// This product is a 1:1 mapping of the response from the endpoint
///
/// DTO == Data transfer object, this terminology is often used in Java
class ProductDTO {
  final String name;

  /// Price in Euro
  final double price;
  final String imageUrl;

  ProductDTO({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'ProductDTO{name: $name, price: $price, productImage: $imageUrl}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductDTO &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          price == other.price &&
          imageUrl == other.imageUrl);

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ imageUrl.hashCode;
}
