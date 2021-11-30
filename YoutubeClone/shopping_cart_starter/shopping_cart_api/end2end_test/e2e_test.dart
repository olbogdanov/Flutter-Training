import 'package:shopping_cart_api/shopping_cart_api.dart';
import 'package:test/test.dart';

// Run via `dart test end2end_test/e2e_test.dart`
void main() {
  test('load products', () async {
    final api = ShopApi();
    final response = await api.getAllProducts();
    for (final products in response) {
      expect(products.name, isNotEmpty);
      expect(products.price, isPositive);
      expect(products.imageUrl, isNotEmpty);
    }
  });
}
