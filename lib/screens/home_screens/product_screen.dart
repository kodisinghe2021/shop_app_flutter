import 'package:flutter/material.dart';
import 'package:sales_app/providers/shops_provier.dart';
import 'package:sales_app/screens/home_screens/cart_items.dart';
import 'package:sales_app/screens/home_screens/profile.dart';
import 'package:sales_app/widgets/shop_list.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);
// page key
  static const String pageKey = '/product-page';

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // pages list
    List<Widget> pages = [
      HomePage(),
      const CartItems(),
      const Profile(),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        //IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text(
          'Our Shops',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
          const SizedBox(width: 20),
        ],
      ),
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  // Book Provider
  final ShopProvider shopProvider = ShopProvider();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: shopProvider.getBookList.length,
          itemBuilder: (context, index) {
            return ShopList(screenSize: screenSize, index: index);
          },
        ),
      ],
    );
  }
}
