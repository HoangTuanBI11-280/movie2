import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/custom_header.dart';
import 'package:movie2/helper/color.dart';
import 'package:movie2/helper/responsive.dart';
import 'package:movie2/screen/spider_screen.dart';

class MovieScreen extends StatelessWidget {
  static const String routeName = '/moviescreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
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
                  title: "MOVIES",
                ),
                SizedBox(height: 15),
                TrendingWidget(), // Thêm TrendingWidget vào MovieScreen
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomNavBar(),
    );
  }
}

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
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform(
                transform: Matrix4.identity()..scale(1.5, 1.2),
                child: Text(
                  "TRENDING",
                  style: GoogleFonts.leagueGothic(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Container(
                height: 2,
                width: 35,
                color: Colors.white, // Màu sắc đường gạch chân
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
          tabs: [
            Tab(
              child: Row(
                children: [
                  if (_tabController.index == 0)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.circle,
                          color: Color(0xFFFA1306), size: 10),
                    ),
                  Text("Action"),
                ],
              ),
            ),
            Tab(
              child: Row(
                children: [
                  if (_tabController.index == 1)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.circle,
                          color: Color(0xFFFA1306), size: 10),
                    ),
                  Text("Cartoon")
                ],
              ),
            ),
            Tab(
              child: Row(
                children: [
                  if (_tabController.index == 2)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.circle,
                          color: Color(0xFFFA1306), size: 10),
                    ),
                  Text("Comedy"),
                ],
              ),
            ),
            Tab(
              child: Row(
                children: [
                  if (_tabController.index == 3)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.circle,
                          color: Color(0xFFFA1306), size: 10),
                    ),
                  Text("Thriller"),
                ],
              ),
            ),
            Tab(
              child: Row(
                children: [
                  if (_tabController.index == 4)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.circle,
                          color: Color(0xFFFA1306), size: 10),
                    ),
                  Text("Romance"),
                ],
              ),
            ),
            Tab(
              child: Row(
                children: [
                  if (_tabController.index == 5)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.circle,
                          color: Color(0xFFFA1306), size: 10),
                    ),
                  Text("Fiction"),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 1; i <= 4; i++)
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      if (i == 1) {
                        // Chỉ xử lý khi nhấn vào image1
                        Navigator.pushNamed(context, SpiderScreen.routeName);
                      }
                      if (i == 2) {
                        // Chỉ xử lý khi nhấn vào image1
                        Navigator.pushNamed(context, TheMarvelScreen.routeName);
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/marvel/image$i.png",
                        height: 200,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding:
              EdgeInsets.only(left: 10, right: 10), // Thêm khoảng cách bên phải
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
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 4), // Khoảng cách giữa chữ và gạch
                  Container(
                    height: 2, // Độ dày đường gạch chân
                    width: 55, // Độ dài đường gạch chân
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
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
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
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final screenWidth = MediaQuery.of(context).size.width;
                        final screenHeight = MediaQuery.of(context).size.height;
                        return Image.asset(
                          "assets/images/category/char$i.png",
                          height: screenHeight * 0.3, // 30% chiều cao màn hình
                          width: screenWidth * 0.4, // 40% chiều rộng màn hình
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 10),
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
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 4), // Khoảng cách giữa chữ và gạch
              Container(
                height: 2, // Độ dày đường gạch chân
                width: 55, // Độ dài đường gạch chân
                color: Colors.white, // Màu sắc đường gạch chân
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 5 / 9,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              final screenWidth = MediaQuery.of(context).size.width;
              final itemWidth =
                  (screenWidth - 32 - 10) / 2; // Kích thước mỗi mục
              final itemHeight = itemWidth / 0.5; // Tỷ lệ chiều cao
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      height: itemHeight,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/category/movies${index + 1}.png',
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
                          fontSize: 20,
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
                height: 3,
                child: Container(
                  decoration: GradientStyles.colorLine1Gradient(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.keyboard_double_arrow_down,
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
