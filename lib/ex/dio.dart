import 'package:dio/dio.dart';

final dio = Dio();

void getHttp() async {
  try {
    final response = await dio.get('https://dart.dev');
    print(response.data);
  } catch (e) {
    print("Error: $e");
  }
}

void main() {
  getHttp();
}
