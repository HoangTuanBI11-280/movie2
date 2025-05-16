import 'package:flutter/material.dart';
import 'package:movie2/firebase/auth_page.dart';
import 'package:movie2/helper/responsive.dart';
import 'package:movie2/screen/Catergory_screen.dart';
import 'package:movie2/screen/Home_screen.dart';
import 'package:movie2/screen/cart_screen.dart';

class CustomNavBar extends StatefulWidget {
  static const String routeName = '/customnavbar';
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0; // Index biểu tượng được chọn

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    AuthPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: responsive.isMobile()
                    ? responsive.width(15)
                    : responsive.width(10),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.grid_view_rounded,
                size: responsive.isMobile()
                    ? responsive.width(15)
                    : responsive.width(10),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: responsive.isMobile()
                    ? responsive.width(15)
                    : responsive.width(10),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: responsive.isMobile()
                    ? responsive.width(15)
                    : responsive.width(10),
              ),
              label: 'Home'),
        ],
      ),
    );
  }
}
