import 'package:flutter/material.dart';
import 'package:movie2/custom_header.dart';
import 'package:movie2/helper/responsive.dart';
import 'package:movie2/main.dart';
import 'package:movie2/widget/home/new_stories.dart';
import 'package:movie2/widget/home/trending_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homescreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;
  late Animation<Offset> _menuAnimation;
  late Animation<Offset> _searchAnimation;
  bool _showMainContent = true;

  // Biến static để lưu trạng thái animation đã chạy hay chưa
  static bool hasShownAnimation = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();

    // Chỉ chạy animation nếu chưa từng chạy
    if (!hasShownAnimation) {
      _runIntroAnimation();
      hasShownAnimation = true; // Đánh dấu đã chạy animation
    }
  }

  @override
  bool get wantKeepAlive => true;

  void _initializeAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _menuAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(-0.45, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _searchAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(0.45, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _runIntroAnimation() {
    setState(() {
      _showMainContent = false; // Ẩn nội dung chính
    });

    _controller.forward().then((_) {
      Future.delayed(Duration(milliseconds: 50), () {
        setState(() {
          _showMainContent =
              true; // Hiển thị nội dung chính sau khi animation kết thúc
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Hủy AnimationController khi không cần thiết
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(themeProvider.isDarkMode
                ? 'assets/draft/background1.png'
                : 'assets/images/background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: _showMainContent ? _buildMainContent() : _buildIntroAnimation(),
      ),
    );
  }

  Widget _buildIntroAnimation() {
    final responsive = ResponsiveUtil(context);
    return SafeArea(
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _menuAnimation,
            builder: (context, child) {
              return SlideTransition(
                position: _menuAnimation,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: responsive.width(10),
                    ),
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _searchAnimation,
            builder: (context, child) {
              return SlideTransition(
                position: _searchAnimation,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: responsive.isMobile()
                            ? responsive.width(1)
                            : responsive.width(1),
                        top: responsive.isMobile()
                            ? responsive.width(7)
                            : responsive.width(1),),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: responsive.width(10),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    final responsive = ResponsiveUtil(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              onMenuTap: () {},
              onSearch: (keyword) {},
              title: themeProvider.isDarkMode ? "DC" : "MARVEL",
            ),
            SizedBox(height: responsive.isMobile()
                            ? responsive.width(10)
                            : responsive.width(1),),
            TrendingWidget(),
            SizedBox(height: responsive.isMobile()
                            ? responsive.width(10)
                            : responsive.width(1),),
            NewestStories(),
          ],
        ),
      ),
    );
  }
}
