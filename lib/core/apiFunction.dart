import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:taptohello/core/constants.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';



class ApiFun {
  ApiFun._();

  static var header = {
    'Accept': 'application/json',
    "Authorization": 'Bearer ${AppConstants.token}',
  };


  /// api get function
  static Future<dynamic> apiGet(String endpoint) async {
    debugPrint('My token is: ${AppConstants.token}');
    http.Response response = await http.get(
      Uri.parse("${AppConstants.baseUrl}$endpoint"),
      headers: {
        "token": AppConstants.token,
      },
      
    );
    print("Bearer ${AppConstants.token}");
    print("test url. ${AppConstants.baseUrl}$endpoint");
    
    if (kDebugMode) {
      print('$endpoint Api Res ----: ${response.body}');
      printLongJson(response.body);
    }
   

    return jsonDecode(response.body.toString());
  }

  // Make this method static
  static void printLongJson(String jsonString) {
    const int chunkSize = 1000; // Adjust as needed
    for (int i = 0; i < jsonString.length; i += chunkSize) {
      print(jsonString.substring(i, i + chunkSize > jsonString.length ? jsonString.length : i + chunkSize));
    }
  }

  /// api post with body
  static Future<dynamic> apiPostWithBody(String endpoint, Map<String, dynamic> body) async {
    http.Response response = await http.post(
      Uri.parse("${AppConstants.baseUrl}$endpoint"),
      headers: {
        "token": AppConstants.token,
      },
      body: body,
    );
    if (kDebugMode) {
      print('$endpoint Api Res ----: ${response.body}');
    }
    return jsonDecode(response.body.toString());
  }

  static Future<dynamic> apiRequestHttpRawBody(String endpoint, Map<String, dynamic> body, {String method = "POST"}) async {
    // debugPrint('My api error is: $body');
    try {
      var headers = {
        "token": AppConstants.token,
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse("${AppConstants.baseUrl}$endpoint"));
      request.body = json.encode(body);
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      var responseData = await response.stream.toBytes();
      String responseString = String.fromCharCodes(responseData);
      final jsonData = jsonDecode(responseString);
      debugPrint('---- $endpoint Api response : $responseString');
      // debugPrint('---- Request body : ${request.body}');

      return jsonData;
    } catch (e) {
      debugPrint("Api error in $endpoint: $e");
    }
  }

  

  /// Api Put Request Function
  static Future<dynamic> apiPutRequestWithBody (String endpoint, Map<String, dynamic> body, {String method = "PUT"}) async {
    try {
      var headers = {
        "token": AppConstants.token,
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse("${AppConstants.baseUrl}$endpoint"));
      request.body = json.encode(body);
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      /*if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }*/

      var responseData = await response.stream.toBytes();
      String responseString = String.fromCharCodes(responseData);
      final jsonData = jsonDecode(responseString);
      debugPrint('---- $endpoint Api response : $responseString');
      // debugPrint('---- Request body : ${request.body}');

      return jsonData;
    } catch (e) {
      debugPrint("Api error in $endpoint: $e");
    }
  }


  /// Api get request with params
  static Future<dynamic> apiGetRequestWithParams(String endPoint, Map<String, String> body) async {
    Map<String, String> headerWithParams = {
      'Accept': 'application/json',
      "Authorization": 'Bearer ${AppConstants.token}',
    };
    headerWithParams.addAll(body);
    http.Response response = await http.get(Uri.parse("${AppConstants.baseUrl}$endPoint"), headers: headerWithParams);
    if (kDebugMode) {}

    return jsonDecode(response.body);
  }

  /// api post multi part body
  static Future<dynamic> apiPostMultipartBody(String fileParams, String endpoint) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse("${AppConstants.baseUrl}$endpoint"));
      // request.headers.addAll(header);
      // request.fields.addAll(body);

      request.files.add(await http.MultipartFile.fromPath('file', fileParams));

      // if (fileParams != "text_message") {
      //   request.files.add(await http.MultipartFile.fromPath(fileParams, fileName));
      // }

      http.StreamedResponse response = await request.send();

      String responseData = await response.stream.bytesToString();
      var jsonData = jsonDecode(responseData);

      debugPrint('---- uploadImage Res responseString: $jsonData');

      return jsonData;
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

   /// api post multi-part body with file and other data (such as JSON)
  static Future<dynamic> apiPostMultipartBody1(String fileParams, String endpoint, {Map<String, dynamic>? fields, String? fileFieldName}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse("${AppConstants.baseUrl}$endpoint"));

      // Add other fields (JSON data or form data) to the request
      if (fields != null) {
        fields.forEach((key, value) {
          request.fields[key] = value.toString();
        });
      }

      // Add the file
      if (fileParams.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(
          fileFieldName ?? 'file',  // Default file field name is 'file'
          fileParams,
          contentType: MediaType('image', 'jpeg'),  // Change contentType if needed
        ));
      }

      // Send the request
      http.StreamedResponse response = await request.send();

      // Get response data
      String responseData = await response.stream.bytesToString();
      var jsonData = jsonDecode(responseData);

      debugPrint('---- uploadImage Res responseString: $jsonData');

      return jsonData;
    } catch (e) {
      debugPrint("Error: $e");
      return null;
    }
  }

  /// api delete with params
  static Future<dynamic> apiDeleteWithParams(String endpoint) async {
    try {
      var headers = {
        'token': AppConstants.token
      };
      var request = http.Request('DELETE', Uri.parse("${AppConstants.baseUrl}$endpoint"));
      request.headers.addAll(headers);
      // request.fields.addAll(body);


      // if (fileParams != "text_message") {
      //   request.files.add(await http.MultipartFile.fromPath(fileParams, fileName));
      // }

      http.StreamedResponse response = await request.send();

      String responseData = await response.stream.bytesToString();
      var jsonData = jsonDecode(responseData);

      debugPrint('---- uploadImage Res responseString: $jsonData');

      return jsonData;
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}