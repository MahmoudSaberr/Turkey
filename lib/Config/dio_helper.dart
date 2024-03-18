import 'package:dio/dio.dart';
import 'package:pen/Config/constants.dart';

class DioHelper {
  static Dio? dio;
 // static const _baseUrl = 'https://translator-app-ic98.onrender.com/';
  static const _baseUrl = 'https://repo-4bdh.onrender.com/';

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    Response response;
    if (query != null && data == null) {
      response = await dio!.get('$_baseUrl$endPoint', queryParameters: query);
    } else if (data != null && query == null) {
      response = await dio!.get('$_baseUrl$endPoint', data: data);
    } else {
      response = await dio!.get('$_baseUrl$endPoint');
    }
    return response;
  }

  static Future<Response> delete({
    required String endPoint,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    Response response;
    if (query != null && data == null) {
      response = await dio!.delete('$_baseUrl$endPoint', queryParameters: query);
    } else if (data != null && query == null) {
      response = await dio!.delete('$_baseUrl$endPoint', data: data);
    } else {
      response = await dio!.delete('$_baseUrl$endPoint');
    }
    return response;
  }

  static Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? query,
      dynamic data,
       options}) async {
    Response response;
    if (data != null && query == null) {
      response = await dio!.post(
        '$_baseUrl$endPoint',
        data: data,
      );
    } else if (data == null && query != null) {
      response = await dio!.post(
        '$_baseUrl$endPoint',
        queryParameters: query,
      );
    } else if (options != null) {
      response = await dio!.post(
        '$_baseUrl$endPoint',
        data: data,
        options: options
      );
    } else {
      response = await dio!.post(
        '$_baseUrl$endPoint',
      );
    }
    return response;
  }

  static Future<Response> patch(
      {required String endPoint,
      Map<String, dynamic>? query,
      dynamic data,
      bool? redirection}) async {
    Response response;
    if (data != null && query == null) {
      response = await dio!.patch(
        '$_baseUrl$endPoint',
        data: data,
      );
    } else if (data == null && query != null) {
      response = await dio!.patch(
        '$_baseUrl$endPoint',
        queryParameters: query,
      );
    } else if (redirection != null) {
      response = await dio!.patch(
        '$_baseUrl$endPoint',
        data: data,
        options: Options(
          followRedirects: redirection,
        ),
      );
    } else {
      response = await dio!.patch(
        '$_baseUrl$endPoint',
      );
    }
    return response;
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  Future<String?> convertTextToSpeech(String text,) async {
    try {
      final response = await dio!.post(
        'https://api.play.ht/text-to-speech',
        data: {
          'text': text,
          'voice_id': 's3://voice-cloning-zero-shot/d9ff78ba-d016-47f6-b0ef-dd630f59414e/female-cs/manifest.json',
        },
        options: Options(
          headers: {'Authorization': 'Bearer $apiKeyPlayHT'},
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // استخراج رابط الصوت من الاستجابة
        return response.data['url'];
      } else {
        print('Failed to convert text to speech. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error converting text to speech: $e');
    }

    return null;
  }

}
