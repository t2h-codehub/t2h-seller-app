// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'package:swapnil_s_application4/core/constants.dart';
import 'package:swapnil_s_application4/core/exceptions.dart';
import 'package:swapnil_s_application4/core/utils/logger.dart';

class ApiClient {
  static const String TOP_HEADLINES = 'top-headlines';

  final Dio dio = Dio();

  ApiClient() {
    // dio.options.baseUrl = Environment.value.baseUrl!;
    dio.options.connectTimeout = const Duration(minutes: 3).inMilliseconds;
    dio.options.receiveTimeout = const Duration(minutes: 3).inMilliseconds;
    // if (Environment.value.environmentType != EnvType.PRODUCTION) {
    //   dio.interceptors.add(
    //     PrettyDioLogger(
    //       requestHeader: true,
    //       requestBody: true,
    //       responseHeader: true,
    //       responseBody: false,
    //     ),
    //   );
    // }

    // data.headers['Cookie'] = "jwt=" + AppConstants.AUTH_TOKEN;
  }

  Future<Response<Map<String, dynamic>>> post(
    String path,
    dynamic data,
  ) async {
    try {
      Logger.write(data);
      print(AppConstants.token);
      print(data);

      return await dio.post(path,
          data: data,
          options: Options(headers: {
            "token": "${AppConstants.token}",
            "userId": "${AppConstants.userId}"
          }));
    } on DioError catch (e) {
      print(e.toString());

      throw ApiException(e.response!.data["message"].toString());
    }
  }

  Future<Response<Map<String, dynamic>>> put(String path, dynamic data) async {
    try {
      print(AppConstants.token);
      print(data);
      return await dio.put(path,
          data: data,
          options: Options(headers: {
            "token": "${AppConstants.token}",
            "userId": "${AppConstants.userId}"
          }));
    } on DioError catch (e) {
      print(e.toString());

      throw ApiException(e.response!.data["message"].toString());
    }
  }

  Future<Response<Map<String, dynamic>>> patch(
      String path, dynamic data) async {
    try {
      print(AppConstants.token);
      print(data);
      return await dio.patch(path,
          data: data,
          options: Options(headers: {
            "token": "${AppConstants.token}",
            "userId": "${AppConstants.userId}"
          }));
    } on DioError catch (e) {
      print(e.toString());

      throw ApiException(e.response!.data["message"].toString());
    }
  }

  Future<Response<Map<String, dynamic>>> delete(String path) async {
    try {
      print(AppConstants.token);
      return await dio.delete(path,
          options: Options(headers: {
            "token": "${AppConstants.token}",
            "userId": "${AppConstants.userId}"
          }));
    } on DioError catch (e) {
      print(e.toString());

      throw ApiException(e.response!.data["message"].toString());
    }
  }

  Future<Response<Map<String, dynamic>>> get(String path) async {
    try {
      print(AppConstants.token);

      return await dio.get(path,
          options: Options(headers: {
            "token": "${AppConstants.token}",
            "userId": "${AppConstants.userId}"
          }));
    } on DioError catch (e) {
      print('My api error is: ${e.toString()}');

      throw ApiException(e.response!.data["message"].toString());
    }
  }
}

class MultiPartClient extends http.BaseClient {
  final http.Client _httpClient = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.persistentConnection = false;

    request.headers["Content-Type"] = "application/json";
    print(request.headers.toString());

    print(request.url.toString());
    // Future<http.StreamedResponse> response = _httpClient.send(request);
    // alice.onHttpClientRequest(request.)
    // debugPrint(request.url.toString());
    // alice.onHttpResponse(await http.Response.fromStream(await response));
    return _httpClient.send(request);
  }
}