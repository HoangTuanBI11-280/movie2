import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/widget/cart/cart_body.dart';

class ItemCart extends StatefulWidget {
  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'imagePath': 'assets/images/marvel/image4.png',
      'title': 'Guardians of the Galaxy Vol-3',
      'price': 55,
      'count': 1,
    },
    {
      'imagePath': 'assets/images/cart/image1.png',
      'title': 'Avengers United Infinity Comic  #7',
      'price': 32,
      'count': 1,
    },
    {
      'imagePath': 'assets/images/cart/image2.png',
      'title': 'Carnage (2023) #1',
      'price': 60,
      'count': 1,
    },
    {
      'imagePath': 'assets/images/cart/image3.png',
      'title': 'Immortal X-Men (2022) #17',
      'price': 19,
      'count': 2,
    },
  ];

  bool _showDetails = false; // Biến trạng thái để kiểm soát hiển thị

  void _updateItemCount(int index, int newCount) {
    setState(() {
      _cartItems[index]['count'] = newCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Render danh sách các thẻ
          ..._cartItems.asMap().entries.map(
            (entry) {
              final index = entry.key;
              final item = entry.value;

              return CartItemCard(
                imagePath: item['imagePath'],
                title: item['title'],
                price: item['price'],
                initialCount: item['count'],
                onCountChanged: (newCount) => _updateItemCount(index, newCount),
              );
            },
          ).toList(),

          // Thêm dải phân cách ở cuối
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Container(
                height: 2.5,
                width: 260,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Nút Promo Code (chiếm 1/2 hộp)
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFF8ace00), // Màu nền cho nút Promo Code
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ), // Bo tròn góc trái
                      ),
                      child: Text(
                        "Promo Code",
                        style: GoogleFonts.leagueGothic(
                          color: Color(0xFF000001),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                // Nút Apply chiếm một nửa
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showDetails = !_showDetails; // Đổi trạng thái hiển thị
                      });
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _showDetails
                            ? Color(0xFFCEE89A) // Màu nhạt hơn khi nhấn
                            : Color(0xFF8ace00), // Màu nền mặc định
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ), // Bo tròn góc phải
                      ),
                      child: Text(
                        "Apply",
                        style: GoogleFonts.leagueGothic(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Màu chữ nổi bật
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          // Hiển thị Sub Total, Discount, Total nếu _showDetails = true
          if (_showDetails)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF8ace00),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Dòng Sub Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total",
                          style: GoogleFonts.leagueGothic(
                            color: Color(0xFF000001),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            "\$185",
                            style: GoogleFonts.leagueGothic(
                              color: Color(0xFF000001),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount",
                          style: GoogleFonts.leagueGothic(
                            color: Color(0xFF000001),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            "10%",
                            style: GoogleFonts.leagueGothic(
                              color: Color(0xFF000001),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    DottedLine(
                      lineLength: 250.0,
                      dashLength: 10.0,
                      dashGapLength: 5.0,
                      lineThickness: 3.0,
                      dashColor: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: GoogleFonts.leagueGothic(
                            color: Color(0xFF000001),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            "\$166.5",
                            style: GoogleFonts.leagueGothic(
                              color: Color(0xFF000001),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
