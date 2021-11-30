import 'package:deep_pick/deep_pick.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart_api/src/product_dto.dart';

class ShopApi {
  /// Returns the list of all products
  Future<List<ProductDTO>> getAllProducts() async {
    // https://gist.github.com/passsy/d3953caca39f4d1c548e3d232cee1f71
    final url = Uri.parse(
      'https://gist.githubusercontent.com/passsy/d3953caca39f4d1c548e3d232cee1f71/raw/e0333dcf23c1e95a72cc587615c4a9008af4215e/dash_shop_api.json',
    );
    final response = await http.get(url);
    return pickFromJson(response.body, 'products').asListOrThrow((pick) {
      return ProductDTO(
        name: pick('name').asStringOrThrow(),
        price: pick('price').asDoubleOrThrow(),
        imageUrl: pick('imageUrl').asStringOrThrow(),
      );
    });
  }
}
