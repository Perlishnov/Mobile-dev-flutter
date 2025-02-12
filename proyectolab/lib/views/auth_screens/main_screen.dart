import 'package:flutter/material.dart';

import '../nav_screens/account_screen.dart';
import '../nav_screens/cart_screen.dart';
import '../nav_screens/favorite_screen.dart';
import '../nav_screens/home_screen.dart';
import '../nav_screens/store_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;

  List<Widget> pages = [
    HomeScreen(),
    FavoriteScreen(),
    StoreScreen(),
    CartScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "FAVORITES",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_outlined),
            label: "STORE",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "CART",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "ACCOUNT",
          ),
        ],
      ),
      body: pages[currentPage],
    );
  }
}
