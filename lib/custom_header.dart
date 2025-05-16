import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:movie/Log/log_in_register.dart';
import 'package:movie2/helper/color.dart';
import 'package:movie2/helper/responsive.dart';
import 'package:movie2/screen/Home_screen.dart';
import 'package:movie2/screen/character_screen.dart';
import 'package:movie2/screen/comic_screen.dart';
import 'package:movie2/screen/game_screen.dart';
import 'package:movie2/screen/movie_screen.dart';
import 'package:movie2/screen/tv_show_screen.dart';
import 'package:movie2/setting/setting_screen.dart';

class CustomHeader extends StatefulWidget {
  final VoidCallback onMenuTap;
  final VoidCallback? onBackTap; // Hành động khi nhấn nút back
  final dynamic title;
  final Function(String)? onSearch;
  final bool isBackIcon; // Xác định hiển thị icon menu hoặc back

  CustomHeader({
    super.key,
    required this.onMenuTap,
    this.onBackTap,
    this.onSearch,
    required this.title,
    this.isBackIcon = false, // Mặc định là icon menu
  });

  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  bool _isSearchVisible = false;
  final TextEditingController _searchController = TextEditingController();

  void signUserOut() async {
    // Đóng thanh menu (Dialog hoặc Drawer)
    Navigator.pop(context);

    // Hiển thị xác nhận trước khi đăng xuất
    final confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Logout'),
            ),
          ],
        );
      },
    );

    // Nếu người dùng xác nhận thì thực hiện đăng xuất
    if (confirm == true) {
      await FirebaseAuth.instance.signOut();
    }
  }

  void _showSidebar() {
    final responsive = ResponsiveUtil(context);
    final double iconSize =
        responsive.isMobile() ? responsive.width(8) : responsive.width(5);

    final List<Map<String, dynamic>> menuItems = [
      {
        "icon": Icons.home,
        "title": "Home",
        "route": HomeScreen.routeName,
      },
      {
        "icon": Icons.menu_book_sharp,
        "title": "Comics",
        "route": ComicScreen.routeName
      },
      {
        "icon": Icons.local_movies_rounded,
        "title": "Movies",
        "route": MovieScreen.routeName
      },
      {
        "icon": Icons.emoji_people_sharp,
        "title": "Characters",
        "route": CharacterScreen.routeName
      },
      {
        "icon": Icons.tv_outlined,
        "title": "TV-Shows",
        "route": TVShowScreen.routeName
      },
      {
        "icon": Icons.sports_esports,
        "title": "Games",
        "route": GameScreen.routeName
      },
      {
        "icon": Icons.settings,
        "title": "Setting",
        "route": SettingScreen.routeName,
      },
      {
        "icon": Icons.logout,
        "title": "Log Out",
        "onPressed": () {
          signUserOut();
        },
      }
    ];

    showDialog(
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: responsive.isMobile() ? 0.6 : 0.3,
            child: Drawer(
              child: Container(
                decoration: GradientStyles.colorSideGradient(),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: GradientStyles.colorMenuGradient(),
                      child: Center(
                        child: Text(
                          'Menu',
                          style: TextStyle(
                              color: Colors.white, fontSize: iconSize),
                        ),
                      ),
                    ),
                    ...menuItems.map((item) => ListTile(
                          leading: Icon(item["icon"],
                              color: Colors.white, size: iconSize),
                          title: Text(item["title"],
                              style: TextStyle(
                                  color: Colors.white, fontSize: iconSize)),
                          onTap: item["onPressed"] != null
                              ? () => item["onPressed"]() // Logout
                              : item["route"] != null
                                  ? () => Navigator.pushNamed(
                                      context, item["route"]) // Các mục khác
                                  : null,
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    final double iconSize = responsive.width(10);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Hiển thị icon menu hoặc arrow back
              InkWell(
                onTap: widget.isBackIcon
                    ? widget.onBackTap ?? () => Navigator.pop(context)
                    : () {
                        widget.onMenuTap();
                        _showSidebar();
                      },
                child: Icon(
                  widget.isBackIcon ? Icons.arrow_back : Icons.menu,
                  color: Colors.white,
                  size: iconSize,
                ),
              ),
              // Tiêu đề
              if (widget.title is String)
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ObelixPro-cyr',
                    fontSize: responsive.isMobile()
                        ? responsive.width(10)
                        : responsive.width(10),
                    fontWeight: FontWeight.w500,
                  ),
                )
              else
                widget.title,
              // Icon tìm kiếm
              InkWell(
                onTap: () {
                  setState(() {
                    _isSearchVisible = !_isSearchVisible;
                  });
                },
                child: Icon(Icons.search, color: Colors.white, size: iconSize),
              ),
            ],
          ),
        ),
        // Thanh tìm kiếm
        if (_isSearchVisible)
          Container(
            height: iconSize * 2,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                        fontSize: iconSize * 0.6,
                      ),
                    ),
                    onFieldSubmitted: widget.onSearch,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close,
                      color: Colors.white54, size: iconSize * 0.8),
                  onPressed: () {
                    setState(() {
                      _isSearchVisible = false;
                    });
                    _searchController.clear();
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}
