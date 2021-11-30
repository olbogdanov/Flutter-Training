import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_cart_api/src/product_dto.dart';

class ShopApi {
  /// Returns the list of all products
  Future<List<ProductDTO>> getAllProducts() async {
    // raw json
    final response = await http.get(Uri.parse(
        'https://gist.githubusercontent.com/passsy/d3953caca39f4d1c548e3d232cee1f71/raw/e0333dcf23c1e95a72cc587615c4a9008af4215e/dash_shop_api.json'));

    if (response.statusCode == 200) {
      //solution 1
      Map<String, dynamic> parsed =
          jsonDecode(response.body) as Map<String, dynamic>;
      return ProducsDTO.fromJson(parsed).products;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
