 import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/data/delivery_OnboardModel/delivery_Onboard_RequestModel.dart';
import 'package:taptohello/data/delivery_OnboardModel/delivery_Onboard_ResponseModel.dart';
import 'package:taptohello/data/productCategoryModel/changeUsernameApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/logisticResModel.dart';

class LogisticsIntegrationControler {

   String? selectedCourier; 
    List<DeliveryOnboardApiResModel> deliveryOnboardApiResModel = <DeliveryOnboardApiResModel>[];

  
  

  final List<String> courierServices = ['shipRocket'];
   String? token;
  TextEditingController emailController =
      TextEditingController();
  TextEditingController passwordController =
      TextEditingController();
  TextEditingController orderIdController = TextEditingController();
  TextEditingController awbController = TextEditingController();
  //final formKey = GlobalKey<FormState>();
   GlobalKey<FormState> formKey = GlobalKey<FormState>(); 



  Future<Map<String, dynamic>?> loginToShiprocket() async {
    
    if (formKey.currentState != null &&
    formKey.currentState!.validate()) {
   

  final url = Uri.parse("https://apiv2.shiprocket.in/v1/external/auth/login");
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "email": emailController.text,
      "password": passwordController.text
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    token = data["token"]; // ✅ Save token
    return data; // ✅ Return full response data
  } else {
    return null; // Return null if login fails
  }
    }
    return null;
}




 /// Add Product
  Future<ChangeLogisticApiResModel> createLogistic(body) async {
    ChangeLogisticApiResModel changeLogisticApiResModel = ChangeLogisticApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('deliveryLogistic/create-Logistic', body);
      changeLogisticApiResModel = ChangeLogisticApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Change User Name Api Error: $e');
    }
    return changeLogisticApiResModel;
  }

Future<Map<String, dynamic>?> getDeliveryOnboard(DeliveryOnboard requestData) async {

  

  // Convert request data to query parameters
  Uri url = Uri.parse("${AppConstants.baseUrl}${AppConstants.deliveryOnboard}").replace(queryParameters: requestData.toJson());

  try {
    final response = await http.post(url, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    

    if (response.statusCode == 200) {
      // Parse the response
      final data = jsonDecode(response.body);
      deliveryOnboardApiResModel = data;
      print("Response: $data");
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
    }
  } catch (e) {
    print("Exception: $e");
  }
  return null;
}

  
     String? validateEmail(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  String? validatePassword(String? value, String fieldNam) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

   void showSnackbar(BuildContext? context,String message, {Color? color}) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message.toString()),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context!).clearSnackBars();
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context!).showSnackBar(snackBar);
    // TODO: implement showSnackbar
  }

   Future<void> createOrder() async {
    if (token == null) {
     // Fluttertoast.showToast(msg: "Please login first!");
      return;
    }

    final url =
        Uri.parse("https://apiv2.shiprocket.in/v1/external/orders/create/adhoc");
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "order_id": orderIdController.text,
        "order_date": "2024-01-29",
        "pickup_location": "Delhi Warehouse",
        "billing_customer_name": "John Doe",
        "billing_address": "123 Street, Delhi",
        "billing_city": "New Delhi",
        "billing_pincode": "110001",
        "billing_state": "Delhi",
        "billing_country": "India",
        "billing_email": "john@example.com",
        "billing_phone": "9999999999",
        "order_items": [
          {
            "name": "T-Shirt",
            "sku": "TSHIRT123",
            "units": 1,
            "selling_price": 500
          }
        ],
        "payment_method": "Prepaid",
        "sub_total": 500,
        "length": 10,
        "breadth": 10,
        "height": 5,
        "weight": 0.5
      }),
    );

    if (response.statusCode == 200) {
     // Fluttertoast.showToast(msg: "Order Created Successfully!");
    } else {
    // Fluttertoast.showToast(msg: "Order Creation Failed!");
    }
  }

  Future<void> trackOrder() async {
    if (token == null) {
     //.showToast(msg: "Please login first!");
      return;
    }

    final url = Uri.parse(
        "https://apiv2.shiprocket.in/v1/external/courier/track/awb/${awbController.text}");
    final response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
     // Fluttertoast.showToast(msg: "Tracking Details: ${data.toString()}");
    } else {
     // Fluttertoast.showToast(msg: "Tracking Failed!");
    }
  }

}