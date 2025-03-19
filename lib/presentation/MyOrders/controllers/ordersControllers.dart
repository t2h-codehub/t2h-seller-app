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

  /// Get order details
//  Future<OrderDetailsReviewModelAndStatusCode> getOrderDetails(Map<String, String> body) async {
//   NewOrderDetailsApiResModel newOrderDetailsApiResModel = NewOrderDetailsApiResModel();
//   ErrorOrderDetailsApiResModel errorOrderDetailsApiResModel = ErrorOrderDetailsApiResModel();
//   Order order = Order();
//   int statusCode = 0;

//   debugPrint('My body is: $body');
//   debugPrint('My token is: ${AppConstants.token}');

//   try {
//     var headers = {
//       'token': AppConstants.token,
//       'Content-Type': 'application/x-www-form-urlencoded',
//     };

//     var request = http.Request(
//       'POST',
//       Uri.parse('${AppConstants.baseUrl}customer/ordersSellerDetails'),
//     );

//     // ✅ Correctly encode body for `application/x-www-form-urlencoded`
//     request.body = Uri(queryParameters: body).query;
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     // ✅ Convert stream to string ONCE
//     String responseBody = await response.stream.bytesToString();

//     // ✅ Log the response
//    // debugPrint('Status Code: ${response.statusCode}');
//    // debugPrint('Response Body: $responseBody');

//     statusCode = response.statusCode;

//     // ✅ Parse JSON only if response is not empty
//     var jsonData;
//     if (responseBody.isNotEmpty) {
//       try {
//         jsonData = jsonDecode(responseBody);
//         //debugPrint('Response JSON: $jsonData');
//         // print('Response JSON: $jsonData');
//         print("hi");
//         printLongJson(jsonData);
        
//       } catch (e) {
//         debugPrint('Error decoding JSON: $e');
//       }
//     }

    

//     // ✅ Process Response
//     if (statusCode == 201 && jsonData != null) {
//       debugPrint('Success');
//       order = Order.fromJson(jsonData['order']);
//     } else if (statusCode == 500) {
//       debugPrint('Server Error');
//       errorOrderDetailsApiResModel = ErrorOrderDetailsApiResModel.fromJson(jsonData);
//     } else {
//       debugPrint('Order seller details API error: $statusCode');
//     }
//   } catch (e) {
//     debugPrint('New Order details API Error: $e');
//   }

 


//   return OrderDetailsReviewModelAndStatusCode(
//     newOrderDetailsApiResModel: order,
//     errorOrderDetailsApiResModel: errorOrderDetailsApiResModel,
//     statusCode: statusCode,
//   );
// }

// Future<OrderDetailsReviewModelAndStatusCode> getOrderDetails(Map<String, String> body) async {
//   NewOrderDetailsApiResModel newOrderDetailsApiResModel = NewOrderDetailsApiResModel();
//   ErrorOrderDetailsApiResModel errorOrderDetailsApiResModel = ErrorOrderDetailsApiResModel();
//   Order order = Order();
//   int statusCode = 0;

//   debugPrint('Request Body: $body');
//   debugPrint('Token: ${AppConstants.token}');

//   try {
//     var response = await http.post(
//       Uri.parse('${AppConstants.baseUrl}customer/ordersSellerDetails'),
//       headers: {
//         'token': AppConstants.token,
//         'Content-Type': 'application/x-www-form-urlencoded',
//       },
//       body: body,
//     );

//     statusCode = response.statusCode;
//     String responseBody = response.body;

//     debugPrint('Response Code: $statusCode');
//     debugPrint('Response Body: $responseBody');

//     if (responseBody.isNotEmpty) {
//       try {
//         var jsonData = jsonDecode(responseBody);
//         printLongJson(jsonData); // Debugging large JSON output

//         if (statusCode == 201 && jsonData['order'] != null) {
//           print(jsonData['order']);
//           order = Order.fromJson(jsonData['order']);
//           debugPrint('Order Fetched Successfully');
//         } else if (statusCode == 500) {
//           errorOrderDetailsApiResModel = ErrorOrderDetailsApiResModel.fromJson(jsonData);
//           debugPrint('Server Error');
//         } else {
//           debugPrint('Unexpected API Response: $statusCode');
//         }
//       } catch (e) {
//         debugPrint('JSON Parsing Error: $e');
//       }
//     }
//   } catch (e) {
//     debugPrint('API Call Error: $e');
//   }

