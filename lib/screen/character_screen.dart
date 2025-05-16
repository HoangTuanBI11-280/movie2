import 'package:flutter/material.dart';

import 'package:movie2/custom_header.dart';
import 'package:movie2/screen/ironman_screen.dart';
import 'package:movie2/screen/spider_man_screen.dart';

class CharacterScreen extends StatelessWidget {
  static const String routeName = '/characterscreen';
  final List<String> characterNames = [
    'Iron Man',
    'Spider-Man',
    'Captain America',
    'Doctor Strange',
    'Hulk',
    'Black Widow',
    'Thanos',
    'Ant-Man',
    'Black Panther',
    'Wanda Maximoff',
    'Thor',
    'Heimdall',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/images/background/bakcgroundcharacter.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.darken,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader(
                    isBackIcon: true,
                    onMenuTap: () {
                      Navigator.pop(context);
                    },
                  onSearch: (keyword) {},
                  title: 'Character',
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Character List',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: GridView.builder(
                    shrinkWrap:
                        true, // Để tránh GridView chiếm toàn bộ màn hình
                    physics:
                        NeverScrollableScrollPhysics(), // Chỉ cuộn bên ngoài
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Số cột trong lưới
                      crossAxisSpacing: 10, // Khoảng cách ngang giữa các mục
                      mainAxisSpacing: 1, // Khoảng cách dọc giữa các mục
                      childAspectRatio: 7 / 10, // Tỷ lệ chiều rộng/chiều cao
                    ),
                    itemCount: characterNames
                        .length, // Số lượng mục hiển thị theo danh sách
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap:() {
                          if (index == 0) {
                            Navigator.pushNamed(context, IronManScreen.routeName);
                          }
                          if (index == 1) {
                            Navigator.pushNamed(context, SpiderManScreen.routeName);
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 190, // Tăng chiều cao của hình ảnh
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/marvelstudio/char${index + 1}.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 8), // Khoảng cách giữa hình ảnh và nhãn
                            Text(
                              characterNames[index], // Hiển thị tên từ danh sách
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}