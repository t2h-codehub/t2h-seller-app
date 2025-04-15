import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/data/Orders/errorOrderDetailsApiResModel.dart';
import 'package:taptohello/data/Orders/getOrderListApiResModel.dart';
import 'package:taptohello/data/Orders/newOrderDetailsApiResModel.dart';
import 'package:http/http.dart' as http;
import 'package:taptohello/data/Orders/orderDetailsReviewModelAndStatusCode.dart';
import 'package:taptohello/data/productCategoryModel/awbshipmentApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/courierServiceRespModel.dart';
import 'package:taptohello/data/productCategoryModel/deliveryPickUpLocation.dart';
import 'package:taptohello/data/productCategoryModel/manualShipmentResponseModel.dart';


class OrderControllers with ChangeNotifier{

      DeliverypickuplocationApiResModel deliverypickuplocationApiResModel = DeliverypickuplocationApiResModel();
      ManualShipmentResponseModel manualShipmentResModel = ManualShipmentResponseModel();
      
      ShipmentResponse shipmentResponse = ShipmentResponse();
      PickupResponseModel pickupResponse = PickupResponseModel();
  /// Get new order list
    List<Map<String, dynamic>> availableCouriers = [];
     List<Map<String, dynamic>> availableAWB = [];
      List<Map<String, dynamic>> orderDetailData = [];
     String? shipmentId;

      NewOrderDetailsApiResModel newOrderDetailsApiResModel = NewOrderDetailsApiResModel();
  ErrorOrderDetailsApiResModel errorOrderDetailsApiResModel = ErrorOrderDetailsApiResModel();
  Order order = Order();

   
    Future<PickupResponseModel> createPickupAndGenerateAwb(body) async {
      print("createPickupAndGenerateAwb ${body}");
    
    try {
      final response = await ApiFun.apiRequestHttpRawBody('deliveryLogistic/create-pickup-and-generate-awb', body);
      
   //pickupResponse = PickupResponse.fromJson(response);
     
   if (response.statusCode == 200 || response.statusCode == 201) {
    pickupResponse = PickupResponseModel.fromJson(jsonDecode(response.body));
  } else {
    // pickupResponse = PickupResponseModel.fromJson(jsonDecode(response));
    debugPrint('API Error: ${response.statusCode} - ${response.body}');
  }
  
    } catch (e) {
      
      debugPrint('Change User Name Api Error: $e');
    }
    notifyListeners();
    return pickupResponse;
  }

    Future<PickupResponseModel> trackOrder(body) async {
      print("track order ${body}");
    
    try {
      final response = await ApiFun.apiRequestHttpRawBody('deliveryLogistic/track-shipment', body);
      
   pickupResponse = PickupResponseModel.fromJson(response);
   print("track order ${response}");
  
    } catch (e) {
      debugPrint('Change User Name Api Error: $e');
    }
    notifyListeners();
    return pickupResponse;
  }

