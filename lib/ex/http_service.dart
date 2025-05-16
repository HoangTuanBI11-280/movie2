import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  final baseUrl = "https://reqres.in/";
  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initializeInterceptors();
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;

    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
      // TODO
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException error, handler) {
        print(error.message);
      },
      onRequest: (options, handler) {
        print("Request: ${options.method} ${options.path}");
      },
      onResponse: (response, handler) {
        print("Response: ${response.statusCode} ${response.data}");
      },
    ));
  }
}
