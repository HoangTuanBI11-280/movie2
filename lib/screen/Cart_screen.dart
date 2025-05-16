import 'package:flutter/material.dart';
import 'package:movie2/custom_header.dart';
import 'package:movie2/widget/cart/item_cart.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cartscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/backgroundcate.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                CustomHeader(
                  onMenuTap: () {},
                  onSearch: (keyword) {},
                  title: 'CART',
                ),
                SizedBox(height: 10),
                ItemCart(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomNavBar(),
    );
  }
}
