import 'package:flutter/material.dart';
import 'package:movie2/setting/forward_button.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color iconColor;
  final Color textColor; // Thêm tham số textColor
  final IconData icon;
  final Function() onTap;
  final String? value;
  const SettingItem({
    super.key,
    required this.title,
    required this.bgColor,
    required this.iconColor,
    required this.textColor, // Khởi tạo textColor
    required this.icon,
    required this.onTap,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor, // Áp dụng màu chữ
            ),
          ),
          Spacer(),
          value != null
              ? Text(
                  value!,
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor.withOpacity(0.7), // Màu chữ giá trị (mờ hơn)
                  ),
                )
              : SizedBox(),
          SizedBox(width: 20),
          ForwardButton(
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
