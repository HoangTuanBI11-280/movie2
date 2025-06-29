import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart'; 
import 'package:movie2/helper/responsive.dart';
import 'package:video_player/video_player.dart';

class SpiderMan extends StatefulWidget {
  @override
  State<SpiderMan> createState() => _SpiderManState();
}

class _SpiderManState extends State<SpiderMan> {
  List<Map<String, dynamic>>? stories;
  String? videoUrl; // URL video
  VideoPlayerController? _videoController;
  bool isVideoVisible = false; // Biến trạng thái để ẩn/hiển video

  @override
  void initState() {
    super.initState();
    fetchImages(); // Gọi API khi khởi tạo
  }

  void fetchImages() async {
    try {
      var response = await Dio()
          .get('https://api.jsonbin.io/v3/b/6833e0168960c979a5a12517');
      if (response.statusCode == 200) {
        setState(() {
          // Lấy danh sách truyện từ JSON
          stories =
              (response.data['record']['data']['theloai'][0]['Truyen'] as List)
                  .map<Map<String, dynamic>>(
                      (story) => story as Map<String, dynamic>)
                  .toList();
          videoUrl = response.data['record']['data']['Vid'][0]['Video'];
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching images: $e");
    }
  }

  void playVideo() {
  if (videoUrl != null) {
    _videoController = VideoPlayerController.network(videoUrl!)
      ..initialize().then((_) {
        setState(() {
          isVideoVisible = true;
        });
        _videoController!.play();
      });
  } else {
    print("Video URL is null");
  }
}

  void stopVideo() {
  if (_videoController != null && _videoController!.value.isPlaying) {
    _videoController!.pause();
    setState(() {}); // Cập nhật lại giao diện
  }
}


  void closeVideo() {
    if (_videoController != null) {
      _videoController!.dispose();
      setState(() {
        _videoController = null;
        isVideoVisible = false; // Ẩn video
      });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose(); // Giải phóng bộ nhớ
    super.dispose();
  }

  Widget buildCommentSection() {
    final responsive = ResponsiveUtil(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bình luận (0)',
          style: GoogleFonts.leagueGothic(
            textStyle: TextStyle(
              fontSize: responsive.isMobile() ? 22 : 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                maxLength: 1000,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Viết bình luận',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Color(0xFF2A2A2A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Thêm logic gửi bình luận
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: CircleBorder(),
              ),
              child: Icon(Icons.send, color: Colors.black),
            ),
          ],
        ),
        SizedBox(height: 20),
        // ...List.generate(3, (index) {
        //   return Padding(
        //     padding: const EdgeInsets.only(bottom: 20),
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         CircleAvatar(
        //           radius: 20,
        //           backgroundColor: Colors.grey,
        //           child: Icon(Icons.person, color: Colors.white),
        //         ),
        //         SizedBox(width: 10),
        //         Expanded(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 'Tên người dùng',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //               SizedBox(height: 5),
        //               Text(
        //                 'Đây là bình luận mẫu cho phần giao diện Flutter.',
        //                 style: TextStyle(color: Colors.grey),
        //               ),
        //               SizedBox(height: 5),
        //               Row(
        //                 children: [
        //                   TextButton(
        //                     onPressed: () {},
        //                     child: Text('Trả lời',
        //                         style: TextStyle(color: Colors.amber)),
        //                   ),
        //                   TextButton(
        //                     onPressed: () {},
        //                     child: Text('Thêm',
        //                         style: TextStyle(color: Colors.amber)),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   );
        // }),
      ],
    );
  }
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
                          fontSize: responsive.isMobile()
                              ? responsive.width(12)
                              : responsive.width(8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: responsive.isMobile()
                          ? responsive.width(3)
                          : responsive.width(20),
                    ),
                    Text(
                      "Across the Spider-Verse",
                      style: GoogleFonts.leagueGothic(
                        color: Colors.white,
                        fontSize: responsive.isMobile()
                            ? responsive.width(6)
                            : responsive.width(20),
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
                        size: responsive.isMobile()
                            ? responsive.width(10)
                            : responsive.width(20),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: Handle cart action
                      },
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: responsive.isMobile()
                            ? responsive.width(10)
                            : responsive.width(20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.isMobile()
                  ? responsive.width(3)
                  : responsive.width(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2h 20m",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: responsive.isMobile()
                        ? responsive.width(8)
                        : responsive.width(5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: responsive.isMobile()
                ? responsive.width(20)
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
                  onPressed: () {
                    playVideo();
                  },
                  icon: Icon(
                    Icons.play_circle_outline_outlined,
                    color: Colors.white,
                    size: responsive.isMobile()
                        ? responsive.width(40)
                        : responsive.width(20),
                  ),
                ),
                if (isVideoVisible)
                  Center(
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: _videoController!.value.aspectRatio,
                          child: VideoPlayer(_videoController!),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (_videoController != null) {
                                      if (_videoController!.value.isPlaying) {
                                        stopVideo(); // Dừng video nếu đang phát
                                      } else {
                                        _videoController!
                                            .play(); // Phát video nếu đang dừng
                                      }
                                      setState(() {}); // Cập nhật lại giao diện
                                    }
                                  },
                                  icon: Icon(
                                    _videoController != null &&
                                            _videoController!.value.isPlaying
                                        ? Icons.pause // Hiển thị nút Stop
                                        : Icons.play_arrow, // Hiển thị nút Play
                                    color: Colors.white,
                                    size: responsive.isMobile()
                                        ? responsive.width(10)
                                        : responsive.width(20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: closeVideo,
                                  icon: Icon(Icons.close, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  buildCommentSection(),
              ],
              
            ),
          ),
          SizedBox(
            height: responsive.isMobile()
                ? responsive.width(20)
                : responsive.width(20),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: responsive.isMobile()
                  ? responsive.width(3)
                  : responsive.width(20),
            ),
            child: Row(
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
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: responsive.width(10)),

          // Phần hiển thị danh sách truyện
          stories == null
              ? Center(
                  child:
                      CircularProgressIndicator()) // Hiển thị khi chờ dữ liệu
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: stories!.map((story) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            // Hình ảnh chính
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                story['StoryImage'], // URL hình ảnh
                                height: responsive.isMobile()
                                    ? responsive.width(90)
                                    : responsive.width(50),
                                width: responsive.isMobile()
                                    ? responsive.width(60)
                                    : responsive.width(30),
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Nền mờ đen phía dưới
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.8),
                                      Colors.black.withOpacity(0.8),
                                    ],
                                  ),
                                  borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(15),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Tên phụ đề
                                    Text(
                                      story['StoryName'], // Tên truyện
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: responsive.isMobile()
                                            ? responsive.width(5)
                                            : responsive.width(3.5),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    // Tên chính (ví dụ: Tên phim hoặc tiêu đề phụ)
                                    Text(
                                      "Update: ${story['UpdateTime'] ?? "Không rõ"}", // Phụ đề
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: responsive.isMobile()
                                            ? responsive.width(4)
                                            : responsive.width(2.8),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ],
      ),
    );
  }
}
