import 'dart:convert';

// Hàm chuyển đổi JSON
Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());

// Biểu diễn toàn bộ JSON
class Response {
  final Record record;
  final Metadata metadata;

  Response({required this.record, required this.metadata});

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        record: Record.fromJson(json["record"]),
        metadata: Metadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "record": record.toJson(),
        "metadata": metadata.toJson(),
      };
}

// Chứa phần "record"
class Record {
  final bool success;
  final Data data;

  Record({required this.success, required this.data});

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

// Chứa phần dữ liệu chính
class Data {
  final List<Category> theloai;
  final List<Trending> trending;
  final List<ComingSoon> comingSoon;
  final List<Video> vid;

  Data({
    required this.theloai,
    required this.trending,
    required this.comingSoon,
    required this.vid,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        theloai: List<Category>.from(
            json["theloai"].map((x) => Category.fromJson(x))),
        trending: List<Trending>.from(
            json["Trending"].map((x) => Trending.fromJson(x))),
        comingSoon: List<ComingSoon>.from(
            json["Coming Soon"].map((x) => ComingSoon.fromJson(x))),
        vid: List<Video>.from(json["Vid"].map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "theloai": List<dynamic>.from(theloai.map((x) => x.toJson())),
        "Trending": List<dynamic>.from(trending.map((x) => x.toJson())),
        "Coming Soon": List<dynamic>.from(comingSoon.map((x) => x.toJson())),
        "Vid": List<dynamic>.from(vid.map((x) => x.toJson())),
      };
}

// Chứa thông tin thể loại
class Category {
  final String tenTheLoai;
  final String? moTa;
  final String id;
  final List<Story> truyen;

  Category({
    required this.tenTheLoai,
    this.moTa,
    required this.id,
    required this.truyen,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        tenTheLoai: json["TenTheLoai"],
        moTa: json["MoTa"],
        id: json["ID"],
        truyen: List<Story>.from(json["Truyen"].map((x) => Story.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "TenTheLoai": tenTheLoai,
        "MoTa": moTa,
        "ID": id,
        "Truyen": List<dynamic>.from(truyen.map((x) => x.toJson())),
      };
}

// Chứa thông tin một truyện
class Story {
  final String storyImage;
  final String storyName;
  final String numberofepisodes;
  final String updateTime;
  final String author;
  final String nameK;
  final int view;

  Story({
    required this.storyImage,
    required this.storyName,
    required this.numberofepisodes,
    required this.updateTime,
    required this.author,
    required this.nameK,
    required this.view,
  });

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        storyImage: json["StoryImage"],
        storyName: json["StoryName"],
        numberofepisodes: json["Numberofepisodes"],
        updateTime: json["UpdateTime"],
        author: json["Author"],
        nameK: json["NameK"],
        view: json["View"],
      );

  Map<String, dynamic> toJson() => {
        "StoryImage": storyImage,
        "StoryName": storyName,
        "Numberofepisodes": numberofepisodes,
        "UpdateTime": updateTime,
        "Author": author,
        "NameK": nameK,
        "View": view,
      };
}

// Chứa thông tin phần "Trending"
class Trending {
  final String type;
  final String id;
  final List<Movie> movie;

  Trending({
    required this.type,
    required this.id,
    required this.movie,
  });

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
        type: json["Type"],
        id: json["ID"],
        movie: List<Movie>.from(json["Movie"].map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "ID": id,
        "Movie": List<dynamic>.from(movie.map((x) => x.toJson())),
      };
}

// Lớp Movie
class Movie {
  final String image;
  final String name;
  final String nameK;

  Movie({
    required this.image,
    required this.name,
    required this.nameK,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        image: json["Image"],
        name: json["Name"],
        nameK: json["NameK"],
      );

  Map<String, dynamic> toJson() => {
        "Image": image,
        "Name": name,
        "NameK": nameK,
      };
}

// Lớp ComingSoon
class ComingSoon {
  final String id;
  final List<Coming> coming;

  ComingSoon({
    required this.id,
    required this.coming,
  });

  factory ComingSoon.fromJson(Map<String, dynamic> json) => ComingSoon(
        id: json["ID"],
        coming: List<Coming>.from(json["Coming"].map((x) => Coming.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Coming": List<dynamic>.from(coming.map((x) => x.toJson())),
      };
}

// Lớp Coming
class Coming {
  final String image;
  final String name;

  Coming({required this.image, required this.name});

  factory Coming.fromJson(Map<String, dynamic> json) => Coming(
        image: json["Image"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Image": image,
        "Name": name,
      };
}

// Lớp Video
class Video {
  final String video;
  final String videoName;
  final String videoID;
  final String videoUpdate;
  final String author;

  Video({
    required this.video,
    required this.videoName,
    required this.videoID,
    required this.videoUpdate,
    required this.author,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        video: json["Video"],
        videoName: json["VideoName"],
        videoID: json["VideoID"],
        videoUpdate: json["VideoUpdate"],
        author: json["Author"],
      );

  Map<String, dynamic> toJson() => {
        "Video": video,
        "VideoName": videoName,
        "VideoID": videoID,
        "VideoUpdate": videoUpdate,
        "Author": author,
      };
}

// Lớp Metadata
class Metadata {
  final String id;
  final bool isPrivate;
  final String createdAt;

  Metadata({
    required this.id,
    required this.isPrivate,
    required this.createdAt,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        id: json["id"],
        isPrivate: json["private"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "private": isPrivate,
        "createdAt": createdAt,
      };
}
