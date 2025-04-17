import 'package:admin_app/views/sidebar_screens/buyer_screen.dart';
import 'package:admin_app/views/sidebar_screens/categories_screen.dart';
import 'package:admin_app/views/sidebar_screens/dashboard_screen.dart';
import 'package:admin_app/views/sidebar_screens/orders_screen.dart';
import 'package:admin_app/views/sidebar_screens/products_screen.dart';
import 'package:admin_app/views/sidebar_screens/upload_banner_screen.dart';
import 'package:admin_app/views/sidebar_screens/vendors_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
class main_screen extends StatefulWidget {
  const main_screen({super.key});

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  Widget _selectedScreen = CategoriesScreen();
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      sideBar: SideBar(
        items: const [
        AdminMenuItem(
          title: 'Dashboard',
          route: dashboard_screen.id,
          icon: Icons.dashboard,
        ),
          AdminMenuItem(
            title: 'Categories',
            route: CategoriesScreen.id,
            icon: Icons.category,
          ),
          AdminMenuItem(
            title: 'Products',
            route: products_screen.id,
            icon: Icons.production_quantity_limits,
          ),
          AdminMenuItem(
            title: 'Orders',
            route: orders_screen.id,
            icon: Icons.request_page,
          ),
          AdminMenuItem(
            title: 'Vendors',
            route: vendors_screen.id,
            icon: Icons.sell,
          ),
          AdminMenuItem(
            title: 'Upload Banner Screen',
            route: UploadBannerScreen.id,
            icon: Icons.upload_file,
          ),
        ],
        selectedRoute: vendors_screen.id,
        onSelected: (item) {
          if (item.route ==vendors_screen.id) {
            setState(() {
              _selectedScreen = vendors_screen();
            });
          }
          if (item.route ==buyer_screen.id) {
            setState(() {
              _selectedScreen = buyer_screen();
            });
          }
          if (item.route ==CategoriesScreen.id) {
            setState(() {
              _selectedScreen = CategoriesScreen();
            });
          }
          if (item.route ==dashboard_screen.id) {
            setState(() {
              _selectedScreen = dashboard_screen();
            });
          }
          if (item.route ==orders_screen.id) {
            setState(() {
              _selectedScreen = orders_screen();
            });
          }
          if (item.route ==products_screen.id) {
            setState(() {
              _selectedScreen = products_screen();
            });
          }
          if (item.route ==UploadBannerScreen.id) {
            setState(() {
              _selectedScreen = UploadBannerScreen();
            });
          }
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'header',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _selectedScreen,
    );
  }
}
