import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/data/add_product/saveVariantApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/deleteVariantApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/editVariantApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/getTempSellerVariantsApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageInventoryAndPriceSkuIdApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageVariantsApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageVariantsCollectionApiResModel.dart';
import 'package:taptohello/core/constants.dart';
import 'package:http/http.dart' as http;

class ManageVariantController {
  List selectedImages = [];
  /// Get Manage Variant
  Future<ManageVariantsApiResModel> getVariantData() async {
    ManageVariantsApiResModel manageVariantsApiResModel = ManageVariantsApiResModel();
    try {
      final response = await ApiFun.apiGet('user/get-admin-variants');
      manageVariantsApiResModel = ManageVariantsApiResModel.fromJson(response);
      print("start");
      printLongJson(response);
      print("end");
    } catch (e) {
      debugPrint('Get All Variants Api Error: $e');
    }
    return manageVariantsApiResModel;
  }

   void printLongJson(Map<String, dynamic> jsonData) {
  String jsonString = jsonEncode(jsonData);
  const int chunkSize = 1000; // Adjust as needed
  for (int i = 0; i < jsonString.length; i += chunkSize) {
    print(jsonString.substring(i, i + chunkSize > jsonString.length ? jsonString.length : i + chunkSize));
  }
}

