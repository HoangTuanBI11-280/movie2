import 'package:flutter/material.dart';

class ResponsiveUtil {
  final BuildContext context;
  late double screenWidth;
  late double screenHeight;
  late double blockSizeHorizontal;
  late double blockSizeVertical;

  ResponsiveUtil(this.context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    // Chia nhỏ màn hình theo từng loại thiết bị
    if (isMobile()) {
      blockSizeHorizontal = screenWidth / 120; // Mobile có 100 đơn vị
      blockSizeVertical = screenHeight /120;
    } else if (isTablet()) {
      blockSizeHorizontal = screenWidth / 150; // Tablet có 120 đơn vị
      blockSizeVertical = screenHeight / 150;
    } else {
      blockSizeHorizontal = screenWidth / 200; // Desktop có 150 đơn vị
      blockSizeVertical = screenHeight / 200;
    }
  }

  /// Trả về kích thước theo tỷ lệ chiều ngang màn hình
  double width(double percentage) {
    return blockSizeHorizontal * percentage;
  }

  /// Trả về kích thước theo tỷ lệ chiều dọc màn hình
  double height(double percentage) {
    return blockSizeVertical * percentage;
  }

  /// Xác định màn hình là Mobile
  bool isMobile() {
    return screenWidth < 600;
  }

  /// Xác định màn hình là Tablet
  bool isTablet() {
    return screenWidth >= 600 && screenWidth < 1200;
  }

  /// Xác định màn hình là Desktop
  bool isDesktop() {
    return screenWidth >= 1200;
  }

  /// Xác định màn hình có phải chế độ ngang không
  bool isLandscape() {
    return screenWidth > screenHeight;
  }

  /// Trả về kích thước font theo tỷ lệ màn hình
  double fontSize(double size) {
    return blockSizeHorizontal * (size / 3);
  }
}