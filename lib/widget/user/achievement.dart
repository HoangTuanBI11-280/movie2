import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/helper/color.dart';

class Achievement extends StatelessWidget {
  final int imageCount = 9;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      Color(0xFFb57e10),
                      Color(0xFFf9df70),
                      Color(0xFFf9df70),
                      Color(0xFFb57e10),
                      Color(0xFFb57e10),
                    ],
                  ).createShader(bounds),
                  child: Text(
                    "ACHIEVEMENTS",
                    style: GoogleFonts.leagueGothic(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.002,
                  width: MediaQuery.of(context).size.width * 0.06,
                  decoration: GradientStyles.colorTextGradient(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 1; i < imageCount; i++)
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Avatar hình tròn
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.06,
                          backgroundImage: AssetImage(
                            "assets/images/user/image$i.png",
                          ),
                        ),
                        // Biểu tượng khóa (hiển thị với điều kiện)
                        if (i > 3)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.lock,
                              color: Colors.grey,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              imageCount,
              (index) => Container(
                height: MediaQuery.of(context).size.width * 0.01,
                width: MediaQuery.of(context).size.width * 0.01,
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.005),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: GradientStyles.colorTextGradient(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MOVIES WATCHED',
                    style: GoogleFonts.leagueGothic(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        clipBehavior: Clip
                            .none, // Cho phép các phần tử vượt ra ngoài Stack
                        children: [
                          Positioned(
                            top: MediaQuery.of(context).size.width * -0.04,
                            left: MediaQuery.of(context).size.width * 0.55,
                            child: Container(
                              child: Center(
                                child: Text(
                                  '63%',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context).size.width * 0.03
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Thanh tiến trình
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.width * 0.01,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: FractionallySizedBox(
                                widthFactor: 0.63,
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: MediaQuery.of(context).size.width * 0.01,
                            top: MediaQuery.of(context).size.width * -0.1,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.12,
                              height: MediaQuery.of(context).size.width * 0.12,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/user/film.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: GradientStyles.colorTextGradient(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TV-SHOWS WATCHED',
                    style: GoogleFonts.leagueGothic(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        clipBehavior: Clip
                            .none, // Cho phép các phần tử vượt ra ngoài Stack
                        children: [
                          Positioned(
                            top: MediaQuery.of(context).size.width * -0.02,
                            left: MediaQuery.of(context).size.width * 0.58,
                            child: Container(
                              child: Center(
                                child: Text(
                                  '27%',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Thanh tiến trình
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.width * 0.01,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: FractionallySizedBox(
                                widthFactor: 0.27,
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: -35,
                            top: -60,
                            child: Container(
                              width: 140,
                              height: 77,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage("assets/images/user/tv.png"),
                                fit: BoxFit.fill,
                              )),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 3,
                  child: Container(
                    decoration: GradientStyles.colorLineGradient(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      Color(0xFFb57e10),
                      Color(0xFFf9df70),
                      Color(0xFFf9df70),
                      Color(0xFFb57e10),
                      Color(0xFFb57e10),
                    ],
                  ).createShader(bounds),
                  child: Text(
                    'CONNECTED ACCOUNTS',
                    style: GoogleFonts.leagueGothic(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 3,
                  child: Container(
                    decoration: GradientStyles.colorLine1Gradient(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Căn giữa các avatar trong Row
            children: [
              for (int i = 9; i <= 11; i++)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage("assets/images/user/image$i.png"),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: InkWell(
              onTap: () {},
              borderRadius:
                  BorderRadius.circular(10), // Hiệu ứng bo tròn khi nhấn
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: GradientStyles.colorTextGradient(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Logout",
                      style: GoogleFonts.leagueGothic(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}