import 'package:flutter/material.dart';
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/data/productCategoryModel/addAttributesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/deleteAttributesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/manageAttributesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/savedAttributesApiResModel.dart';

class ManageAttributesController {

  /// Get All Attributes
  Future<ManageAttributesApiResModel> getAllAttributes () async {
    ManageAttributesApiResModel manageAttributesApiResModel = ManageAttributesApiResModel();
    try {
      final response = await ApiFun.apiGet('user/get-admin-attributes');
      manageAttributesApiResModel = ManageAttributesApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Get Attributes Api Error: $e');
    }
    return manageAttributesApiResModel;
  }

  /// Get Saved Attributes
  Future<SavedAttributesApiResModel> getAllSavedAttributes(productID) async {
    SavedAttributesApiResModel savedAttributesApiResModel = SavedAttributesApiResModel();
    try {
      final response = await ApiFun.apiGet('user/get-user-attributes/$productID');
      savedAttributesApiResModel = SavedAttributesApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Get Saved attributes error: $e');
    }
    return savedAttributesApiResModel;
  }

  /// Post Attributes
  Future<AddManageAttributesApiResModel> addManageAttributes(body) async {
    AddManageAttributesApiResModel addManageAttributesApiResModel = AddManageAttributesApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('user/save-seller-attribute', body);
      addManageAttributesApiResModel = AddManageAttributesApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Add Manage Attributes API Error: $e');
    }
    return addManageAttributesApiResModel;
  }

  /// Delete Attributes
  Future<DeleteAttributesApiResModel> deleteAttributes(productId) async {
    DeleteAttributesApiResModel deleteAttributesApiResModel = DeleteAttributesApiResModel();
    try {
      final response = await ApiFun.apiDeleteWithParams('user/delete-seller-attributes/$productId');
      deleteAttributesApiResModel = DeleteAttributesApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('My delete attributes api error: $e');
    }
    return deleteAttributesApiResModel;
  }

}