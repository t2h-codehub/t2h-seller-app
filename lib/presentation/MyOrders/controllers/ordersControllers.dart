import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/apiFunction.dart';
import 'package:swapnil_s_application4/core/constants.dart';
import 'package:swapnil_s_application4/data/Orders/errorOrderDetailsApiResModel.dart';
import 'package:swapnil_s_application4/data/Orders/getOrderListApiResModel.dart';
import 'package:swapnil_s_application4/data/Orders/newOrderDetailsApiResModel.dart';
import 'package:http/http.dart' as http;
import 'package:swapnil_s_application4/data/Orders/orderDetailsReviewModelAndStatusCode.dart';

class OrderControllers {
  /// Get new order list
  Future<GetOrderListApiResModel> getNewOrderList(body) async {
    GetOrderListApiResModel getOrderListApiResModel = GetOrderListApiResModel();
    try {
      final response =
          await ApiFun.apiRequestHttpRawBody('customer/ordersListSeller', body);
      getOrderListApiResModel = GetOrderListApiResModel.fromJson(response);
      debugPrint("My response isssss: ${getOrderListApiResModel.toJson()}");
    } catch (e) {
      debugPrint('get order list api error: $e');
    }
    return getOrderListApiResModel;
  }

  /// Get order details
  Future<OrderDetailsReviewModelAndStatusCode> getOrderDetails(body) async {
    NewOrderDetailsApiResModel newOrderDetailsApiResModel =
        NewOrderDetailsApiResModel();
    ErrorOrderDetailsApiResModel errorOrderDetailsApiResModel =
        ErrorOrderDetailsApiResModel();
    Order order = Order();
    int statusCode = 0;
    debugPrint('My body is: $body');
    debugPrint('My body is: ${AppConstants.token}');
    try {
      var headers = {
        'token': AppConstants.token,
        'Content-Type': 'application/json',
      };
      var request = http.Request('POST',
          Uri.parse('${AppConstants.baseUrl}customer/ordersSellerDetails'));
      request.body = jsonEncode(body);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      statusCode = response.statusCode;
      debugPrint('My api error is: ${response.statusCode}');

      var responseData = await response.stream.toBytes();
      String responseString = String.fromCharCodes(responseData);
      final jsonData = jsonDecode(responseString);

      // Debugging: Check the entire response JSON
      debugPrint('Response JSON: $jsonData');

      if (statusCode == 201 && jsonData != null) {
        debugPrint('Success');
        order = Order.fromJson(jsonData['order']);
      } else if (statusCode == 500) {
        debugPrint('Error');
        errorOrderDetailsApiResModel =
            ErrorOrderDetailsApiResModel.fromJson(jsonData);
      } else {
        debugPrint('Order seller details api error: $statusCode');
      }
    } catch (e) {
      debugPrint('New Order details API Error: $e');
    }
    return OrderDetailsReviewModelAndStatusCode(
        newOrderDetailsApiResModel: order,
        errorOrderDetailsApiResModel: errorOrderDetailsApiResModel,
        statusCode: statusCode);
  }
}
