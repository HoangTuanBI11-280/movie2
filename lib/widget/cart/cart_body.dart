import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/helper/color.dart';
import 'package:movie2/widget/cart/quantity_button.dart';

class CartItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final int price;
  final int initialCount;
  final ValueChanged<int> onCountChanged;

  const CartItemCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.initialCount,
    required this.onCountChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: GradientStyles.colorItemGradient(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần hình ảnh
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath,
                height: 150,
                width: 91,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),

            // Phần nội dung
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tiêu đề
                    Text(
                      title,
                      style: GoogleFonts.leagueGothic(
                        color: Color.fromARGB(255, 120, 58, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Giá tiền và nút tăng giảm
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Giá tiền
                        Text(
                          '\$$price',
                          style: GoogleFonts.leagueGothic(
                            color: Colors.black54,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Nút tăng giảm
                        QuantityButton(
                          initialCount: initialCount,
                          onChanged: onCountChanged,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
