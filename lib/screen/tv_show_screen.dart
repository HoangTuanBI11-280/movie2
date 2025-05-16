import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/custom_header.dart';
import 'package:movie2/helper/color.dart';
import 'package:movie2/helper/responsive.dart';
import 'package:movie2/screen/loki_screen.dart';
import 'package:movie2/screen/what_if_screen.dart';

class TVShowScreen extends StatelessWidget {
  static const String routeName = '/tvshowscreen';

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/tvbackground.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
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
                  title: "TV-SHOWS",
                ),
                SizedBox(height: responsive.height(2)),
                TVShowWidget(), // Thêm TrendingWidget vào MovieScreen
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomNavBar(),
    );
  }
}

class TVShowWidget extends StatefulWidget {
  @override
  State<TVShowWidget> createState() => _TVShowWidgetState();
}

class _TVShowWidgetState extends State<TVShowWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 6,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: responsive.width(2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform(
                transform: Matrix4.identity()..scale(1.5, 1.2),
                child: Text(
                  "TRENDING",
                  style: GoogleFonts.leagueGothic(
                    color: Colors.white,
                    fontSize: responsive.isMobile()
                        ? responsive.width(10)
                        : responsive.width(6),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Container(
                height: responsive.height(0.3),
                width: responsive.width(10),
                color: Colors.white,
              ),
            ],
          ),
        ),
        TabBar(
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          labelColor: Color(0xFFF6F5F5),
          unselectedLabelColor: Colors.white.withOpacity(0.5),
          isScrollable: true,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(),
          labelStyle: TextStyle(
              fontSize: responsive.isMobile()
                  ? responsive.width(7)
                  : responsive.width(4),
              fontWeight: FontWeight.w900),
          labelPadding: EdgeInsets.symmetric(horizontal: responsive.width(2.5)),
          tabs: List.generate(
            6,
            (index) {
              List<String> categories = [
                "Action",
                "Cartoon",
                "Comedy",
                "Thriller",
                "Romance",
                "Fiction"
              ];
              return Tab(
                child: Row(
                  children: [
                    if (_tabController.index == index)
                      Padding(
                        padding: EdgeInsets.only(right: responsive.width(2.5)),
                        child: Icon(Icons.circle,
                            color: Color(0xFFFA1306),
                            size: responsive.width(2.5)),
                      ),
                    Text(categories[index]),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: responsive.height(2)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 1; i <= 4; i++)
                Padding(
                  padding: EdgeInsets.only(left: responsive.width(2)),
                  child: GestureDetector(
                    onTap: () {
                      if (i == 1) {
                        Navigator.pushNamed(context, WhatIfScreen.routeName);
                      }
                      if (i == 2) {
                        Navigator.pushNamed(context, LokiScreen.routeName);
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/marvel/tv$i.png",
                        height: responsive.isMobile()
                            ? responsive.width(90)
                            : responsive.width(50),
                        width: responsive.isMobile()
                            ? responsive.width(60)
                            : responsive.width(30),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: responsive.height(5)),
        Padding(
          padding: EdgeInsets.only(
              left: responsive.width(2)), // Thêm khoảng cách bên phải
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn đều 2 bên
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform(
                    transform: Matrix4.identity()..scale(1.5, 1.2),
                    child: Text(
                      "BY CHARACTER",
                      style: GoogleFonts.leagueGothic(
                        color: Colors.white,
                        fontSize: responsive.isMobile()
                            ? responsive.width(10)
                            : responsive.width(6),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: responsive
                          .width(0.8)), // Khoảng cách giữa chữ và gạch
                  Container(
                    height: responsive.height(0.3),
                    width: responsive.width(10),
                    color: Colors.white, // Màu sắc đường gạch chân
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7), // Màu chữ nhạt hơn
                    fontSize: responsive.isMobile()
                        ? responsive.width(6)
                        : responsive.width(3),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: responsive.height(2)),
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
                      "assets/images/category/tv$i.png",
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
        SizedBox(height: responsive.height(5)),
        Padding(
          padding: EdgeInsets.only(left: responsive.width(2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform(
                transform: Matrix4.identity()..scale(1.5, 1.2),
                child: Text(
                  "ALL MOVIES",
                  style: GoogleFonts.leagueGothic(
                    color: Colors.white,
                    fontSize: responsive.isMobile()
                        ? responsive.width(10)
                        : responsive.width(8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 4), // Khoảng cách giữa chữ và gạch
              Container(
                height: responsive.height(0.3),
                width: responsive.width(10),
                color: Colors.white, // Màu sắc đường gạch chân
              ),
            ],
          ),
        ),
        SizedBox(height: responsive.height(3)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: responsive.isMobile()? 3 : 5,
              crossAxisSpacing: responsive.isMobile()
                  ? responsive.width(3)
                  : responsive.width(2),
              mainAxisSpacing: responsive.isMobile()
                  ? responsive.width(3)
                  : responsive.width(2),
              childAspectRatio: responsive.isMobile() ? (4 / 9) : (3 / 5),
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/category/show${index + 1}.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: responsive.isMobile()
                    ? responsive.width(5)
                    : responsive.width(6),),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: responsive.isMobile()
                    ? responsive.width(1)
                    : responsive.width(0.5),
                child: Container(
                  decoration: GradientStyles.colorMovieGradient(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: GradientStyles.colorMovieGradient(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Load More",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.isMobile()
                              ? responsive.width(10)
                              : responsive.width(6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: responsive.isMobile()
                    ? responsive.width(1)
                    : responsive.width(0.5),
                child: Container(
                  decoration: GradientStyles.colorMovieGradient(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: responsive.height(2)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.keyboard_double_arrow_down,
              color: Colors.white,
              size: responsive.isMobile()
                  ? responsive.width(8)
                  : responsive.width(6),
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}