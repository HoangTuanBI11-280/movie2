import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/helper/responsive.dart';

class SpiderMan extends StatelessWidget {
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
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Across the Spider-Verse",
                      style: GoogleFonts.leagueGothic(
                        color: Colors.white,
                        fontSize: 16,
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
                        size: 28,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: Handle cart action
                      },
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2h 20m",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: responsive.isMobile()
                ? responsive.width(30)
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
                : responsive.width(8),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: responsive.width(2)), // Thêm khoảng cách bên phải
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Căn đều 2 bên
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
                      color: Colors.white, // Màu sắc đường gạch chân
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: responsive.isMobile()
                ? responsive.width(10)
                : responsive.width(8),
          ),
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
                        "assets/images/marvelstudio/spider$i.png",
                        height: responsive.isMobile()
                            ? responsive.width(90)
                            : responsive.width(50),
                        width: responsive.isMobile()
                            ? responsive.width(60)
                            : responsive.width(30),
                        fit: BoxFit.cover,
                      ),
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

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:dio/dio.dart';

// class SpiderMan extends StatelessWidget {
//   // Tạo một đối tượng Dio
//   final Dio dio = Dio();

//   // Hàm lấy dữ liệu từ API
//   Future<Map<String, dynamic>> fetchMovieDetails() async {
//     final url = "https://b0ynhanghe0.github.io/data%20fake/trangchu.json";

//     try {
//       // Gửi yêu cầu GET bằng Dio
//       final response = await dio.get(url);

//       // Kiểm tra trạng thái HTTP
//       if (response.statusCode == 200) {
//         return response.data; // Trả về dữ liệu JSON dạng Map
//       } else {
//         throw Exception("Failed to load movie details: ${response.statusCode}");
//       }
//     } catch (e) {
//       throw Exception("Error fetching movie details: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Map<String, dynamic>>(
//       future: fetchMovieDetails(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text("Error: ${snapshot.error}"));
//         } else {
//           final movieDetails = snapshot.data!;
//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Transform(
//                             transform: Matrix4.identity()..scale(1.5, 1.2),
//                             child: Text(
//                               movieDetails["title"] ?? "SPIDER-MAN",
//                               style: GoogleFonts.leagueGothic(
//                                 color: Colors.white,
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             movieDetails["subtitle"] ?? "Across the Spider-Verse",
//                             style: GoogleFonts.leagueGothic(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               // TODO: Handle download action
//                             },
//                             icon: Icon(
//                               Icons.download,
//                               color: Colors.white,
//                               size: 28,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               // TODO: Handle cart action
//                             },
//                             icon: Icon(
//                               Icons.shopping_cart_outlined,
//                               color: Colors.white,
//                               size: 28,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         movieDetails["duration"] ?? "Unknown duration",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(height: 16),
//                       Text(
//                         movieDetails["description"] ?? "No description available",
//                         style: TextStyle(
//                           color: Colors.white70,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
// }


