import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_cart/ProductsProvider.dart';
import 'package:state_management_cart/cart_overview.dart';
import 'package:state_management_cart/product_list.dart';
import 'package:state_management_cart/shopingcart.dart';

void main() {
  runApp(ShoppingCartApp());
}

class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO inject CartModel
    // TODO inject ProductsModel
    return MaterialApp(
      title: "ShoppingCart App",
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ShoppingCardProvider()),
          ChangeNotifierProvider(create: (context) => ProductsProvider()),
        ],
        child: _HomePage(),
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  int _currentIndex = 0;

  @override
  void didChangeDependencies() {
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);
    productsProvider.loadData();
  } // final FakeShopApi()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dash Store"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            label: "Shop",
            icon: Icon(Icons.view_module),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Badge(
              position: BadgePosition.topEnd(),
              // TODO get shopping cart count
              badgeContent: Text('0'),
              badgeColor: const Color(0xFFFDC403),
              child: const Icon(Icons.shopping_basket),
            ),
          ),
        ],
      ),
      body: () {
        if (_currentIndex == 0) {
          return ProductList();
        }
        if (_currentIndex == 1) {
          return const CartOverview();
        }
        return Container();
      }(),
    );
  }
}
