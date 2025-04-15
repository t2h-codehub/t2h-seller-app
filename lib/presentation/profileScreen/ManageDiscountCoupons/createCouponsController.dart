import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/data/productCategoryModel/getAllSellerDiscountCouponsResponceModel.dart';
import 'package:taptohello/data/productCategoryModel/getdiscountbyidResponceModel.dart';

class GetDiscountCoponsController{

  /// Add Product
  // Future<AppProductApiResModel> addSellerProduct(body) async {
  //   AppProductApiResModel appProductApiResModel = AppProductApiResModel();
  //   try {
  //     final response = await ApiFun.apiRequestHttpRawBody('user/add-seller-product', body);
  //     appProductApiResModel = AppProductApiResModel.fromJson(response);
  //   } catch (e) {
  //     debugPrint('Add seller product Api Error: $e');
  //   }
  //   return appProductApiResModel;
  // }

  /// Get Produuct
  Future<GetAllSellerDiscountCouponsResponceModel> getCouponsList() async {
 Map<String, String> body = {
  "page": "1",
  "limit": "10",
  "isActive": "true", // now it's a String
};

    GetAllSellerDiscountCouponsResponceModel getDiscountApiResModel = GetAllSellerDiscountCouponsResponceModel();
    try {
      final response = await ApiFun.apiGetRequestWithParams('discount/get-all-seller-discounts',body);
      getDiscountApiResModel = GetAllSellerDiscountCouponsResponceModel.fromJson(response);
     
    } 
    catch (e) {
      debugPrint('Get product list Api Error: $e');
    }
    return getDiscountApiResModel;
  }




  // Get Product details
  Future<GetAllSellerDiscountCouponsResponceModel> ToggleActiveStatus(sid) async {
    GetAllSellerDiscountCouponsResponceModel getDiscountApiResModel = GetAllSellerDiscountCouponsResponceModel();
    var headers = {
  'Token': AppConstants.token
};
var data = '''''';
var dio = Dio();
var response = await dio.request(
  '${AppConstants.baseUrl}discount/toggle-status/${sid}',
  options: Options(
    method: 'PATCH',
    headers: headers,
  ),
  data: data,
);

if (response.statusCode == 200) {
 getDiscountApiResModel = GetAllSellerDiscountCouponsResponceModel.fromJson(response.data);
}
else {
  print(response.statusMessage);
}
return getDiscountApiResModel;

  }


   static void printLongJson(String jsonString) {
    const int chunkSize = 1000; // Adjust as needed
    for (int i = 0; i < jsonString.length; i += chunkSize) {
      print(jsonString.substring(i, i + chunkSize > jsonString.length ? jsonString.length : i + chunkSize));
    }
  }

  Future<GetAllSellerDiscountCouponsResponceModel> createDiscountCoupons(body) async {
    
    
    GetAllSellerDiscountCouponsResponceModel _getAllSellerDiscountCouponsResponceModel = GetAllSellerDiscountCouponsResponceModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('discount/create-discount', body);
      _getAllSellerDiscountCouponsResponceModel = GetAllSellerDiscountCouponsResponceModel.fromJson(response);
    } catch (e) {
      debugPrint('Get product list Api Error: $e');
    }
    //notifyListeners();
    return _getAllSellerDiscountCouponsResponceModel;
  }

   Future<GetAllSellerDiscountCouponsResponceModel> updateDiscountCoupons(body, String? sId) async {
    
    GetAllSellerDiscountCouponsResponceModel _getAllSellerDiscountCouponsResponceModel = GetAllSellerDiscountCouponsResponceModel();
    // try {
    //   final response = await ApiFun.apiRequestHttpRawBody('discount/update-discount', body);
    //   _getAllSellerDiscountCouponsResponceModel = GetAllSellerDiscountCouponsResponceModel.fromJson(response);
    // } catch (e) {
    //   debugPrint('Get product list Api Error: $e');
    // }
    //notifyListeners();
    var headers = {
  'Token': AppConstants.token,
  'Content-Type': 'application/json'
};
// var data = json.encode({
//   "type": "FREE_SHIPPING",
//   "endDate": "2025-04-31",
//   "isCouponRequired": true,
//   "maxRedemptions": 10,
//   "freeShipping": true
// });

var dio = Dio();
var response = await dio.request(
  '${AppConstants.baseUrl}discount/update-discount/${sId}',
  options: Options(
    method: 'PATCH',
    headers: headers,
  ),
  data: body,
);

if (response.statusCode == 200) {
  print(json.encode(response.data));
   _getAllSellerDiscountCouponsResponceModel = GetAllSellerDiscountCouponsResponceModel.fromJson(response.data);
}
else {
  print(response.statusMessage);
}
    return _getAllSellerDiscountCouponsResponceModel;
  }

   Future<GetDiscountByIdResModel> getSellerDiscountById(id) async {
    
    
    GetDiscountByIdResModel getDiscountByIdResModel = GetDiscountByIdResModel();
    try {
      final response = await ApiFun.apiGet('discount/get-seller-discount/${id}');
      getDiscountByIdResModel = GetDiscountByIdResModel.fromJson(response);
    } catch (e) {
      debugPrint('Get product list Api Error: $e');
    }
    //notifyListeners();
    return getDiscountByIdResModel;
  }

  
  
}