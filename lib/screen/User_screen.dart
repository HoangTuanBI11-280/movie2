import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/custom_header.dart';
import 'package:movie2/helper/color.dart';
import 'package:movie2/helper/responsive.dart';
import 'package:movie2/widget/user/achievement.dart';

class UserScreen extends StatelessWidget {
  static const String routeName = '/userscreen';
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Scaffold(
      body: Container(
        decoration: GradientStyles.colorProfileGradient(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false, // Tắt nút quay lại mặc định
              expandedHeight: responsive.isMobile()
                  ? responsive.width(100)
                  : responsive.width(70),
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/user/appbar.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Column(
                        children: [
                          CustomHeader(
                            onMenuTap: () {},
                            onSearch: (keyword) {},
                            title: 'PROFILE',
                          ),
                          Spacer(),
                          Transform.translate(
                            offset: Offset(
                              responsive.isMobile()
                                  ? responsive.width(-10)
                                  : responsive.width(-64),
                              responsive.isMobile()
                                  ? responsive.width(-10)
                                  : responsive.width(-5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: responsive.width(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: responsive.isMobile()
                                        ? responsive.width(15)
                                        : responsive.width(10),
                                    backgroundImage: AssetImage(
                                        'assets/images/user/avaspider.png'),
                                  ),
                                  SizedBox(width: 25),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Peter Parker',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: responsive.isMobile()
                                              ? responsive.width(9)
                                              : responsive.width(6),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        user.email!,
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: responsive.isMobile()
                                              ? responsive.width(5)
                                              : responsive.width(4),
                                        ),
                                        overflow: TextOverflow
                                            .ellipsis, // Cắt bớt văn bản thừa nếu vượt quá chiều rộng
                                        softWrap: false, // Ngắt dòng nếu cần
                                      ),
                                      SizedBox(
                                        height: responsive.isMobile()
                                            ? responsive.width(7)
                                            : responsive.width(8),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF7E7E7E),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: responsive.isMobile()
                                                ? responsive.width(7)
                                                : responsive.width(4),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Edit",
                                              style: GoogleFonts.leagueGothic(
                                                color: Colors.white,
                                                fontSize: responsive.isMobile()
                                                    ? responsive.width(10)
                                                    : responsive.width(6),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: responsive.isMobile()
                                                  ? responsive.width(7)
                                                  : responsive.width(4),
                                            ),
                                            Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                              size: responsive.isMobile()
                                                  ? responsive.width(8)
                                                  : responsive.width(5),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: responsive.isMobile()
                        ? responsive.width(15)
                        : responsive.width(2),
                  ),
                  Achievement(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}