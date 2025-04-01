
import 'package:flutter/material.dart';

import 'package:taptohello/core/apiFunction.dart';

import 'package:taptohello/data/productCategoryModel/addBannerApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/addRibbonInfoResponceModel.dart';
import 'package:taptohello/data/productCategoryModel/customRibbonInfoResponceModel';


class Addlinkcontroller {
  





  void printLongJson(String jsonString) {
  const int chunkSize = 1000; // Adjust as needed
  for (int i = 0; i < jsonString.length; i += chunkSize) {
    print(jsonString.substring(i, i + chunkSize > jsonString.length ? jsonString.length : i + chunkSize));
  }
}
  



  Future<CustomRibbonInfoResponceModel> getCustomRibbonInfo() async {
    CustomRibbonInfoResponceModel getCustomRibbonInfo = CustomRibbonInfoResponceModel();
    try {
      final response = await ApiFun.apiGet('user/get-custom-ribbonInfo');
      getCustomRibbonInfo = CustomRibbonInfoResponceModel.fromJson(response);
    } catch (e) {
      debugPrint('Get product list Api Error: $e');
    }
    //notifyListeners();
    return getCustomRibbonInfo;
  }

   Future<AddCustomRibbonInfo> addCustomRibbonInfo(body) async {
    AddCustomRibbonInfo addRibbonInfo = AddCustomRibbonInfo();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('user/add-custom-ribbonInfo', body);
      addRibbonInfo = AddCustomRibbonInfo.fromJson(response);
    } catch (e) {
      debugPrint('Get product list Api Error: $e');
    }
    //notifyListeners();
    return addRibbonInfo;
  }

   Future<CustomRibbonInfoResponceModel> deleteCustomRibbonInfo(sid) async {
    CustomRibbonInfoResponceModel getCustomRibbonInfo = CustomRibbonInfoResponceModel();
    try {
      final response = await ApiFun.apiDeleteWithParams('user/delete-custom-ribbon/${sid}');
      getCustomRibbonInfo = CustomRibbonInfoResponceModel.fromJson(response);
    } catch (e) {
      debugPrint('Get product list Api Error: $e');
    }
    //notifyListeners();
    return getCustomRibbonInfo;
  }

  

  







}



