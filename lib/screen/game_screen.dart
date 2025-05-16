import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/custom_header.dart';
import 'package:movie2/helper/responsive.dart';
// import 'package:movie/widgets/custom_nav_bar.dart';

class GameScreen extends StatelessWidget {
  static const String routeName = '/gamescreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/category/thumb3.png'),
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
                  title: "GAMES",
                ),
                SizedBox(height: 15),
                GameWidget(), // Thêm TrendingWidget vào MovieScreen
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GameWidget extends StatefulWidget {
  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget>
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
        GridView.count(
          padding: EdgeInsets.all(8),
          shrinkWrap: true, // Tránh lỗi layout trong Column
          physics:
              NeverScrollableScrollPhysics(), // Tắt scroll riêng của GridView
          crossAxisCount: 2,
          childAspectRatio: responsive.isMobile() ? (15 / 9) : (30 / 5),
          children: [
            for (int i = 1; i < 5; i++)
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: responsive.isMobile()
                        ? responsive.width(6)
                        : responsive.width(0.5),
                    horizontal: responsive.isMobile()
                        ? responsive.width(2)
                        : responsive.width(0.5),
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: responsive.isMobile()
                        ? responsive.width(2)
                        : responsive.width(1),
                    horizontal: responsive.width(1),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, // Căn hàng ngang
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Căn giữa theo trục dọc
                        children: [
                          if (i == 1)
                            Text(
                              "Windows",
                              style: GoogleFonts.leagueGothic(
                                color: Colors.white,
                                fontSize: responsive.isMobile()
                                    ? responsive.width(8)
                                    : responsive.width(6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          if (i == 2)
                            Text(
                              "Mobile",
                              style: GoogleFonts.leagueGothic(
                                color: Colors.white,
                                fontSize: responsive.isMobile()
                                    ? responsive.width(8)
                                    : responsive.width(6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          if (i == 3)
                            Text(
                              "Xbox",
                              style: GoogleFonts.leagueGothic(
                                color: Colors.white,
                                fontSize: responsive.isMobile()
                                    ? responsive.width(8)
                                    : responsive.width(6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          if (i == 4)
                            Text(
                              "PlayStation",
                              style: GoogleFonts.leagueGothic(
                                color: Colors.white,
                                fontSize: responsive.isMobile()
                                    ? responsive.width(8)
                                    : responsive.width(6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          SizedBox(width: 30),
                          Image.asset(
                            "assets/images/category/gameicon$i.png",
                            width: responsive.isMobile()
                                ? responsive.width(15)
                                : responsive.width(10),
                            height: responsive.isMobile()
                                ? responsive.width(15)
                                : responsive.width(10),
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform(
                transform: Matrix4.identity()..scale(1.5, 1.2),
                child: Text(
                  "LATEST GAMES",
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
                width: responsive.width(10),
                color: Colors.white, // Màu sắc đường gạch chân
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
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
                : responsive.width(3),
            fontWeight: FontWeight.w900,
          ),
          labelPadding: EdgeInsets.only(left: responsive.width(3)),
          tabs: List.generate(
            6,
            (index) {
              List<String> categories = [
                "Action",
                "Cartoon",
                "Comedy",
                "Thriller",
                "Romance",
                "Fiction",
              ];
              return Tab(
                child: Row(
                  children: [
                    if (_tabController.index == index)
                      Padding(
                        padding: EdgeInsets.only(
                          right: responsive.isMobile()
                              ? responsive.width(3)
                              : responsive.width(2),
                        ),
                        child: Icon(
                          Icons.circle,
                          color: Colors.red,
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
              responsive.isMobile() ? responsive.width(3) : responsive.width(1),
        ),
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
                      "assets/images/category/thumb$i.png",
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
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 10),
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
                        : responsive.width(6),
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
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.isMobile()
                ? responsive.width(4)
                : responsive.width(3),
          ),
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
              childAspectRatio: responsive.isMobile() ? (5 / 9) : (3 / 5),
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
                            'assets/images/category/game${index + 1}.png',
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
        SizedBox(height: 15),
      ],
    );
  }
}