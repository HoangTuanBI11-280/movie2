import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart'; // Thêm thư viện Dio để gọi API
import 'package:movie2/helper/responsive.dart';

class SpiderMan extends StatefulWidget {
  @override
  State<SpiderMan> createState() => _SpiderManState();
}

class _SpiderManState extends State<SpiderMan> {
  List<Map<String, dynamic>>? stories;

  @override
  void initState() {
    super.initState();
    fetchImages(); // Gọi API khi khởi tạo
  }

  void fetchImages() async {
    try {
      var response = await Dio()
          .get('https://api.jsonbin.io/v3/b/6833e0168960c979a5a12517');
      if (response.statusCode == 200) {
        setState(() {
          // Lấy danh sách truyện từ JSON
          stories =
              (response.data['record']['data']['theloai'][0]['Truyen'] as List)
                  .map<Map<String, dynamic>>(
                      (story) => story as Map<String, dynamic>)
                  .toList();
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching images: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tiêu đề Spider-Man
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform(
                      transform: Matrix4.identity()..scale(1.5, 1.2),
                      child: Text(
                        "SPIDER-MAN",
                        style: GoogleFonts.leagueGothic(
                          color: Colors.white,
                          fontSize: responsive.isMobile()
                              ? responsive.width(12)
                              : responsive.width(8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: responsive.isMobile()
                          ? responsive.width(3)
                          : responsive.width(20),
                    ),
                    Text(
                      "Across the Spider-Verse",
                      style: GoogleFonts.leagueGothic(
                        color: Colors.white,
                        fontSize: responsive.isMobile()
                            ? responsive.width(6)
                            : responsive.width(20),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                // Các biểu tượng bên phải
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // TODO: Handle download action
                      },
                      icon: Icon(
                        Icons.download,
                        color: Colors.white,
                        size: responsive.isMobile()
                            ? responsive.width(10)
                            : responsive.width(20),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: Handle cart action
                      },
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: responsive.isMobile()
                            ? responsive.width(10)
                            : responsive.width(20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.isMobile()
                  ? responsive.width(3)
                  : responsive.width(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2h 20m",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: responsive.isMobile()
                        ? responsive.width(8)
                        : responsive.width(5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: responsive.isMobile()
                ? responsive.width(20)
                : responsive.width(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.isMobile()
                  ? responsive.width(1)
                  : responsive.width(1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle_outline_outlined,
                    color: Colors.white,
                    size: responsive.isMobile()
                        ? responsive.width(40)
                        : responsive.width(20),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: responsive.isMobile()
                ? responsive.width(20)
                : responsive.width(20),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: responsive.isMobile()
                  ? responsive.width(3)
                  : responsive.width(20),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform(
                      transform: Matrix4.identity()..scale(1.5, 1.2),
                      child: Text(
                        "FEATURED FOR YOU",
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
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: responsive.width(10)),

          // Phần hiển thị danh sách truyện
          stories == null
              ? Center(
                  child:
                      CircularProgressIndicator()) // Hiển thị khi chờ dữ liệu
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: stories!.map((story) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            // Hình ảnh chính
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                story['StoryImage'], // URL hình ảnh
                                height: responsive.isMobile()
                                    ? responsive.width(90)
                                    : responsive.width(50),
                                width: responsive.isMobile()
                                    ? responsive.width(60)
                                    : responsive.width(30),
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Nền mờ đen phía dưới
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
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
                                  borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(15),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Tên phụ đề
                                    Text(
                                      story['StoryName'], // Tên truyện
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

                                    // Tên chính (ví dụ: Tên phim hoặc tiêu đề phụ)
                                    Text(
                                      "Update: ${story['UpdateTime'] ?? "Không rõ"}", // Phụ đề
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: responsive.isMobile()
                                            ? responsive.width(4)
                                            : responsive.width(2.8),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ],
      ),
    );
  }
}
