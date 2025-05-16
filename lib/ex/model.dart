class Truyen {
  final String storyImage;
  final String storyName;
  final String storyTitleLastChap;
  final String storyUpdateTime;
  final String storyAuthor;
  final int storyView;

  Truyen({
    required this.storyImage,
    required this.storyName,
    required this.storyTitleLastChap,
    required this.storyUpdateTime,
    required this.storyAuthor,
    required this.storyView,
  });

  factory Truyen.fromJson(Map<String, dynamic> json) {
    return Truyen(
      storyImage: json['StoryImage'],
      storyName: json['StoryName'],
      storyTitleLastChap: json['StoryTitleLastChap'],
      storyUpdateTime: json['StoryUpdateTime'],
      storyAuthor: json['StoryAuthor'],
      storyView: json['StoryView'],
    );
  }
}

class TheLoai {
  final String tenTheLoai;
  final List<Truyen> truyen;

  TheLoai({required this.tenTheLoai, required this.truyen});

  factory TheLoai.fromJson(Map<String, dynamic> json) {
    return TheLoai(
      tenTheLoai: json['TenTheLoai'],
      truyen: (json['Truyen'] as List)
          .map((truyenJson) => Truyen.fromJson(truyenJson))
          .toList(),
    );
  }
}

class DataResponse {
  final List<TheLoai> theloai;

  DataResponse({required this.theloai});

  factory DataResponse.fromJson(Map<String, dynamic> json) {
    return DataResponse(
      theloai: (json['theloai'] as List)
          .map((theLoaiJson) => TheLoai.fromJson(theLoaiJson))
          .toList(),
    );
  }
}
