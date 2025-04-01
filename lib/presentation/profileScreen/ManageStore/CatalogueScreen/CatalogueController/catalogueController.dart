
import 'package:flutter/material.dart';
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/data/productCategoryModel/catalogueCategoryFilterApiResModel.dart';
import 'package:taptohello/data/productCategoryModel/filterCatalogueApiResModel.dart';

class CatalogueController {
  
  /// Get Filter Category
  Future<List<CatalogueCategoryFilterApiResModel>> getFilterCategory(userId) async {
    List<CatalogueCategoryFilterApiResModel> catalogueCategoryFilterApiResModel = <CatalogueCategoryFilterApiResModel>[];
    try {
      final response = await ApiFun.apiGet('user/get-seller-product-categories/$userId');
      if (response is List<dynamic>) {
        catalogueCategoryFilterApiResModel = response.map((jsonObject) => CatalogueCategoryFilterApiResModel.fromJson(jsonObject)).toList();
      } else {
        debugPrint('Invalid JSON response');
      }
    } catch (e) {
      debugPrint('Get Catalogue Filter Category Api Error: $e');
    }
    return catalogueCategoryFilterApiResModel;
  }

  /// Get Filter data
  Future<GetFilterCatalogueApiResModel> getFilterCatalogueData(body) async {
    GetFilterCatalogueApiResModel getFilterCatalogueApiResModel = GetFilterCatalogueApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('user/filter-products', body);
      getFilterCatalogueApiResModel = GetFilterCatalogueApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('My filter product api error: $e');
    }
    return getFilterCatalogueApiResModel;
  }
}