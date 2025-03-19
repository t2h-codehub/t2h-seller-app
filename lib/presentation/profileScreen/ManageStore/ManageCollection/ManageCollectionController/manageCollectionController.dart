import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/data/productCategoryModel/addCollectionApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageCollectionApiResModel.dart';

class ManageCollectionController {
   ManageCollectionApiResModel manageCollectionApiResModel =
      ManageCollectionApiResModel();
  /// Get Collection
  Future<ManageCollectionApiResModel> getAllCollection () async {
    ManageCollectionApiResModel manageCollectionApiResModel = ManageCollectionApiResModel();
    try {
      final response = await ApiFun.apiGet('user/get-seller-collections');
      
      manageCollectionApiResModel = ManageCollectionApiResModel.fromJson(response);
      
    } catch (e) {
      debugPrint('Collection Api Res Model: $e');
    }
    return manageCollectionApiResModel;
  }

  

  /// Add Collection
  Future<AddCollectionApiResModel> addCollection (body) async {
    AddCollectionApiResModel addCollectionApiResModel = AddCollectionApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('user/add-seller-collection', body);
      addCollectionApiResModel = AddCollectionApiResModel.fromJson(response);
      print("data");
      
    } catch (e) {
      debugPrint('Add Collection Api Error: $e');
    }
    return addCollectionApiResModel;
  }



  

   /// Add Collection
  Future<AddCollectionApiResModel> editCollection (body, collectionId) async {
    AddCollectionApiResModel addCollectionApiResModel = AddCollectionApiResModel();
    try {
      final response = await ApiFun.apiPutRequestWithBody('user/edit-seller-collection/${collectionId}', body);
      addCollectionApiResModel = AddCollectionApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Add Collection Api Error: $e');
    }
    return addCollectionApiResModel;
  }

   /// delete Collection
  Future<AddCollectionApiResModel> deleteCollection (String productId) async {
    AddCollectionApiResModel addCollectionApiResModel = AddCollectionApiResModel();
    try {
      final response = await ApiFun.apiDeleteWithParams('user/delete-seller-collection/${productId}');
      addCollectionApiResModel = AddCollectionApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Delete Collection Api Error: $e');
    }
    return addCollectionApiResModel;
  }

  Future<void> saveCollectionOrder() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  
  if (manageCollectionApiResModel.collections != null) {
    List<Map<String, dynamic>> jsonList = 
        manageCollectionApiResModel.collections!.map((e) => e.toJson()).toList();
    
    await prefs.setString('savedCollections', json.encode(jsonList));
  }
}

}