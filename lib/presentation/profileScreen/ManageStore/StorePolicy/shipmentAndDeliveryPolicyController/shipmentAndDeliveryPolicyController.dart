import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/core/custom_loader.dart';
import 'package:taptohello/data/PolicyModel/ReturnAndReplacementPolicy/craeteReturnReplacementPolicyApiResModel.dart';
import 'package:taptohello/data/PolicyModel/ReturnAndReplacementPolicy/getReturnAndReplacementPolicy.dart';
import 'package:taptohello/data/PolicyModel/ReturnAndReplacementPolicy/updateReturnReplacementPolicy.dart';
import 'package:taptohello/data/PolicyModel/getAllActivePoliciesResponceModel.dart';

class ShipmentAndDeliveryPolicyController {

  /// Create return and replacement policy
  Future<CreateReturnAndReplacementPolicyApiResModel> createReturnAndReplacementPolicy(body) async {
    CreateReturnAndReplacementPolicyApiResModel createReturnAndReplacementPolicyApiResModel = CreateReturnAndReplacementPolicyApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('sPolicy/createShipmentPolicy', body);
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
      final response = await ApiFun.apiRequestHttpRawBody('sPolicy/getShipmentPolicy', body);
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
      final response = await ApiFun.apiRequestHttpRawBody('sPolicy/updateShipmentPolicy', body);
      updateReturnAndReplacementPolicyApiResModel = UpdateReturnAndReplacementPolicyApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('My update Return and replacement policy api error: $e');
    }
    return updateReturnAndReplacementPolicyApiResModel;
  }

   Future<GetAllActivePoliciesResponceModel> getListPolicy(userId) async {
  
     
    GetAllActivePoliciesResponceModel getReturnAndReplacementPolicyApiResModel = GetAllActivePoliciesResponceModel();
    try {
      final response = await ApiFun.apiGet('policy/get-all-policies/${userId}');
      getReturnAndReplacementPolicyApiResModel = GetAllActivePoliciesResponceModel.fromJson(response);
    } catch (e) {
      debugPrint('Get Return And Replacement Policy Api Error: $e');
    }
   
    return getReturnAndReplacementPolicyApiResModel;
  }

   Future<GetAllActivePoliciesResponceModel> addListPolicy(body) async {
   GetAllActivePoliciesResponceModel getReturnAndReplacementPolicyApiResModel = GetAllActivePoliciesResponceModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('policy/add-policy', body);
      getReturnAndReplacementPolicyApiResModel = GetAllActivePoliciesResponceModel.fromJson(response);
    } catch (e) {
      debugPrint('My update Return and replacement policy api error: $e');
    }
    return getReturnAndReplacementPolicyApiResModel;
  }

  Future<GetAllActivePoliciesResponceModel> deletePlolicy(policyType) async {
   GetAllActivePoliciesResponceModel getReturnAndReplacementPolicyApiResModel = GetAllActivePoliciesResponceModel();
    try {
      final response = await ApiFun.apiDeleteWithParams('policy/delete-policy/${policyType}',);
      getReturnAndReplacementPolicyApiResModel = GetAllActivePoliciesResponceModel.fromJson(response);
    } catch (e) {
      debugPrint('My update Return and replacement policy api error: $e');
    }
    return getReturnAndReplacementPolicyApiResModel;
  }

  Future<GetAllActivePoliciesResponceModel> addListUpdatePolicy(body,id) async {
   GetAllActivePoliciesResponceModel getReturnAndReplacementPolicyApiResModel = GetAllActivePoliciesResponceModel();
    try {
      final response = await ApiFun.apiPutRequestWithBody('policy/update-policy/${id}', body);
      getReturnAndReplacementPolicyApiResModel = GetAllActivePoliciesResponceModel.fromJson(response);
    } catch (e) {
      debugPrint('My update Return and replacement policy api error: $e');
    }
    return getReturnAndReplacementPolicyApiResModel;
  }




}