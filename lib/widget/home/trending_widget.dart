import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/helper/responsive.dart';
import 'package:movie2/screen/avenger_united_screen.dart';
import 'package:movie2/screen/loki_screen.dart';
import 'package:movie2/screen/marvel_voice_screen.dart';
import 'package:movie2/screen/spider_screen.dart';
import 'package:dio/dio.dart';
import 'package:movie2/screen/what_if_screen.dart';

class TrendingWidget extends StatefulWidget {
  @override
  State<TrendingWidget> createState() => _TrendingWidgetState();
}

class _TrendingWidgetState extends State<TrendingWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>>? trendingMovies;
  List<Map<String, dynamic>>? trendingTVSeries;
  List<Map<String, dynamic>>? trendingComic;

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(_handleTabSelection);
    super.initState();
    fetchTrendingItems();
  }

  void fetchTrendingItems() async {
    try {
      var response = await Dio()
          .get('https://api.jsonbin.io/v3/b/6833e0168960c979a5a12517');
      if (response.statusCode == 200) {
        setState(() {
          var trendingData = response.data['record']['data']['Trending'];
          trendingMovies = (trendingData.firstWhere(
                  (item) => item['Type'] == 'Movie')['Movie'] as List)
              .map<Map<String, dynamic>>((item) => item as Map<String, dynamic>)
              .toList();
          trendingTVSeries = (trendingData.firstWhere(
                  (item) => item['Type'] == 'TV Series')['TVSeries'] as List)
              .map<Map<String, dynamic>>((item) => item as Map<String, dynamic>)
              .toList();
          trendingComic = (trendingData.firstWhere(
                  (item) => item['Type'] == 'Comic')['Comic'] as List)
              .map<Map<String, dynamic>>((item) => item as Map<String, dynamic>)
              .toList();
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching images: $e");
    }
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
        // Phần hiển thị nội dung theo tab
        if (_tabController.index == 0)
          buildTrendingContent(responsive, trendingMovies)
        else if (_tabController.index == 1)
          buildTrendingContent(responsive, trendingTVSeries)
        else if (_tabController.index == 2)
          buildTrendingContent(responsive, trendingComic)
        else
          Center(
            child: Text(
              "No data",
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.isMobile()
                    ? responsive.width(5)
                    : responsive.width(3.5),
                fontWeight: FontWeight.bold,
              ),
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

  Widget buildTrendingContent(
      ResponsiveUtil responsive, List<Map<String, dynamic>>? trendingList) {
    return (trendingList == null
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: trendingList.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> item = entry.value;
                return Padding(
                  padding: EdgeInsets.only(left: responsive.width(2)),
                  child: GestureDetector(
                    onTap: () {
                      if (index == 0 && trendingList == trendingTVSeries){
                         Navigator.pushNamed(context, WhatIfScreen.routeName);
                      }
                      else if (index == 1 && trendingList == trendingTVSeries){
                        Navigator.pushNamed(context, LokiScreen.routeName);
                      }
                      else if (index == 0 && trendingList == trendingComic){
                        Navigator.pushNamed(context, AvengerUnitedScreen.routeName);
                      }
                      else if (index == 1 && trendingList == trendingComic){
                        Navigator.pushNamed(context, MarvelVoiceScreen.routeName);
                      }
                      else if (index == 0) {
                        // Ảnh đầu tiên
                        Navigator.pushNamed(context, LokiScreen.routeName);
                      } else if (index == 1) {
                        // Ảnh thứ hai
                        Navigator.pushNamed(context, TheMarvelScreen.routeName);
                      }
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            item['Image'],
                            height: responsive.isMobile()
                                ? responsive.width(90)
                                : responsive.width(50),
                            width: responsive.isMobile()
                                ? responsive.width(60)
                                : responsive.width(30),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.black.withOpacity(0.8),
                                ],
                              ),
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(15),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  item['Name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: responsive.isMobile()
                                        ? responsive.width(5)
                                        : responsive.width(3.5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ));

  }
}