//   return OrderDetailsReviewModelAndStatusCode(
//     newOrderDetailsApiResModel: order,
//     errorOrderDetailsApiResModel: errorOrderDetailsApiResModel,
//     statusCode: statusCode,
//   );
// }

// Future<OrderDetailsReviewModelAndStatusCode> getOrderDetails(Map<String, String> body) async {
//   try {
//     // API Call
//     final response = await ApiFun.apiRequestHttpRawBody('customer/ordersSellerDetails', body);
//     debugPrint('API Response: $response'); // Debug response structure

//     // Check if response is valid
//     if (response != null && response is Map<String, dynamic>) {
//      // deliverypickuplocationApiResModel = DeliverypickuplocationApiResModel.fromJson(response);

//       // Parse 'order' safely
//       // if (response.containsKey('order')) {
//       //   order = Order.fromJson(response['order']);
//       //   debugPrint('Order Fetched Successfully: ${order.toJson()}');
//       // } else {
//       //   debugPrint('Error: "order" key not found in response.');
//       // }

// //       if (response.containsKey('order')) {
// //   var orderData = response['order'];
// //   debugPrint('Order Data: $orderData');
  
// //   try {
// //     order = Order.fromJson(orderData);
// //     debugPrint('Order Fetched Successfully: ${order.toJson()}');
// //   } catch (e) {
// //     debugPrint('Error Parsing Order Data: $e');
// //   }
// // } else {
// //   debugPrint('Order Key Missing in Response');
// // }

// if (response.containsKey('order')) {
//   var orderData = response['order'];
//   orderDetailData = orderData;
//    orderDetailData = orderData;
//   debugPrint('Order Data: $orderDetailData');  // Log the full data to verify structure
   
//   // try {
//      order = Order.fromJson(orderData);
//   //   debugPrint('Order Fetched Successfully: ${order.toJson()}');
//   // } catch (e) {
//   //   debugPrint('Error Parsing Order Data: $e');
//   // }
//   try {
//    // orderDetailData = orderData;
//     //newOrderDetailsApiResModel.order = orderDetailData;
//  // order = Order.fromJson(orderData);

//   debugPrint('Order Fetched Successfully: ${order.toJson()}');
// } catch (e, stackTrace) {
//   debugPrint('Error Parsing Order Data: $e');
//   debugPrint('Stack Trace: $stackTrace');
// }

// } else {
//   debugPrint('Order Key Missing in Response');
// }

//       newOrderDetailsApiResModel.order = newOrderDetailsApiResModel.order;
//       newOrderDetailsApiResModel.message = response['message'] ?? 'Success';
//     } else {
//       debugPrint('Error: API returned null or invalid format.');
//     }
//   } catch (e, stackTrace) {
//     debugPrint('API Call Error: $e');
//     debugPrint('Stack Trace: $stackTrace');
//   }

//   return OrderDetailsReviewModelAndStatusCode(
//     newOrderDetailsApiResModel: newOrderDetailsApiResModel.order,
//     errorOrderDetailsApiResModel: errorOrderDetailsApiResModel,
//     statusCode: newOrderDetailsApiResModel.order?.status ?? 0, // Default to 0 if null
//   );
// }


//  Future<OrderDetailsReviewModelAndStatusCode> getOrderDetails(Map<String, String> body) async {
//     try {
//       final response = await ApiFun.apiRequestHttpRawBody('customer/ordersSellerDetails', body);
//      // deliverypickuplocationApiResModel = DeliverypickuplocationApiResModel.fromJson(response);
//       order = Order.fromJson(response);
//           debugPrint('Order Fetched Successfully');
//           newOrderDetailsApiResModel.order = order;
//           newOrderDetailsApiResModel.message = response['message'] ?? 'Success';
//     } catch (e) {
//       debugPrint('Change User Name Api Error: $e');
//     }
//     // return newOrderDetailsApiResModel.order;
//       return OrderDetailsReviewModelAndStatusCode(
//     newOrderDetailsApiResModel: order,
//     errorOrderDetailsApiResModel: errorOrderDetailsApiResModel,
//     statusCode: newOrderDetailsApiResModel.order!.status,
//   );
//   }
//  Future<OrderDetailsReviewModelAndStatusCode> getOrderDetails(Map<String, String> body) async {

