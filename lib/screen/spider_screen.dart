import 'package:flutter/material.dart';
import 'package:movie2/custom_header.dart';
import 'package:movie2/helper/responsive.dart';
import 'package:movie2/widget/other/marvel_screen.dart';
import 'package:movie2/widget/other/spider_man.dart';

class SpiderScreen extends StatelessWidget {
  static const String routeName = '/spiderscreen';

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/backgroundspider.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
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
                    isBackIcon: true,
                    onMenuTap: () {
                      Navigator.pop(context);
                    },
                  onSearch: (keyword) {},
                  title: Image.asset(
                    'assets/images/background/title1.png',
                    height: responsive.isMobile()
                        ? responsive.width(30)
                        : responsive.width(20),
                    width: responsive.isMobile()
                        ? responsive.width(50)
                        : responsive.width(40),
                  ),
                ),
                SpiderMan(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TheMarvelScreen extends StatelessWidget {
  static const String routeName = '/themarvelscreen';

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/backgroundmarvel.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
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
                    isBackIcon: true,
                    onMenuTap: () {
                      Navigator.pop(context);
                    },
                  title: Image.asset(
                    'assets/images/background/title1.png',
                    height: responsive.isMobile()
                        ? responsive.width(30)
                        : responsive.width(20),
                    width: responsive.isMobile()
                        ? responsive.width(50)
                        : responsive.width(40),
                  ),
                ),
                TheMarvel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
