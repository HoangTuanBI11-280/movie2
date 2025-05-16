import 'package:flutter/material.dart';
import 'package:movie2/custom_nav_bar.dart';
import 'package:movie2/helper/color.dart';
import 'package:movie2/helper/responsive.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splashscreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showLogoScreen = true; // Trạng thái màn hình (logo hoặc GIF)

  @override
  void initState() {
    super.initState();
  }

  _onTapToContinue() {
    setState(() {
      _showLogoScreen = false; // Chuyển sang màn hình GIF
    });

    // Sau khi hiển thị GIF, chuyển đến HomeScreen
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, CustomNavBar.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _showLogoScreen
          ? GestureDetector(
              onTap: _onTapToContinue,
              child: _buildLogoScreen(screenWidth, screenHeight),
            )
          : _buildGifScreen(screenWidth, screenHeight),
    );
  }

  // Màn hình logo
  Widget _buildLogoScreen(double width, double height) {
    final responsive = ResponsiveUtil(context);
    return Container(
      width: width,
      height: height,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: responsive.isMobile()
                  ? responsive.width(80)
                  : responsive.width(0.5),
            ),
            child: Image.asset(
              'assets/images/background/backsplash.png',
              width: responsive.isMobile()
                  ? responsive.width(100)
                  : responsive.width(0.5),
              height: responsive.isMobile()
                  ? responsive.width(60)
                  : responsive.width(0.5),
            ),
          ),
          Spacer(),
          Column(
            children: [
              Text(
                "LET'S GET STARTED",
                style: TextStyle(
                  fontSize: responsive.isMobile()
                      ? responsive.width(8)
                      : responsive.width(0.5),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "TAP HERE TO CONTINUE",
                style: TextStyle(
                  fontSize: responsive.isMobile()
                      ? responsive.width(5)
                      : responsive.width(0.5),
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          SizedBox(height: 40), // Thêm khoảng cách từ dưới nếu cần
        ],
      ),
    );
  }

  // Màn hình GIF
  Widget _buildGifScreen(double width, double height) {
    final responsive = ResponsiveUtil(context);
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: GradientStyles.colorButtomGradient(),
        ),
        Positioned(
          bottom: responsive.isMobile()
              ? responsive.width(0)
              : responsive.width(0.5),
          right: responsive.isMobile()
              ? responsive.width(-15)
              : responsive.width(0.5),
          child: Image(
            image: AssetImage('assets/draft/splash3.gif'),
            height: responsive.isMobile()
                ? responsive.width(250)
                : responsive.width(0.5),
            width: responsive.isMobile()
                ? responsive.width(150)
                : responsive.width(0.5),
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
