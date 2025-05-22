import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/helper/responsive.dart';

class TheMarvel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tiêu đề Spider-Man
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform(
                      transform: Matrix4.identity()..scale(1.5, 1.2),
                      child: Text(
                        "THE MARVEL",
                        style: GoogleFonts.leagueGothic(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Action/Adventure",
                      style: GoogleFonts.leagueGothic(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                // Các biểu tượng bên phải
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // TODO: Handle download action
                      },
                      icon: Icon(
                        Icons.download,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: Handle cart action
                      },
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
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1h 45m",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          SizedBox(
            height: responsive.isMobile()
                ? responsive.width(30)
                : responsive.width(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.isMobile()
                  ? responsive.width(1)
                  : responsive.width(1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle_outline_outlined,
                    color: Colors.white,
                    size: responsive.isMobile()
                        ? responsive.width(40)
                        : responsive.width(20),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(
                left: responsive.width(2)), // Thêm khoảng cách bên phải
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Căn đều 2 bên
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform(
                      transform: Matrix4.identity()..scale(1.5, 1.2),
                      child: Text(
                        "FEATURED FOR YOU",
                        style: GoogleFonts.leagueGothic(
                          color: Colors.white,
                          fontSize: responsive.isMobile()
                              ? responsive.width(10)
                              : responsive.width(8),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: responsive.width(0.8)),
                    Container(
                      height: responsive.height(0.3),
                      width: responsive.width(10),
                      color: Colors.white, // Màu sắc đường gạch chân
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 5; i <= 8; i++)
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/marvelstudio/image$i.png",
                        height: responsive.isMobile()
                            ? responsive.width(90)
                            : responsive.width(50),
                        width: responsive.isMobile()
                            ? responsive.width(60)
                            : responsive.width(30),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
