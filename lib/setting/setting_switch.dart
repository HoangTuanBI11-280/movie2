import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SettingSwitch extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color iconColor;
  final Color textColor;
  final IconData icon;
  final bool value;
  final Function(bool value) onTap;
  const SettingSwitch({
    super.key,
    required this.title,
    required this.bgColor,
    required this.iconColor,
    required this.icon,
    required this.onTap,
    required this.value, required this.textColor,
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
              color: textColor, 
            ),
          ),
          Spacer(),
          Text(
                value
                ?  "On" : "Off",
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor.withOpacity(0.7),
                  ),
                ),
          SizedBox(width: 20),
          CupertinoSwitch(value: value, onChanged: onTap),
          
        ],
      ),
    );
  }
}