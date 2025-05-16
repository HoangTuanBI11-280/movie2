import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/custom_header.dart';
import 'package:movie2/helper/color.dart';
import 'package:movie2/helper/responsive.dart';

class MarvelVoiceScreen extends StatelessWidget {
  static const String routeName = '/marvelvoicescreen';

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/backgroundavenger.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
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
                SizedBox(
                  height: responsive.isMobile()
                      ? responsive.width(0)
                      : responsive.width(1),
                ),
                MarvelVoiceWidget(), // Thêm TrendingWidget vào MovieScreen
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomNavBar(),
    );
  }
}

class MarvelVoiceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.width(2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform(
                  transform: Matrix4.identity()..scale(1.5, 1.2),
                  child: Container(
                    width: responsive.isMobile()
                        ? responsive.width(200)
                        : responsive.width(400),
                    child: Text(
                      '''Avengers United Infinity Comic (2023) #9''',
                      style: GoogleFonts.leagueGothic(
                        color: Colors.white,
                        fontSize: responsive.isMobile()
                            ? responsive.width(12)
                            : responsive.width(6),
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(
                  height: responsive.isMobile()
                      ? responsive.width(6)
                      : responsive.width(2),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 2.0,
                  child: Text(
                    '''It's time for round two as the Avengers' ragtag forces regroup and engage the Fear Teacher for what will be the final time!''',
                    style: GoogleFonts.leagueGothic(
                      color: Colors.white,
                      fontSize: responsive.isMobile()
                          ? responsive.width(9)
                          : responsive.width(5),
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '''Writer: \nDerek Landy''',
                      style: GoogleFonts.leagueGothic(
                        color: Colors.white,
                        fontSize: responsive.isMobile()
                            ? responsive.width(8)
                            : responsive.width(6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(
                        '''Penciler: \nPhillip Sevy''',
                        style: GoogleFonts.leagueGothic(
                          color: Colors.white,
                          fontSize: responsive.isMobile()
                              ? responsive.width(8)
                              : responsive.width(6),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '''Published: \nDecember 07, 2023''',
                  style: GoogleFonts.leagueGothic(
                    color: Colors.white,
                    fontSize: responsive.isMobile()
                        ? responsive.width(8)
                        : responsive.width(6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 3),
                Container(
                  height: responsive.height(0.3),
                  width: responsive.width(10),
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    decoration: GradientStyles.colorButtomGradient(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Read Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: responsive.isMobile()
                                ? responsive.width(8)
                                : responsive.width(4),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.file_download_outlined,
                      color: Colors.white,
                      size: responsive.isMobile()
                          ? responsive.width(10)
                          : responsive.width(6),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart_checkout_outlined,
                      color: Colors.white,
                      size: responsive.isMobile()
                          ? responsive.width(10)
                          : responsive.width(6),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 100),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform(
                  transform: Matrix4.identity()..scale(1.5, 1.2),
                  child: Text(
                    "FEATURED FOR YOU",
                    style: GoogleFonts.leagueGothic(
                      color: Colors.white,
                      fontSize: responsive.isMobile()
                          ? responsive.width(12)
                          : responsive.width(6),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: responsive.height(0.3),
                  width: responsive.height(20),
                  color: Colors.white, // Màu sắc đường gạch chân
                ),
                SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 1; i <= 4; i++)
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/category/au$i.png',
                              height: responsive.isMobile()
                                  ? responsive.width(80)
                                  : responsive.width(50),
                              width: responsive.isMobile()
                                  ? responsive.width(50)
                                  : responsive.width(30),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
