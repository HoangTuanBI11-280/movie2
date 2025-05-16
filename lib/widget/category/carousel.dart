import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie2/helper/responsive.dart';

class Carousel extends StatefulWidget {
  Carousel({super.key});

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final int imageCount = 5;
  int _currentSlide = 0; // Biến lưu slide hiện tại

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Column(
      children: [
        SizedBox(height: 16),
        CarouselSlider(
          items: [
            for (int i = 1; i <= imageCount; i++)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.isMobile()
                      ? responsive.width(6)
                      : responsive.width(2),
                  vertical: responsive.isMobile()
                      ? responsive.width(5)
                      : responsive.width(5),
                ), // Căn lề giữa các ảnh
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15), // Góc bo tròn
                  child: Image.asset(
                    "assets/images/carousel/image$i.png", // Đường dẫn ảnh
                    fit: BoxFit.fill, // Hiển thị toàn bộ ảnh
                  ),
                ),
              ),
          ],
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            enlargeCenterPage: true,
            aspectRatio: responsive.isMobile() ? 8 / 6 : 20 / 9,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              // Cập nhật slide hiện tại
              setState(() {
                _currentSlide = index;
              });
            },
          ),
        ),
        // SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imageCount, // Số lượng chỉ báo trang (bằng số lượng ảnh)
            (index) => Container(
              height: responsive.isMobile()
                  ? responsive.width(4)
                  : responsive.width(1),
              width: responsive.isMobile()
                  ? responsive.width(3)
                  : responsive.width(1),
              margin: EdgeInsets.symmetric(horizontal: responsive.width(1)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentSlide == index
                    ? Colors.white // Màu sáng khi là slide hiện tại
                    : Colors.grey.shade400, // Màu tối cho các slide còn lại
              ),
            ),
          ),
        ),
      ],
    );
  }
}
