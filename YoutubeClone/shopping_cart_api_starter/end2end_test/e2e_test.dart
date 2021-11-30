import 'package:shopping_cart_api/shopping_cart_api.dart';
import 'package:test/test.dart';

// Run via `dart test end2end_test/e2e_test.dart`
void main() {
  test('load products', () async {
    final api = ShopApi();
    final products = await api.getAllProducts();
    print(products);
    assert(products != null);
  });
}
