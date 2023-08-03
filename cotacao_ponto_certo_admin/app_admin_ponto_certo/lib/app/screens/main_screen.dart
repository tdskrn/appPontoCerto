import 'package:app_admin_ponto_certo/app/screens/list_products_view.dart';
import 'package:app_admin_ponto_certo/app/screens/quotations_view.dart';
import 'package:app_admin_ponto_certo/app/screens/vendors_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  List<Widget> _pages = [
    ListProducts(),
    Quotations(),
    VendorsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "PRODUTOS",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "COTAÇÕES",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "VENDEDORES",
          ),
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
