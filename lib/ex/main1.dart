import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:movie2/helper/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List? categories; // Dữ liệu của "theloai"
  List? gallery; // Dữ liệu của "gallery"
  List? latestUpdates; // Dữ liệu của "moicapnhat"
  List? hotStories; // Dữ liệu của "truyenhot"

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio()
          .get('https://api.jsonbin.io/v3/b/682b02398561e97a50172628');
      if (response.statusCode == 200) {
        setState(() {
          var data = response.data['record']['data'];
          categories = data['theloai'];
          gallery = data['gallery'];
          latestUpdates = data['moicapnhat'];
          hotStories = data['truyenhot'];
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Danh Sách Nội Dung',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: categories == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hiển thị danh sách thể loại
                  _buildCategorySection(responsive),

                  // Hiển thị Gallery
                  _buildGallerySection(),

                  // Hiển thị danh sách truyện mới cập nhật
                  _buildLatestUpdatesSection(),

                  // Hiển thị danh sách truyện hot
                  _buildHotStoriesSection(),
                ],
              ),
            ),
    );
  }

  Widget _buildCategorySection(ResponsiveUtil responsive) {
    return ExpansionTile(
      title: const Text(
        "Thể Loại Truyện",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      children: categories!.map((category) {
        return ListTile(
          title: Text(category['TenTheLoai'] ?? "Thể loại không xác định"),
          subtitle: Text("Số truyện: ${category['Truyen']?.length ?? 0}"),
        );
      }).toList(),
    );
  }

  Widget _buildGallerySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Gallery",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: gallery!.map((item) {
              return Card(
                child: Column(
                  children: [
                    Image.network(item['Image'], width: 100, height: 100),
                    Text(item['TenTruyen']),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildLatestUpdatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Truyện Mới Cập Nhật",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ...latestUpdates!.map((story) {
          return ListTile(
            leading: Image.network(story['StoryImage'], width: 50, height: 50),
            title: Text(story['StoryName']),
            subtitle: Text("Chương mới nhất: ${story['StoryTitleLastChap']}"),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildHotStoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Truyện Hot",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ...hotStories!.map((story) {
          return ListTile(
            leading: Image.network(story['StoryImage'], width: 50, height: 50),
            title: Text(story['StoryName']),
            subtitle: Text("Lượt xem: ${story['StoryView']}"),
          );
        }).toList(),
      ],
    );
  }
}
