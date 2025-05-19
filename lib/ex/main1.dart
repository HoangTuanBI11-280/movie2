import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
  List? jsonList; // Danh sách truyện

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio().get('https://api.jsonbin.io/v3/b/682a9b598561e97a5016eda6');
      if (response.statusCode == 200) {
        setState(() {
          // Lấy danh sách các thể loại và truyện
          jsonList = response.data['record']['data']['theloai'];
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Danh Sách Thể Loại Truyện',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: jsonList == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: jsonList!.length,
              itemBuilder: (BuildContext context, int index) {
                var category = jsonList![index];
                return ExpansionTile(
                  title: Text(category['TenTheLoai'] ?? "Thể Loại Không Xác Định"),
                  children: (category['Truyen'] as List).map((story) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          story['StoryImage'],
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      title: Text(story['StoryName']),
                      subtitle: Text(story['StoryTitleLastChap']),
                    );
                  }).toList(),
                );
              },
            ),
    );
  }
}
