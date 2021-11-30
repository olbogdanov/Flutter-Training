import 'package:shopping_cart_api/shopping_cart_api.dart';

/// Returns fake products
class FakeShopApi implements ShopApi {
  @override
  Future<List<ProductDTO>> getAllProducts() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return [
      ProductDTO(
        name: "Dash student",
        price: 790,
        imageUrl: "https://pbs.twimg.com/media/EtRdo8jXMAADpcF?format=jpg&name=small",
      ),
      ProductDTO(
        name: "Dash hanging out",
        price: 790,
        imageUrl: "https://pbs.twimg.com/media/DthlEskW0AMfBsA?format=jpg&name=small",
      ),
      ProductDTO(
        name: "Dash on a bid house by Vandad",
        price: 1790,
        imageUrl: "https://pbs.twimg.com/media/FFM68hcWUAYrXWf?format=jpg&name=small",
      ),
      ProductDTO(
        name: "Dash @ Farida",
        price: 2090,
        imageUrl: "https://pbs.twimg.com/media/FElFMNWXEAIm8MA?format=jpg&name=small",
      ),
      ProductDTO(
        name: "Peek a boo",
        price: 790,
        imageUrl: "https://pbs.twimg.com/media/DxMLNKZXgAARPFa?format=jpg&name=small",
      ),
      ProductDTO(
        name: "Big Dash Daddy @ Flutter Europe",
        price: 1990,
        imageUrl: "https://pbs.twimg.com/media/FEwnUAOXsAcD1qg?format=jpg&name=large",
      ),
      ProductDTO(
        name: "Dash in a box",
        price: 1490,
        imageUrl: "https://pbs.twimg.com/media/D7USwk-WwAUyfS8?format=jpg&name=large",
      ),
      ProductDTO(
        name: "Dash socks",
        price: 1290,
        imageUrl: "https://pbs.twimg.com/media/ExAi95KUcAgEbHK?format=jpg&name=large",
      ),
      ProductDTO(
        name: "Dash with Google friends",
        price: 590,
        imageUrl: "https://pbs.twimg.com/media/DdLCgrwW4AEAa5c?format=jpg&name=small",
      ),
    ];
  }
}
