import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:movie2/widget/other/ex1ex.dart' as data;

class MovieProvider extends ChangeNotifier {
  static const apiEndpoint = 'https://api.jsonbin.io/v3/b/6833e0168960c979a5a12517';

  bool isLoading = true;
  String error = '';
  data.Response responseData = data.Response(
    record: data.Record(success: true, data: data.Data(theloai: [], trending: [], vid: [], comingSoon: [])),
    metadata: data.Metadata(id: '', isPrivate: false, createdAt: ''),
  );

  List<data.Category> filteredCategories = [];
  String searchText = '';

  // Lấy dữ liệu từ API
  Future<void> getDataFromAPI() async {
    try {
      Response response = await http.get(Uri.parse(apiEndpoint));
      if (response.statusCode == 200) {
        responseData = data.responseFromJson(response.body);
      } else {
        error = "HTTP error ${response.statusCode}";
      }
    } catch (e) {
      error = "Error: $e";
    }
    isLoading = false;
    updateFilteredCategories();
  }

  // Cập nhật danh sách thể loại đã lọc dựa trên tìm kiếm
  void updateFilteredCategories() {
    filteredCategories.clear();
    if (searchText.isEmpty) {
      filteredCategories.addAll(responseData.record.data.theloai);
    } else {
      filteredCategories.addAll(
        responseData.record.data.theloai.where((category) =>
            category.tenTheLoai.toLowerCase().contains(searchText.toLowerCase())),
      );
    }
    notifyListeners();
  }

  // Tìm kiếm thể loại
  void search(String search) {
    searchText = search;
    updateFilteredCategories();
  }
}
