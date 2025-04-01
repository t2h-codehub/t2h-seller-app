import 'package:flutter/material.dart';
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/data/PolicyModel/CancellationPolicyApiResModel/createCancellationPolicy.dart';
import 'package:taptohello/data/PolicyModel/CancellationPolicyApiResModel/getCancellationPolicyApiResModel.dart';
import 'package:taptohello/data/PolicyModel/CancellationPolicyApiResModel/updateCancellationPolicy.dart';

class CancellationPolicyController {

  /// Get cancellation policy
  Future<GetCancellationPolicyApiResModel> getCancellationPolicy(body) async {
    GetCancellationPolicyApiResModel getCancellationPolicyApiResModel = GetCancellationPolicyApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('cPolicy/getCancelPolicy', body);
      getCancellationPolicyApiResModel = GetCancellationPolicyApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Get cancellation policy api error: $e');
    }
    return getCancellationPolicyApiResModel;
  }

  /// Create cancellation Policy
  Future<CreateCancellationPolicyApiResModel> createCancellationPolicy(body) async {
    CreateCancellationPolicyApiResModel createCancellationPolicyApiResModel = CreateCancellationPolicyApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('cPolicy/createCancelPolicy', body);
      createCancellationPolicyApiResModel = CreateCancellationPolicyApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Create cancellation Policy api error: $e');
    }
    return createCancellationPolicyApiResModel;
  }

  /// Update cancellation policy
  Future<UpdateCancellationPolicyApiResModel> updateCancellationPolicy(body) async {
    UpdateCancellationPolicyApiResModel updateCancellationPolicyApiResModel = UpdateCancellationPolicyApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('cPolicy/updateCancelPolicy', body);
      updateCancellationPolicyApiResModel = UpdateCancellationPolicyApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('Update cancellation policy api error: $e');
    }
    return updateCancellationPolicyApiResModel;
  }
}