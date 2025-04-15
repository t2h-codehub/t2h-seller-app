import 'package:flutter/material.dart';
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/data/productCategoryModel/addSellerCategoriesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/editSellerCategoriesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/getProductCategoryResponceModel.dart';
import 'package:taptohello/data/productCategoryModel/productCategoryApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/saveSellerCategoriesApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/viewCategoryApiResModel.dart';

class ProductCategoryController {

  /// Get Category List
  Future<ProductCategoryApiResModel> getCategoryList () async {
    ProductCategoryApiResModel productCategoryApiResModel = ProductCategoryApiResModel();
    try {
      final response = await ApiFun.apiGet('user/get-user-categories');
      productCategoryApiResModel = ProductCategoryApiResModel.fromJson(response);
      debugPrint('My category is: $productCategoryApiResModel');
    } catch (e) {
      debugPrint('Product Category Api Error: $e');
    }
    return productCategoryApiResModel;
  }

  /// View Category
  Future<ViewCategoriesApiResModel> viewCategory() async {
    ViewCategoriesApiResModel viewCategoriesApiResModel = ViewCategoriesApiResModel();
    try {
      final response = await ApiFun.apiGet('user/view-categories');
      viewCategoriesApiResModel = ViewCategoriesApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('View Category Api Error: $e');
    }
    return viewCategoriesApiResModel;
  }

  /// Update seller category
  Future<SaveSellerCategoriesApiResModel> uploadNewCategory (body) async {
    SaveSellerCategoriesApiResModel saveSellerCategoriesApiResModel = SaveSellerCategoriesApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('user/save-seller-categories', body);
      saveSellerCategoriesApiResModel = SaveSellerCategoriesApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Save Seller Category Api Error: $e');
    }
    return saveSellerCategoriesApiResModel;
  }

  /// Edit Seller Category
  Future<EditSellerCategoriesApiResModel> editSellerCategory(body) async {
    EditSellerCategoriesApiResModel editSellerCategoriesApiResModel = EditSellerCategoriesApiResModel();
    try {
      final response = await ApiFun.apiPutRequestWithBody('user/edit-seller-categories', body);
      editSellerCategoriesApiResModel = EditSellerCategoriesApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Edit Seller Category Api Error: $e');
    }
    return editSellerCategoriesApiResModel;
  }

  /// Add Seller Category
  Future<AddSellerCategoriesApiResModel> addSellerCategory(body)  async {
    debugPrint('My add body response is: $body');
    AddSellerCategoriesApiResModel addSellerCategoriesApiResModel = AddSellerCategoriesApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('user/add-seller-categories', body);
      addSellerCategoriesApiResModel = AddSellerCategoriesApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Add Seller Category Api Error: $e');
    }
    return addSellerCategoriesApiResModel;
  }

  Future<GetProductCategoryResponceModel> getFeatureBanner({String? userId}) async {
    GetProductCategoryResponceModel getProductCategoryResponceModel = GetProductCategoryResponceModel();
    try {
      final response = await ApiFun.apiGet('user/get-seller-categories/${userId}');
      getProductCategoryResponceModel = GetProductCategoryResponceModel.fromJson(response);
    } catch (e) {
      debugPrint('Get product list Api Error: $e');
    }
    //notifyListeners();
    return getProductCategoryResponceModel;
  }

  

   Future<GetProductCategoryResponceModel> addProductCategory(body) async {
    
    
    GetProductCategoryResponceModel getProductCategoryResponceModel = GetProductCategoryResponceModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('user/add-seller-categories-image', body);
      getProductCategoryResponceModel = GetProductCategoryResponceModel.fromJson(response);
    } catch (e) {
      debugPrint('Get product list Api Error: $e');
    }
    //notifyListeners();
    return getProductCategoryResponceModel;
  }

  

   Future<GetProductCategoryResponceModel> deleteProductCategory(categoryId) async {
        GetProductCategoryResponceModel getProductCategoryResponceModel = GetProductCategoryResponceModel();

    try {
      final response = await ApiFun.apiDeleteWithParams('user/delete-seller-category/${categoryId}');
      getProductCategoryResponceModel = GetProductCategoryResponceModel.fromJson(response);
    } catch (e) {
      debugPrint('Get product list Api Error: $e');
    }
    //notifyListeners();
    return getProductCategoryResponceModel;
  }

  
  

  /// get product details

}