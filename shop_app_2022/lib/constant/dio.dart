import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
        // headers: {
        //   "Content-Type": "application/json",
        // }
      ),
    );
  }

  static Future getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    String lang = "en",
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "lang": lang,
      "Authorization": token,
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future postData({
    required String url,
    Map<String, dynamic>? query,
    String lang = "en",
    required dynamic data,
    String? token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "lang": lang,
      "Authorization": token,
    };
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future putData({
    required String path,
    required String token,
    String lang = "en",
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "lang": lang,
      "Authorization": token,
    };
    return await dio.put(path, queryParameters: query, data: data);
  }
}
