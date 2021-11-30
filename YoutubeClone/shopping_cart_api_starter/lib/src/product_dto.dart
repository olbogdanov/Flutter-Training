// import 'dart:convert' as json

/// DTO == Data transfer object, this terminology is often used in Java
class ProductDTO {
  final String name;
  final double price;
  final String imageUrl;

  ProductDTO({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return ProductDTO(
      name: json['name'] as String,
      price: json['price'] as double,
      imageUrl: json['imageUrl'] as String,
    );
  }
}

class ProducsDTO {
  final List<ProductDTO> products;

  ProducsDTO({
    required this.products,
  });

  factory ProducsDTO.fromJson(Map<String, dynamic> json) {
    return ProducsDTO(
        products: (json['products'] as List<dynamic>)
            .map((element) =>
                ProductDTO.fromJson(element as Map<String, dynamic>))
            .toList());
  }
}
