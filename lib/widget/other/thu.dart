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
  String? videoUrl;
  VideoPlayerController? _videoController;
  bool isVideoVisible = false;

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  void fetchImages() async {
    try {
      var response = await Dio()
          .get('https://api.jsonbin.io/v3/b/6833e0168960c979a5a12517');
      if (response.statusCode == 200) {
        setState(() {
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
    }
  }

  void closeVideo() {
    if (_videoController != null) {
      _videoController!.dispose();
      setState(() {
        _videoController = null;
        isVideoVisible = false;
      });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nút phát video
          IconButton(
            onPressed: playVideo,
            icon: Icon(
              Icons.play_circle_outline_outlined,
              color: Colors.white,
              size: responsive.isMobile()
                  ? responsive.width(40)
                  : responsive.width(20),
            ),
          ),

          // Hiển thị video nếu isVideoVisible = true
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
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => _videoController!.play(),
                            icon: Icon(Icons.play_arrow, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: stopVideo,
                            icon: Icon(Icons.pause, color: Colors.white),
                          ),
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
        ],
      ),
    );
  }
}
