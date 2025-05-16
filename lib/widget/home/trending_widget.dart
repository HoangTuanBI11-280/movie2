import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/helper/responsive.dart';
import 'package:movie2/screen/spider_screen.dart';

class TrendingWidget extends StatefulWidget {
  @override
  State<TrendingWidget> createState() => _TrendingWidgetState();
}

class _TrendingWidgetState extends State<TrendingWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
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
                        : responsive.width(8),
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
            4,
            (index) {
              List<String> categories = [
                "Movies",
                "TV Series",
                "Comics",
                "Games",
              ];
              return Tab(
                child: Row(
                  children: [
                    if (_tabController.index == index)
                      Padding(
                        padding: EdgeInsets.only(
                          right: responsive.isMobile()
                              ? responsive.width(3)
                              : responsive.width(3),
                        ),
                        child: Icon(
                          Icons.circle,
                          color: Color(0xFFFA1306),
                          size: responsive.isMobile()
                              ? responsive.width(4)
                              : responsive.width(3),
                        ),
                      ),
                    Text(categories[index]),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          height:
              responsive.isMobile() ? responsive.width(4) : responsive.width(3),
        ),
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
                        Navigator.pushNamed(context, SpiderScreen.routeName);
                      }
                      if (i == 2) {
                        Navigator.pushNamed(context, TheMarvelScreen.routeName);
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/marvel/image$i.png",
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
        SizedBox(height: 20),
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
                      "COMING SOON",
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
              GestureDetector(
                onTap: () {},
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7), // Màu chữ nhạt hơn
                    fontSize: responsive.isMobile()
                        ? responsive.width(6)
                        : responsive.width(5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
                      "assets/images/marvel/image$i.png",
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
    );
  }
}
