import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/custom_header.dart';
import 'package:movie2/helper/color.dart';
import 'package:movie2/helper/responsive.dart';
import 'package:movie2/screen/avenger_united_screen.dart';
import 'package:movie2/screen/marvel_voice_screen.dart'; 

class ComicScreen extends StatelessWidget {
  static const String routeName = '/comicscreen';

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context); // Khởi tạo responsive helper

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/backgroundcomic.png'),
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
                  title: "COMICS",
                ),
                SizedBox(height: responsive.height(2)),
                ComicWidget(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomNavBar(),
    );
  }
}

class ComicWidget extends StatefulWidget {
  @override
  State<ComicWidget> createState() => _ComicWidgetState();
}

class _ComicWidgetState extends State<ComicWidget>
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
                    fontSize: responsive.width(6),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: responsive.height(0.5)),
              Container(
                height: responsive.height(0.3),
                width: responsive.width(10),
                color: Colors.white,
              ),
            ],
          ),
        ),
        TabBar(
          controller: _tabController,
          labelColor: Color(0xFFF6F5F5),
          unselectedLabelColor: Colors.white.withOpacity(0.5),
          isScrollable: true,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(),
          labelStyle: TextStyle(
            fontSize: responsive.width(3.3),
            fontWeight: FontWeight.w900,
          ),
          padding: EdgeInsets.only(
              left: responsive.width(0.5)), // Giảm khoảng cách bên trái
          labelPadding: EdgeInsets.symmetric(
              horizontal:
                  responsive.width(2.5)), // Giữ khoảng cách giữa các tab
          tabs: List.generate(6, (index) {
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
                      padding: EdgeInsets.only(
                          right:
                              responsive.width(1.5)), // Điều chỉnh icon chấm đỏ
                      child: Icon(Icons.circle,
                          color: Color(0xFFFA1306), size: responsive.width(2)),
                    ),
                  Text(categories[index]),
                ],
              ),
            );
          }),
        ),
        SizedBox(height: responsive.height(2)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(4, (index) {
              return Padding(
                padding: EdgeInsets.only(left: responsive.width(2)),
                child: GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.pushNamed(
                          context, AvengerUnitedScreen.routeName);
                    } else if (index == 1) {
                      Navigator.pushNamed(context, MarvelVoiceScreen.routeName);
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/images/marvel/comic${index + 1}.png",
                      height: responsive.width(50),
                      width: responsive.width(40),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: responsive.height(2)),
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
                    fontSize: responsive.width(8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: responsive.height(0.5)),
              Container(
                height: responsive.height(0.3),
                width: responsive.width(10),
                color: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(height: responsive.height(2)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.width(2)),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: responsive.width(2),
              mainAxisSpacing: responsive.width(4),
              childAspectRatio: 5 / 9,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/category/comic${index + 1}.png',
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ),
        SizedBox(height: responsive.height(3)),
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
              padding: EdgeInsets.symmetric(horizontal: responsive.width(2)),
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: responsive.width(5)),
                  decoration: GradientStyles.colorMovieGradient(),
                  child: Text(
                    "Load More",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: responsive.width(6),
                      fontWeight: FontWeight.bold,
                    ),
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
        SizedBox(height: responsive.height(2)),
        Icon(
          Icons.keyboard_double_arrow_down,
          color: Colors.white,
          size: responsive.width(5),
        ),
        SizedBox(height: responsive.height(2)),
      ],
    );
  }
}