  Future<PickupResponseModel> updateOrder(context,body) async {
      print("update order ${body}");
    
    try {
      final response = await ApiFun.apiRequestHttpRawBody('deliveryLogistic/update-shipment', body);
      
   pickupResponse = PickupResponseModel.fromJson(response);
   print("update order ${response}");
  
    } catch (e) {
      debugPrint('Change User Name Api Error: $e');
    }
     if(pickupResponse.success == true){
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(pickupResponse.message.toString())),
  );
  }
    notifyListeners();
    return pickupResponse;
  }

  Future<PickupResponseModel> cancelShipment(context ,body) async {
      print("cancel order ${body}");
    
    try {
      final response = await ApiFun.apiRequestHttpRawBody('deliveryLogistic/cancel-shipment', body);
      
   pickupResponse = PickupResponseModel.fromJson(response);
   print("cancel order ${response}");
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(pickupResponse.message.toString())),
    
  );
  Navigator.pop(context); 
   Navigator.pop(context); 
  
    } catch (e) {
      debugPrint('Change User Name Api Error: $e');
    }
    
    notifyListeners();
    return pickupResponse;
  }

   Future<PickupResponseModel> cancelOrder(context ,orderId) async {
      print("cancel order ${orderId}");
    
    try {
      final response = await ApiFun.apiGet('customer/cancel-order/$orderId');
     // final response = await ApiFun.apiRequestHttpRawBody('deliveryLogistic/cancel-shipment/${orderId}');
      
   pickupResponse = PickupResponseModel.fromJson(response);
   print("cancel order ${response}");
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(pickupResponse.message.toString())),
    
  );
  Navigator.pop(context); 
  Navigator.pop(context); 
  
    } catch (e) {
      debugPrint('Change User Name Api Error: $e');
    }
    
    notifyListeners();
    return pickupResponse;
  }



  bool isLoading = false; // ✅ Add loading state

   Future<void> createShipment(Map<String, dynamic> body) async {
    try {
      print("request body ${body}");
      isLoading = true;
      notifyListeners();

      final response = await ApiFun.apiRequestHttpRawBody(
          'deliveryLogistic/create-shipment', body);
      shipmentResponse = ShipmentResponse.fromJson(response);

      availableCouriers = shipmentResponse.courierServiceResponse?.data?.availableCourierCompanies
              ?.map((courier) => courier.toJson())
              .toList() ?? [];
              
      shipmentId = shipmentResponse.shipmentId.toString();
      debugPrint("📦 Available Couriers: $availableCouriers");
    } catch (e) {
      debugPrint("⚠️ Error fetching couriers: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  String? getShipmentId() {
    return shipmentId;
  }

  


  //    Future<ShipmentResponse> createShipment(body) async {
  //   //ShipmentResponse deliveryshipmentApiResModel = ShipmentResponse();
  //   try {
  //     final response = await ApiFun.apiRequestHttpRawBody('deliveryLogistic/create-shipment', body);
  //     shipmentResponse = ShipmentResponse.fromJson(response);
   
  //   } catch (e) {
  //     debugPrint('Change User Name Api Error: $e');
  //   }
  //   return shipmentResponse;
  // }

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

  /// Add Product
  /// 
 
  

    /// Add Product
  Future<DeliverypickuplocationApiResModel> deliveryPickUpLogistic(body) async {
    try {
      final response = await ApiFun.apiRequestHttpRawBody('deliveryLogistic/pickup-location', body);
      deliverypickuplocationApiResModel = DeliverypickuplocationApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Change User Name Api Error: $e');
    }
    return deliverypickuplocationApiResModel;
  }

   Future<ManualShipmentResponseModel> manualShipmentApi(body) async {
    try {
      final response = await ApiFun.apiRequestHttpRawBody('deliveryLogistic/manual-shipment', body);
      manualShipmentResModel = ManualShipmentResponseModel.fromJson(response);
    } catch (e) {
      debugPrint('Change User Name Api Error: $e');
    }
    return manualShipmentResModel;
  }

    /// Add Product
  void printLongJson(Map<String, dynamic> jsonData) {
  String jsonString = jsonEncode(jsonData);
  const int chunkSize = 1000; // Adjust as needed
  for (int i = 0; i < jsonString.length; i += chunkSize) {
    print(jsonString.substring(i, i + chunkSize > jsonString.length ? jsonString.length : i + chunkSize));
  }
}




Future<OrderDetailsReviewModelAndStatusCode> getOrderDetails(Map<String, String> body) async {
  NewOrderDetailsApiResModel newOrderDetailsApiResModel = NewOrderDetailsApiResModel();
  ErrorOrderDetailsApiResModel errorOrderDetailsApiResModel = ErrorOrderDetailsApiResModel();
  Order? order;
  int statusCode = 0;

  try {
    debugPrint('Request Body: $body');
    debugPrint('Token: ${AppConstants.token}');

    var response = await http.post(
      Uri.parse('${AppConstants.baseUrl}customer/ordersSellerDetails'),
      headers: {
        'token': AppConstants.token,
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body,
    );

    statusCode = response.statusCode;
    String responseBody = response.body;

    debugPrint('Response Code: $statusCode');
    debugPrint('Response Body: $responseBody');

    if (responseBody.isNotEmpty) {
      var jsonData = jsonDecode(responseBody);

      
      

      if ((statusCode == 201 || statusCode == 200) && jsonData['order'] != null) {
  try {
    printLongJson(jsonData);
    order = Order.fromJson(jsonData['order']);
     
      // Attempt to parse Order
    debugPrint('Order fetched successfully.');
    
   
    newOrderDetailsApiResModel.order = order;
    newOrderDetailsApiResModel.message = jsonData['message'] ?? 'Success';
  } catch (e) {
    debugPrint('Error parsing Order JSON: $e');
  }
}

    } else {
      debugPrint('Empty response from server.');
    }
  } catch (e) {
    debugPrint('API Call Error: $e');
  }

  return OrderDetailsReviewModelAndStatusCode(
    newOrderDetailsApiResModel: newOrderDetailsApiResModel.order,
    errorOrderDetailsApiResModel: errorOrderDetailsApiResModel,
    statusCode: statusCode,
  );
}







}
