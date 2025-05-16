import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/custom_header.dart';

class WhatIfScreen extends StatelessWidget {
  static const String routeName = '/whatifscreen';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/marvelstudio/what1.png'),
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
                    height: 27,
                    width: 121,
                  ),
                ),
                SizedBox(height: 15),
                WhatIf(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomNavBar(),
    );
  }
}

class WhatIf extends StatelessWidget {
  final List<Map<String, String>> episodes = [
  {"title": "E09 · What If... The Watcher Broke His Oath?", "date": "Oct 6, 2021"},
  {"title": "E08 · What If... Ultron Won?", "date": "Sep 29, 2021"},
  {"title": "E07 · What If... Thor Were an Only Child?", "date": "Sep 22, 2021"},
  {"title": "E06 · What If... Killmonger Rescued Tony Stark?", "date": "Sep 15, 2021"},
  {"title": "E05 · What If... Zombies?!", "date": "Sep 8, 2021"},
  {"title": "E04 · What If... Doctor Strange Lost His Heart Instead of His Hands?", "date": "Sep 1, 2021"},
  {"title": "E03 · What If... the World Lost Its Mightiest Heroes?", "date": "Aug 25, 2021"},
  {"title": "E02 · What If... T'Challa Became a Star-Lord?", "date": "Aug 18, 2021"},
  {"title": "E01 · What If... Captain Carter Were the First Avenger?", "date": "Aug 11, 2021"},
];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform(
                      transform: Matrix4.identity()..scale(1.5, 1.2),
                      child: Text(
                        'WHAT IF...?',
                        style: GoogleFonts.leagueGothic(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      ' 2021•Action',
                      style: GoogleFonts.leagueGothic(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.download,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1 season',
                    style: GoogleFonts.leagueGothic(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
                SizedBox(height: 9),
                Container(
                  height: 2,
                  width: 50,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.play_circle_outline_sharp,
                  size: 63,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(height: 100),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '1 season',
                      style: GoogleFonts.leagueGothic(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '|',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '2 season',
                      style: GoogleFonts.leagueGothic(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 2,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Episodes",
                  style: GoogleFonts.leagueGothic(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                ...episodes.map((episode) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          episode['title']!,
                          style: GoogleFonts.leagueGothic(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          episode['date']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}