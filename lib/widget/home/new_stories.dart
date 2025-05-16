import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/helper/responsive.dart';

class NewestStories extends StatelessWidget {
  final List<Map<String, String>> spidermanStories = [
    {
      'imagePath': 'assets/images/spiderman.png',
      'storyText': """In the bustling heart of New York City, 
a young high school student named Peter Parker was about to embark on an extraordinary journey that would change his life forever.""",
    },
  ];

  final List<Map<String, String>> ironmanStories = [
    {
      'imagePath': 'assets/images/ironman.png',
      'storyText': """In the heart of Silicon Valley, Tony Stark, 
a brilliant but arrogant billionaire, was 
at the pinnacle of success. His company, Stark Industries, was a leader in weapons technology.""",
    },
  ];

  final List<Map<String, String>> scarletWitchStories = [
    {
      'imagePath': 'assets/images/scarlet.png',
      'storyText': """One of the most powerful witches on 
Earth, she is a complex character as \nshe is both a threat to all of humanity and \nmutants, and a powerful ally to the Avengers.""",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          _buildHeader(context),
          SizedBox(
            height: responsive.isMobile()
                ? responsive.width(20)
                : responsive.width(10),
          ),
          _buildSectionTitle(context, "SPIDER-MAN"),
          SizedBox(
            height: responsive.isMobile()
                ? responsive.width(10)
                : responsive.width(1),
          ),
          _buildStoryList(spidermanStories, context),
          SizedBox(
            height: responsive.isMobile()
                ? responsive.width(20)
                : responsive.width(1),
          ),
          _buildSectionTitle(context, "IRON-MAN"),
          SizedBox(
            height: responsive.isMobile()
                ? responsive.width(10)
                : responsive.width(1),
          ),
          _buildStoryList(ironmanStories, context),
          SizedBox(
            height: responsive.isMobile()
                ? responsive.width(20)
                : responsive.width(1),
          ),
          _buildSectionTitle(context, "SCARLET WITCH"),
          SizedBox(
            height: responsive.isMobile()
                ? responsive.width(10)
                : responsive.width(1),
          ),
          _buildStoryList(scarletWitchStories, context),
        ],
      ),
    );
  }

  // Hàm xây dựng tiêu đề chính
  Widget _buildHeader(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            responsive.isMobile() ? responsive.width(2) : responsive.width(1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform(
            transform: Matrix4.identity()..scale(1.5, 1.2),
            child: Text(
              "NEWEST STORIES",
              style: GoogleFonts.leagueGothic(
                color: Colors.white,
                fontSize: responsive.isMobile()
                    ? responsive.width(10)
                    : responsive.width(1),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            "More",
            style: GoogleFonts.leagueGothic(
                color: Colors.white54,
                fontSize: responsive.isMobile()
                    ? responsive.width(8)
                    : responsive.width(1),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  // Hàm xây dựng tiêu đề
  Widget _buildSectionTitle(BuildContext context, String title) {
    final responsive = ResponsiveUtil(context);
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsive.width(2)),
        child: Text(
          title,
          style: GoogleFonts.lilitaOne(
              color: Colors.white,
              fontSize: responsive.isMobile()
                  ? responsive.width(10)
                  : responsive.width(1),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  // Hàm xây dựng danh sách thẻ câu chuyện
  Widget _buildStoryList(
      List<Map<String, String>> stories, BuildContext context) {
    return Column(
      children: stories.map((story) {
        return _buildStoryCard(
            context, story['imagePath']!, story['storyText']!);
      }).toList(),
    );
  }

  // Hàm xây dựng thẻ câu chuyện chung
  Widget _buildStoryCard(
      BuildContext context, String imagePath, String storyText) {
    final responsive = ResponsiveUtil(context);
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: responsive.width(3)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Nội dung thẻ
            _buildCardContent(context, storyText),
            // Hình ảnh nhân vật
            Positioned(
              top: responsive.width(-35),
              left: responsive.width(60),
              child: Image.asset(
                imagePath,
                width: responsive.width(60),
                height: responsive.width(60),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm xây dựng nội dung thẻ
  Widget _buildCardContent(BuildContext context, String storyText) {
    final responsive = ResponsiveUtil(context);
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0026FF),
        borderRadius: BorderRadius.circular(responsive.width(2)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(responsive.width(2)),
        ),
        padding: EdgeInsets.all(responsive.width(5)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              storyText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: responsive.isMobile()
                      ? responsive.width(4)
                      : responsive.width(1),
                  fontWeight: FontWeight.w500),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: responsive.width(5)),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Read More",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: responsive.width(4),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
