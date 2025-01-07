import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/apiFunction.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/addCollectionApiResModel.dart';
import 'package:swapnil_s_application4/data/productCategoryModel/manageCollectionApiResModel.dart';

class ManageCollectionController {

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
    } catch (e) {
      debugPrint('Add Collection Api Error: $e');
    }
    return addCollectionApiResModel;
  }
}