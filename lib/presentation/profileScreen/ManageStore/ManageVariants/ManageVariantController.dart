import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/apiFunction.dart';
import 'package:swapnil_s_application4/data/add_product/saveVariantApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/deleteVariantApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/editVariantApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/getTempSellerVariantsApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/manageInventoryAndPriceSkuIdApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/manageVariantsApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/manageVariantsCollectionApiResModel.dart';
import 'package:swapnil_s_application4/core/constants.dart';
import 'package:http/http.dart' as http;

class ManageVariantController {
  /// Get Manage Variant
  Future<ManageVariantsApiResModel> getVariantData() async {
    ManageVariantsApiResModel manageVariantsApiResModel = ManageVariantsApiResModel();
    try {
      final response = await ApiFun.apiGet('user/get-admin-variants');
      manageVariantsApiResModel = ManageVariantsApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Get All Variants Api Error: $e');
    }
    return manageVariantsApiResModel;
  }

  /// Get All Combination
  Future<ManageInventorySkuidPriceApiResModel> getAllCombinationValues(productId) async {
    ManageInventorySkuidPriceApiResModel manageInventorySkuidPriceApiResModel = ManageInventorySkuidPriceApiResModel(combinations: []);
    try {
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
        debugPrint('API Response: $result');
        manageInventorySkuidPriceApiResModel = ManageInventorySkuidPriceApiResModel.fromJson(result);
      } else {
        debugPrint('API Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint('Get All Combination Api Error: $e');
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
      var request = http.Request('POST', Uri.parse("${AppConstants.baseUrl}user/save-variant-value"));
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
  Future<DeleteVariantApiResModel> deleteVariantValue(productID) async {
    DeleteVariantApiResModel deleteVariantApiResModel = DeleteVariantApiResModel();
    try {
      var headers = {
        'token': AppConstants.token
      };
      var request = http.Request('DELETE', Uri.parse('${AppConstants.baseUrl}user/delete-temp-seller-variants/$productID'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var responseData = await response.stream.toBytes();

      String responseString = String.fromCharCodes(responseData);

      final jsonData = jsonDecode(responseString);

      deleteVariantApiResModel = DeleteVariantApiResModel.fromJson(jsonData);

      /*if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }*/

    } catch (e) {
      debugPrint('Delete Variant Value: $e');
    }
    return deleteVariantApiResModel;
  }
}