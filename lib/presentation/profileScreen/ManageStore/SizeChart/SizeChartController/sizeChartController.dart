import 'package:flutter/material.dart';
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/data/productCategoryModel/sizeChartApiResModel.dart';

class SizeChartController {

  /// Get Size Chart
  Future<SizeChartApiResModel> getSizeChart(gender, category) async {
    debugPrint('My size chart is gender: $gender');
    debugPrint('My size chart is category is: $category');
    SizeChartApiResModel sizeChartApiResModel = SizeChartApiResModel();
    try {
      final response = await ApiFun.apiGet('user/filter-size-charts?gender=$gender&category=$category');
      sizeChartApiResModel = SizeChartApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Size Chart Api Error: $e');
    }
    return sizeChartApiResModel;
  }

}