import 'package:blue_house/pages/fav.dart';
import 'package:blue_house/pages/home_page.dart';
import 'package:blue_house/pages/profile.dart';
import 'package:blue_house/pages/scan.dart';
import 'package:blue_house/pages/store.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    FabPage(),
    ScanPage(),
    StorePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          currentIndex: _currentIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          selectedIconTheme: IconThemeData(size: 35.0),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "fav"),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner_outlined), label: "qr"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), label: "Shoppingh"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
          ]),
      body: pages[_currentIndex],
    );
  }
}
