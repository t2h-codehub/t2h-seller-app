import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/apiFunction.dart';
import 'package:swapnil_s_application4/core/constants.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/addProductApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/awsPhotoUploadApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/deleteProductApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/editProductApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/editProductListApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/getProductListApiResModel.dart';
import 'package:http/http.dart' as http;
import 'package:swapnil_s_application4/presentation/profileScreen/ManageStore/InstagramAuth/instagram_callback_response_model.dart';

class AddProductController{

  /// Add Product
  Future<AppProductApiResModel> addSellerProduct(body) async {
    AppProductApiResModel appProductApiResModel = AppProductApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('user/add-seller-product', body);
      appProductApiResModel = AppProductApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Add seller product Api Error: $e');
    }
    return appProductApiResModel;
  }

  /// Get Produuct
  Future<GetProductApiResModel> getProductList() async {
    GetProductApiResModel getProductApiResModel = GetProductApiResModel();
    try {
      final response = await ApiFun.apiGet('user/get-seller-products');
      getProductApiResModel = GetProductApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Get product list Api Error: $e');
    }
    return getProductApiResModel;
  }

  /// AWS Photo upload
  Future<AWSFileUploadApiResModel> getDocumentUpload(body) async {
    AWSFileUploadApiResModel awsFileUploadApiResModel = AWSFileUploadApiResModel();
    debugPrint('My body is: $body');
    try {
      var request = http.MultipartRequest('POST', Uri.parse('${AppConstants.baseUrl}upload'));
      request.files.add(await http.MultipartFile.fromPath('file', '$body'));
      http.StreamedResponse response = await request.send();
      // debugPrint('My sghdvfsdfhsdbf  is: ${response.}');
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        // debugPrint('My sghdvfsdfhsdbf  is: ${jsonResponse}');
        awsFileUploadApiResModel = AWSFileUploadApiResModel.fromJson(jsonResponse);
      }
    } catch (e) {
      debugPrint('AWS Photo Upload Api Error: $e');
    }
    return awsFileUploadApiResModel;
  }

  /// Get Product details
  Future<EditProductApiResModel> getProductDetails(userId, productId) async {
    EditProductApiResModel editProductApiResModel = EditProductApiResModel();
    String url = "user/get-seller-product-details/$userId/$productId";
    try {
      final response = await ApiFun.apiGet(url);
      editProductApiResModel = EditProductApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('My get product details api Error: $e');
    }
    return editProductApiResModel;
  }

  /// Delete Product
  Future<DeleteProductApiResModel> deleteProduct(productId) async {
    debugPrint('My Product id delete is: $productId');
    DeleteProductApiResModel deleteProductApiResModel = DeleteProductApiResModel();
    try {
      final response = await ApiFun.apiDeleteWithParams('user/delete-seller-product/$productId');
      deleteProductApiResModel = DeleteProductApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('My delete Product Api Is: $e');
    }
    return deleteProductApiResModel;
  }

  /// Edit category
  Future<EditProductDetailsApiResModel> editProduct(productId, body) async {
    debugPrint('My Final edit body list is: $productId');
    debugPrint('My Final edit body list is: $body');
    EditProductDetailsApiResModel editProductDetailsApiResModel = EditProductDetailsApiResModel();
    try {
      final response = await ApiFun.apiPutRequestWithBody('user/edit-seller-product/$productId', body);
      editProductDetailsApiResModel = EditProductDetailsApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Edit Product Details Api Error: $e');
    }
    return editProductDetailsApiResModel;
  }


  Future<void> handleInstagramCallback(BuildContext context, String response) async {
    try {
      final InstagramCallbackResponse callbackResponse = InstagramCallbackResponse.fromJson(jsonDecode(response));
      // Now you can use the 'code' from the callback response to fetch the access token.
      final InstagramAccessToken accessToken = await _fetchInstagramAccessToken(callbackResponse.code);
      // Use the access token to fetch user data or products.
      final InstagramUserData userData = await _fetchInstagramUserData(accessToken.accessToken);
      // Save the user data or products to your application's state or database.
    } catch (e) {
      // Handle any errors that occur during the callback response handling.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error handling Instagram callback: $e')),
      );
    }
  }

}

class InstagramAccessToken {
  final String accessToken;

  InstagramAccessToken({required this.accessToken});
}

class InstagramUserData {
  final String id;
  final String username;
  // Add other fields as needed.

  InstagramUserData({required this.id, required this.username});
}

Future<InstagramAccessToken> _fetchInstagramAccessToken(String code) async {
  final response = await http.post(
    Uri.parse('https://graph.instagram.com/access_token'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'client_id': '1035382131630572',
      'client_secret': 'YOUR_CLIENT_SECRET',
      'grant_type': 'authorization_code',
      'redirect_uri': '${AppConstants.baseUrl}user/auth/instagram/callback',
      'code': code,
    }),
  );

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    return InstagramAccessToken(accessToken: jsonResponse['access_token']);
  } else {
    throw Exception('Failed to fetch Instagram access token');
  }
}

Future<InstagramUserData> _fetchInstagramUserData(String accessToken) async {
  final response = await http.get(
    Uri.parse('https://graph.instagram.com/me?fields=id,username&access_token=$accessToken'),
  );

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    return InstagramUserData(id: jsonResponse['id'], username: jsonResponse['username']);
  } else {
    throw Exception('Failed to fetch Instagram user data');
  }
}