  /// Get All Combination
  Future<ManageInventorySkuidPriceApiResModel> getAllCombinationValues(productId) async {
    ManageInventorySkuidPriceApiResModel manageInventorySkuidPriceApiResModel = ManageInventorySkuidPriceApiResModel(combinations: []);
   // try {
      debugPrint('My access token is: ${AppConstants.token}');
      String uri = "${AppConstants.baseUrl}user/get-variant-combinations/$productId";
      http.Response response = await http.get(
        Uri.parse(uri),
        headers: {
          "token": AppConstants.token,
        },
      );
      if(response.statusCode == 200) {
        final result = jsonDecode(response.body);
        debugPrint('API Response akshay: $result');
        printLongJson(result);
        manageInventorySkuidPriceApiResModel = ManageInventorySkuidPriceApiResModel.fromJson(result);
      } else {
        debugPrint('API Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    // } catch (e) {
    //   debugPrint('Get All Combination Api Error: $e');
    // }
    return manageInventorySkuidPriceApiResModel;
  }

  /// Get All Combination
  // Future<ManageInventorySkuidPriceApiResModel> syncProductVariants(productId, bool isNew) async {
  //   ManageInventorySkuidPriceApiResModel manageInventorySkuidPriceApiResModel = ManageInventorySkuidPriceApiResModel(combinations: []);
  //  // try {
  //     debugPrint('My access token is: ${AppConstants.token}');
  //     String uri = "${AppConstants.baseUrl}user/sync-product-variants/$productId";
  //     http.Response response = await http.post(
  //       Uri.parse(uri),
  //       headers: {
  //         "token": AppConstants.token,
  //       },
  //     );
  //     if(response.statusCode == 200) {
  //       final result = jsonDecode(response.body);
  //       debugPrint('API Response: $result');
  //       printLongJson(result);
  //       manageInventorySkuidPriceApiResModel = ManageInventorySkuidPriceApiResModel.fromJson(result);
  //     } else {
  //       debugPrint('API Error: ${response.statusCode} - ${response.reasonPhrase}');
  //     }
  //   // } catch (e) {
  //   //   debugPrint('Get All Combination Api Error: $e');
  //   // }
  //   return manageInventorySkuidPriceApiResModel;
  // }

  Future<ManageInventorySkuidPriceApiResModel> syncProductVariants(String productId, bool isNew) async {
  var dio = Dio();
  ManageInventorySkuidPriceApiResModel manageInventorySkuidPriceApiResModel = ManageInventorySkuidPriceApiResModel();

  // Headers
  var headers = {
    'token': AppConstants.token,
    'Content-Type': 'application/json',
  };

  // Body
  var data = json.encode({
    "productId": productId,
    "isNew": isNew,
  });

  try {
    // API Call
    var response = await dio.request(
      '${AppConstants.baseUrl}user/sync-product-variants',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    // Handle Response
    if (response.statusCode == 200) {
      print('✅ Sync Product Variants Response: ${json.encode(response.data)}');

      // Map the response to your Model
      manageInventorySkuidPriceApiResModel = ManageInventorySkuidPriceApiResModel.fromJson(response.data);
    } else {
      print('Error: ${response.statusMessage}');
    }
  } catch (e) {
    print('Exception: $e');
  }

  return manageInventorySkuidPriceApiResModel;
}


  

  /// Add Variant Api
  Future<ManageVariantsCollectionApiResModel> addVariantValue(body) async {
    debugPrint('My final list is----: $body');
    ManageVariantsCollectionApiResModel manageVariantsCollectionApiResModel = ManageVariantsCollectionApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('user/add-temp-seller-variant', body);
      manageVariantsCollectionApiResModel = ManageVariantsCollectionApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Get All Combination Api: $e');
    }
    return manageVariantsCollectionApiResModel;
  }
  
  /// get Variant list with product id api
  Future<GetTempSellerVariantsApiResModel> getVariantValue(productId) async {
    GetTempSellerVariantsApiResModel getTempSellerVariantsApiResModel = GetTempSellerVariantsApiResModel();
    String url = "user/get-temp-seller-variants/$productId";
    try {
      final response = await ApiFun.apiGet(url);
      getTempSellerVariantsApiResModel = GetTempSellerVariantsApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Get All Variant Api: $e');
    }
    return getTempSellerVariantsApiResModel;
  }

  /// get save variant
  Future<GetSaveVariantApiResModel> getSaveVariant(body) async {
    GetSaveVariantApiResModel getSaveVariantApiResModel = GetSaveVariantApiResModel();
    debugPrint('My save variant body is: $body');
    debugPrint('My save variant body is: ${AppConstants.token}');
    try {
      // final response = await ApiFun.apiRequestHttpRawBody('user/save-variant-value', body);
      var headers = {
        "token": AppConstants.token,
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse("${AppConstants.baseUrl}user/update-variant-value"));
      request.body = json.encode(body);
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      var responseData = await response.stream.toBytes();
      String responseString = String.fromCharCodes(responseData);
      final jsonData = jsonDecode(responseString);
      debugPrint('----  user/save-variant-value Api response : $responseString');
      debugPrint('---- Request body : ${request.body}');

      // return jsonData;
      getSaveVariantApiResModel = GetSaveVariantApiResModel.fromJson(jsonData);
    } catch (e) {
      debugPrint('Get All Variant Api: $e');
    }
    return getSaveVariantApiResModel;
  }

  /// Edit variant value
  Future<EditVariantApiResModel> editVariant(objectId, body) async {
    EditVariantApiResModel editVariantApiResModel = EditVariantApiResModel();
    String url = "user/edit-temp-seller-variant/$objectId";
    try {
      final response = await ApiFun.apiPutRequestWithBody(url, body);
      editVariantApiResModel = EditVariantApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Edit Variant Api Error: $e');
    }
    return editVariantApiResModel;
  }

  /// Delete Variant Value
Future<DeleteVariantApiResModel> deleteVariantValue(String productID, Map<String, dynamic> body) async {
  DeleteVariantApiResModel deleteVariantApiResModel = DeleteVariantApiResModel();
  
  try {
    var headers = {
      'token': AppConstants.token,
      'Content-Type': 'application/json'
    };

    var request = http.Request(
      'DELETE', 
      Uri.parse('${AppConstants.baseUrl}user/delete-temp-seller-variants/$productID')
    );

    request.headers.addAll(headers);
    request.body = jsonEncode(body); // Corrected body assignment

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      final jsonData = jsonDecode(responseString);
      deleteVariantApiResModel = DeleteVariantApiResModel.fromJson(jsonData);
    } else {
      debugPrint('Delete Variant API Error: ${response.reasonPhrase}');
    }
    
  } catch (e) {
    debugPrint('Delete Variant Value Exception: $e');
  }

  return deleteVariantApiResModel;
}



}