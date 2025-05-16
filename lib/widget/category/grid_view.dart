import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/helper/color.dart';
import 'package:movie2/helper/responsive.dart';
import 'package:movie2/screen/character_screen.dart';
import 'package:movie2/screen/comic_screen.dart';
import 'package:movie2/screen/game_screen.dart';
import 'package:movie2/screen/movie_screen.dart';
import 'package:movie2/screen/tv_show_screen.dart';

class Grid extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      "title": "MOVIES",
      "text": "Watch all marvel movies in one place.",
      "image": "assets/images/category/clapperboard1.png",
      "route": MovieScreen.routeName,
    },
    {
      "title": "TV-SHOWS",
      "text": "Watch all marvel TV-Series in one place.",
      "image": "assets/images/category/clapperboard2.png",
      "route": TVShowScreen.routeName,
    },
    {
      "title": "COMICS",
      "text": "Read all marvel comics in one place.",
      "image": "assets/images/category/clapperboard3.png",
      "route": ComicScreen.routeName,
    },
    {
      "title": "GAMES",
      "text": "Play all marvel games in one place.",
      "image": "assets/images/category/clapperboard4.png",
      "route": GameScreen.routeName,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(responsive),
          SizedBox(height: responsive.isMobile() ? responsive.width(10) : responsive.width(5)),
          _buildCharacterBox(context, responsive),
          SizedBox(height: 10),
          _buildGrid(responsive, context),
        ],
      ),
    );
  }

  Widget _buildHeader(ResponsiveUtil responsive) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform(
            transform: Matrix4.identity()..scale(1.5, 1.2),
            child: Text(
              "CATEGORY",
              style: GoogleFonts.leagueGothic(
                color: Colors.white,
                fontSize: responsive.isMobile() ? responsive.width(12) : responsive.width(1),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 4),
          Container(
            height: responsive.isMobile() ? responsive.width(1) : responsive.width(2),
            width: responsive.isMobile() ? responsive.width(15) : responsive.width(18),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterBox(BuildContext context, ResponsiveUtil responsive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.isMobile() ? responsive.width(3) : responsive.width(2)),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, CharacterScreen.routeName),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.isMobile() ? responsive.width(6) : responsive.width(4),
            vertical: responsive.isMobile() ? responsive.width(4) : responsive.width(2),
          ),
          decoration: GradientStyles.colorContainerGradient(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CHARACTERS",
                      style: GoogleFonts.leagueGothic(
                        color: Colors.white,
                        fontSize: responsive.isMobile() ? responsive.width(10) : responsive.width(7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Find out the connection and mistry\nabout the individual.",
                      style: GoogleFonts.leagueGothic(
                        color: Color(0xC7FFFFFF),
                        fontSize: responsive.isMobile() ? responsive.width(8) : responsive.width(5),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/category/image1.png',
                  height: responsive.isMobile() ? responsive.width(40) : responsive.width(1),
                  width: responsive.isMobile() ? responsive.width(40) : responsive.width(1),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(ResponsiveUtil responsive, BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(responsive.isMobile() ? responsive.width(1) : responsive.width(1)),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: responsive.isMobile() ? 7 / 9 : 6 / 9,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: () => Navigator.pushNamed(context, item['route']),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: responsive.width(3), horizontal: responsive.width(5)),
            margin: EdgeInsets.all(responsive.width(2)),
            decoration: GradientStyles.colorContainerGradient(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  item['image'],
                  width: responsive.width(20),
                  height: responsive.width(20),
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(
                  item['title'],
                  style: GoogleFonts.leagueGothic(
                    color: Colors.white,
                    fontSize: responsive.isMobile() ? responsive.width(10) : responsive.width(1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item['text'],
                  style: GoogleFonts.leagueGothic(
                    color: Colors.white70,
                    fontSize: responsive.isMobile() ? responsive.width(8) : responsive.width(1),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
