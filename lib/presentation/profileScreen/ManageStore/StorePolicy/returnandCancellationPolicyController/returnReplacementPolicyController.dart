import 'package:flutter/material.dart';
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/data/PolicyModel/ReturnAndReplacementPolicy/craeteReturnReplacementPolicyApiResModel.dart';
import 'package:taptohello/data/PolicyModel/ReturnAndReplacementPolicy/getReturnAndReplacementPolicy.dart';
import 'package:taptohello/data/PolicyModel/ReturnAndReplacementPolicy/updateReturnReplacementPolicy.dart';

class ReturnReplacementPolicyController {

  /// Create return and replacement policy
  Future<CreateReturnAndReplacementPolicyApiResModel> createReturnAndReplacementPolicy(body) async {
    CreateReturnAndReplacementPolicyApiResModel createReturnAndReplacementPolicyApiResModel = CreateReturnAndReplacementPolicyApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('rPolicy/createReturnPolicy', body);
      createReturnAndReplacementPolicyApiResModel = CreateReturnAndReplacementPolicyApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Create return and replacement policy api error: $e');
    }
    return createReturnAndReplacementPolicyApiResModel;
  }

  /// Get return and replacement policy
  Future<GetReturnAndReplacementPolicyApiResModel> getReturnAndReplacementPolicy(body) async {
    GetReturnAndReplacementPolicyApiResModel getReturnAndReplacementPolicyApiResModel = GetReturnAndReplacementPolicyApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('rPolicy/getReturnPolicy', body);
      getReturnAndReplacementPolicyApiResModel = GetReturnAndReplacementPolicyApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Get Return And Replacement Policy Api Error: $e');
    }
    return getReturnAndReplacementPolicyApiResModel;
  }

  /// Update return and replacement policy
  Future<UpdateReturnAndReplacementPolicyApiResModel> updateReturnAndReplacementPolicy(body) async {
    UpdateReturnAndReplacementPolicyApiResModel updateReturnAndReplacementPolicyApiResModel = UpdateReturnAndReplacementPolicyApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('rPolicy/updateReturnPolicy', body);
      updateReturnAndReplacementPolicyApiResModel = UpdateReturnAndReplacementPolicyApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('My update Return and replacement policy api error: $e');
    }
    return updateReturnAndReplacementPolicyApiResModel;
  }
}