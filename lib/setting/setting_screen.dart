import 'package:flutter/material.dart';
import 'package:movie2/helper/responsive.dart';
import 'package:movie2/main.dart';
import 'package:movie2/setting/edit_setting.dart';
import 'package:movie2/setting/forward_button.dart';
import 'package:movie2/setting/setting_item.dart';
import 'package:movie2/setting/setting_switch.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  static const String routeName = '/settingscreen';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left_sharp,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        leadingWidth:
            responsive.isMobile() ? responsive.width(20) : responsive.width(10),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(
                  fontSize: responsive.isMobile()
                      ? responsive.width(40)
                      : responsive.width(30),
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(
                height: responsive.isMobile()
                    ? responsive.width(20)
                    : responsive.width(10),
              ),
              Text(
                "Account",
                style: TextStyle(
                  fontSize: responsive.isMobile()
                      ? responsive.width(40)
                      : responsive.width(30),
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: responsive.isMobile()
                          ? responsive.width(8)
                          : responsive.width(5),
                      backgroundImage:
                          AssetImage('assets/images/background/avatar1.png'),
                      onBackgroundImageError: (_, __) => Icon(Icons.error),
                    ),
                    SizedBox(
                      width: responsive.isMobile()
                          ? responsive.width(10)
                          : responsive.width(6),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Linda",
                          style: TextStyle(
                            fontSize: responsive.isMobile()
                                ? responsive.width(40)
                                : responsive.width(30),
                            fontWeight: FontWeight.bold,
                            color: themeProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: responsive.isMobile()
                              ? responsive.width(10)
                              : responsive.width(6),
                        ),
                        Text(
                          "lindahtvbdln@gmail.com",
                          style: TextStyle(
                            fontSize: responsive.isMobile()
                                ? responsive.width(10)
                                : responsive.width(6),
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    ForwardButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditSetting(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Settings",
                style: TextStyle(
                  fontSize: responsive.isMobile()
                      ? responsive.width(40)
                      : responsive.width(30),
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(
                height: responsive.isMobile()
                    ? responsive.width(10)
                    : responsive.width(6),
              ),
              SettingItem(
                title: "Language",
                icon: Icons.public,
                bgColor: Colors.red.shade200,
                iconColor: Colors.red,
                onTap: () {},
                value: "English",
                textColor:
                    themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              SizedBox(height: 10),
              SettingItem(
                title: "Notification",
                icon: Icons.notifications,
                bgColor: Colors.blue.shade200,
                iconColor: Colors.blue,
                textColor:
                    themeProvider.isDarkMode ? Colors.white : Colors.black,
                onTap: () {},
              ),
              SizedBox(height: 10),
              SettingSwitch(
                title: "Dark Mode",
                icon: Icons.nights_stay_rounded,
                bgColor: Colors.purple.shade200,
                iconColor: Colors.purple,
                onTap: (bool newValue) => themeProvider.toggleDarkMode(),
                value: themeProvider.isDarkMode,
                textColor:
                    themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              SizedBox(height: 10),
              SettingItem(
                title: "Help",
                icon: Icons.help,
                bgColor: Colors.red.shade200,
                iconColor: Colors.red,
                onTap: () {},
                textColor:
                    themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
