import 'package:state_management_cart/ProductsProvider.dart';
import 'package:state_management_cart/api/product.dart';
import 'package:state_management_cart/shopingcart.dart';
import 'package:test/test.dart';

void main() {
  group('cart', () {
    test("Add a product", () {
      final provider = ShoppingCardProvider();
      var product = Product(name: "name", price: 22, imageUrl: "url");
      provider.addProductListItem(product);
      assert(provider.product.contains(product));
      expect(provider.product.length, 1);
      // assert()
    });

    test("Remove a product", () {
      final provider = ShoppingCardProvider();
      var product = Product(name: "name", price: 22, imageUrl: "url");
      provider.addProductListItem(product);
      provider.removeProductListItem(product.name);
      expect(provider.product.length, 0);
    });
  });

  group('products', () {
    test('load products', () async {
      final provider = ProductsProvider();
      await provider.loadData();
      assert(provider.products.isNotEmpty);
    });
  });
}