// //Future<Order?> getOrderDetails(Map<String, String> body) async {
//   try {
//     debugPrint('Request Body: $body');
//     debugPrint('Token: ${AppConstants.token}');

//     var response = await http.post(
//       Uri.parse('${AppConstants.baseUrl}customer/ordersSellerDetails'),
//       headers: {
//         'token': AppConstants.token,
//         'Content-Type': 'application/x-www-form-urlencoded',
//       },
//       body: body,
//     );

//     int statusCode = response.statusCode;
//     String responseBody = response.body;

//     debugPrint('Response Code: $statusCode');
//     debugPrint('Response Body: $responseBody');

//     if (statusCode == 201 && responseBody.isNotEmpty) {
//       var jsonData = jsonDecode(responseBody);
      
//       if (jsonData['order'] != null) {
//         printOrderDetails(order);
//          Order.fromJson(jsonData['order']);
//       } else {
//         debugPrint('Order data is missing in the response.');
//       }
//     } else {
//       debugPrint('Failed to fetch order details: ${jsonDecode(responseBody)['message']}');
//     }
//   } catch (e) {
//     debugPrint('API Error: $e');
//   }

//   return null; // Return null if order details couldn't be fetched
// }

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

      // if (statusCode == 201 && jsonData['order'] != null) {
      //   order = Order.fromJson(jsonData['order']);
      //   debugPrint('Order fetched successfully.');
      //   printOrderDetails(order); // Call after assignment
      //   newOrderDetailsApiResModel.order = order;
      //   newOrderDetailsApiResModel.message = jsonData['message'] ?? 'Success';
      // } else if (statusCode == 500) {
      //   errorOrderDetailsApiResModel = ErrorOrderDetailsApiResModel.fromJson(jsonData);
      //   debugPrint('Server Error: ${jsonData['message']}');
      // } else {
      //   debugPrint('Unexpected API Response: $statusCode');
      // }

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






// Future<OrderDetailsReviewModelAndStatusCode> getOrderDetails(Map<String, String> body) async {
//   NewOrderDetailsApiResModel newOrderDetailsApiResModel = NewOrderDetailsApiResModel();
//   ErrorOrderDetailsApiResModel errorOrderDetailsApiResModel = ErrorOrderDetailsApiResModel();
//   Order order = Order();
//   int statusCode = 0;

//   debugPrint('Request Body: $body');
//   debugPrint('Token: ${AppConstants.token}');

//   try {
//     var response = await http.post(
//       Uri.parse('${AppConstants.baseUrl}customer/ordersSellerDetails'),
//       headers: {
//         'token': AppConstants.token,
//         'Content-Type': 'application/x-www-form-urlencoded',
//       },
//       body: body,
//     );

//     statusCode = response.statusCode;
//     String responseBody = response.body;

//     debugPrint('Response Code: $statusCode');
//     debugPrint('Response Body: $responseBody');

//     if (responseBody.isNotEmpty) {
//       try {
//         var jsonData = jsonDecode(responseBody);
//         printLongJson(jsonData); // Debugging large JSON output

//         if (statusCode == 201 && jsonData['order'] != null) {
//           order = Order.fromJson(jsonData['order']);
//           debugPrint('Order Fetched Successfully');
//           newOrderDetailsApiResModel.order = order;
//           newOrderDetailsApiResModel.message = jsonData['message'] ?? 'Success';
//         } else if (statusCode == 500) {
//           errorOrderDetailsApiResModel = ErrorOrderDetailsApiResModel.fromJson(jsonData);
//           debugPrint('Server Error: ${jsonData['message']}');
//         } else {
//           debugPrint('Unexpected API Response: $statusCode');
//         }
//       } catch (e) {
//         debugPrint('JSON Parsing Error: $e');
//       }
//     } else {
//       debugPrint('Empty response from server.');
//     }
//   } catch (e) {
//     debugPrint('API Call Error: $e');
//   }

//   return OrderDetailsReviewModelAndStatusCode(
//     newOrderDetailsApiResModel: newOrderDetailsApiResModel.order,
//     errorOrderDetailsApiResModel: errorOrderDetailsApiResModel,
//     statusCode: statusCode,
//   );
// }

//   return OrderDetailsReviewModelAndStatusCode(
//     newOrderDetailsApiResModel: order,
//     errorOrderDetailsApiResModel: errorOrderDetailsApiResModel,
//     statusCode: statusCode,
//   );


}
