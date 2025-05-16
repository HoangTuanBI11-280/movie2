import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/custom_header.dart';
import 'package:movie2/helper/responsive.dart';

class SpiderManScreen extends StatelessWidget {
  static const String routeName = '/spidermanscreen';

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/tvbackground.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                CustomHeader(
                    isBackIcon: true,
                    onMenuTap: () {
                      Navigator.pop(context);
                    },
                  onSearch: (keyword) {},
                  title: "TV-SHOWS",
                ),
                SizedBox(height: responsive.height(2)),
                Peter(), // Thêm TrendingWidget vào MovieScreen
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomNavBar(),
    );
  }
}

class Peter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform(
                        transform: Matrix4.identity()..scale(1.5, 1.2),
                        child: Text(
                          'IRON-MAN',
                          style: GoogleFonts.leagueGothic(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Tony Stark",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20),
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1),
                        unratedColor: Colors.grey,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.red[700],
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      SizedBox(height: 30),
                      Transform(
                        transform: Matrix4.identity()..scale(1.5, 1.2),
                        child: Text(
                          'About',
                          style: GoogleFonts.leagueGothic(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Thẻ nội dung
                          Text(
                            '''Iron Man is a complex and
conflicted character who is often 
driven by a sense of guilt and responsibility for the harm that his company has caused. He is also a brilliant inventor and strategist, 
who is always looking for new ways to improve his armor and fight evil.''',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          // Hình ảnh nằm trên
                          Positioned(
                            top: -190,
                            left: 110,
                            child: Image.asset(
                              'assets/images/background/ironman.png', // Thay đường dẫn thành hình ảnh của bạn
                              width: 240,
                              height: 220,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Transform(
                        transform: Matrix4.identity()..scale(1.5, 1.2),
                        child: Text(
                          'Movies',
                          style: GoogleFonts.leagueGothic(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 1; i <= 4; i++)
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/images/marvelstudio/ironman$i.png",
                                    height: 200,
                                    width: 150,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Transform(
                        transform: Matrix4.identity()..scale(1.5, 1.2),
                        child: Text(
                          'The Story of Iron Man: From Playboy Billionaire to Armored Avenger',
                          style: GoogleFonts.leagueGothic(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        '''Tony Stark, a genius inventor and billionaire playboy, lives a life of luxury and extravagance. 
However, his world is shattered when he is 
kidnapped in Afghanistan and seriously injured. To save his life, he implants a powerful 
electromagnet in his chest and builds a powered exoskeleton suit that allows him to survive.''',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 15),
                      Text(
                        '''Fueled by guilt and a newfound sense of 
purpose, Tony uses his resources and 
intelligence to become the armored superhero 
Iron Man. He vows to fight against the forces of 
evil that threaten the world, turning Stark 
Industries away from weapons manufacturing and towards peaceful technologies.
''',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}