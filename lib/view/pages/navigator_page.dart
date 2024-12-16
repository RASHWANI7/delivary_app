import 'package:delivery_app/view/pages/cart_page.dart';
import 'package:delivery_app/view/pages/favourite_page.dart';
import 'package:delivery_app/view/pages/profile_page.dart';
import 'package:delivery_app/view/pages/search_page.dart';
import 'package:delivery_app/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:delivery_app/constants/constants.dart';
import 'package:delivery_app/view/widgets/drawer.dart';
import 'package:delivery_app/view/widgets/appbar.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int index = 2;

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  final List<Widget> screens = [
    const ProfilePage(),
    const FavouritePage(),
    const HomePage(),
    const SearchPage(),
    const CartPage(),
  ];

  final List<Widget> items = <Widget>[
    const Icon(Icons.person, size: 35,color: Colors.white),
    const Icon(Icons.favorite, size: 35,color: Colors.white),
    const Icon(Icons.home, size: 35,color: Colors.white),
    const Icon(Icons.search, size: 35,color: Colors.white),
    const Icon(Icons.shopping_cart, size: 35,color: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: navigationKey,
        items: items,
        index: index,
        animationDuration: const Duration(milliseconds: 300),
        color: Constants.primary_color,
        height: 70,
        backgroundColor: Colors.transparent,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
      drawer: const CustomDrawer(),
    );
  }
}

