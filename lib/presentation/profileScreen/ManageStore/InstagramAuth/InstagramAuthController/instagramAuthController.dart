import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taptohello/core/apiFunction.dart';

import '../../../../../data/productCategoryModel/getAddToProductApiResModel.dart';

class InstagramAuthController{

  /// Get Instagram Products add to products
  Future<InstagramProductResponse> getInstagramProductsToCart(body) async {
    InstagramProductResponse getProductToApiResModel = InstagramProductResponse();
    try {
      // Make API call
      final response = await ApiFun.apiPostWithBody('user/bulk-add-instagram-products', body);

      // Log raw response for debugging
      debugPrint('Raw API Response: $response');

      // Check if response is a string or JSON
      if (response != null && response.isNotEmpty) {
        try {
          // Try decoding the response as JSON
          final jsonResponse = jsonDecode(response);

          // Ensure jsonResponse is of Map<String, dynamic> type
          if (jsonResponse is Map<String, dynamic>) {
            getProductToApiResModel = InstagramProductResponse.fromJson(jsonResponse);
          } else {
            // If not a valid Map, log for debugging
            debugPrint('Response is not a valid JSON object.');
          }
        } catch (e) {
          // This block will catch if response is not JSON
          debugPrint('Failed to decode JSON: $e');
          // Handle the case where the response is just a string
          if (response is String) {
            getProductToApiResModel = InstagramProductResponse(
              success: false,
              message: response, // Store the raw string response as the message
            );
          }
        }
      } else {
        debugPrint('API response is empty or null.');
      }
    } catch (e) {
      debugPrint('Get Instagram Products API Error: $e');
    }
    return getProductToApiResModel;
  }

}