import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/data/FeeConfiguration/createLogisticFeeConfigurationApiResModel.dart';
import 'package:taptohello/data/FeeConfiguration/createPGFeeConfigurationAlreadyExistsApiResModel.dart';
import 'package:taptohello/data/FeeConfiguration/getFeeConfigurationApiResModel.dart';
import 'package:http/http.dart' as http;
import 'package:taptohello/data/FeeConfiguration/getLogisticFeeConfigurationApiResModel.dart';
import 'package:taptohello/data/FeeConfiguration/updateLogisticFeeConfigurationApiResModel.dart';
import 'package:taptohello/data/FeeConfiguration/updatePGFeeConfigurationApiResModel.dart';

class FeeConfigurationController {
  /// Create PG Fee
  Future<CreatePGFeeConfigurationApiResModel> createPgFee(body) async {
    CreatePGFeeConfigurationApiResModel createPGFeeConfigurationApiResModel = CreatePGFeeConfigurationApiResModel();
    try {
      var headers = {
        'token': AppConstants.token,
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('${AppConstants.baseUrl}pFee/createPgFee'));

      request.body = json.encode(body);
      request.headers.addAll(headers);

      // Send the request and read the response stream once
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Read the response stream once
        String responseString = await response.stream.bytesToString();
        debugPrint('API Response: $responseString');

        // Parse the response
        final jsonData = jsonDecode(responseString);
        createPGFeeConfigurationApiResModel = CreatePGFeeConfigurationApiResModel.fromJson(jsonData);
      }
      else {
        debugPrint('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint('create pg fee configuration api error: $e');
    }
    return createPGFeeConfigurationApiResModel;
  }

  /// Update PG Fee
  Future<UpdatePGFeeConfigurationApiResModel> updatePGFee(body) async {
    UpdatePGFeeConfigurationApiResModel updatePGFeeConfigurationApiResModel = UpdatePGFeeConfigurationApiResModel();
    try {
      var headers = {
        'token': AppConstants.token,
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('${AppConstants.baseUrl}pFee/updatePgFee'));

      request.body = json.encode(body);
      request.headers.addAll(headers);

      // Send the request and read the response stream once
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Read the response stream once
        String responseString = await response.stream.bytesToString();
        debugPrint('API Response: $responseString');

        // Parse the response
        final jsonData = jsonDecode(responseString);
        updatePGFeeConfigurationApiResModel = UpdatePGFeeConfigurationApiResModel.fromJson(jsonData);
      } else {
        debugPrint('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint('get pg fee configuration api error: $e');
    }
    return updatePGFeeConfigurationApiResModel;
  }

  /// Get PG Fee
  Future<GetPGFeeConfigurationApiResModel> getPGFee(body) async {
    debugPrint('My token is: ${AppConstants.token}');
    debugPrint('My body is: $body');
    GetPGFeeConfigurationApiResModel getPGFeeConfigurationApiResModel =
        GetPGFeeConfigurationApiResModel();
    try {
      var headers = {
        'token': AppConstants.token,
        'Content-Type': 'application/json',
      };

      var request = http.Request('POST', Uri.parse('${AppConstants.baseUrl}pFee/getPgFee'));
      request.body = json.encode(body);
      request.headers.addAll(headers);

      // Send the request and read the response stream once
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Read the response stream once
        String responseString = await response.stream.bytesToString();
        debugPrint('API Response: $responseString');

        // Parse the response
        final jsonData = jsonDecode(responseString);
        getPGFeeConfigurationApiResModel = GetPGFeeConfigurationApiResModel.fromJson(jsonData);
      } else {
        debugPrint('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint('get pg fee configuration api error: $e');
    }
    return getPGFeeConfigurationApiResModel;
  }

  /// Get Logistic Fee
  Future<GetLogisticFeeConfiguration> getLogisticFee(body) async {
    GetLogisticFeeConfiguration getLogisticFeeConfiguration = GetLogisticFeeConfiguration();
    try {
      var headers = {
        'token': AppConstants.token,
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('${AppConstants.baseUrl}lFee/getLogisticsFee'));

      request.body = json.encode(body);
      request.headers.addAll(headers);

      // Send the request and read the response stream once
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Read the response stream once
        String responseString = await response.stream.bytesToString();
        debugPrint('API Response: $responseString');

        // Parse the response
        final jsonData = jsonDecode(responseString);
        getLogisticFeeConfiguration = GetLogisticFeeConfiguration.fromJson(jsonData);
      }
      else {
        debugPrint('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint('create pg fee configuration api error: $e');
    }
    return getLogisticFeeConfiguration;
  }

  /// Create Logistic Fee
  Future<CreateLogisticFeeConfiguration> createLogisticFee(body) async {
    CreateLogisticFeeConfiguration createLogisticFeeConfiguration = CreateLogisticFeeConfiguration();
    try {
      var headers = {
        'token': AppConstants.token,
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('${AppConstants.baseUrl}lFee/createLogisticsFee'));

      request.body = json.encode(body);
      request.headers.addAll(headers);

      // Send the request and read the response stream once
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Read the response stream once
        String responseString = await response.stream.bytesToString();
        debugPrint('API Response: $responseString');

        // Parse the response
        final jsonData = jsonDecode(responseString);
        createLogisticFeeConfiguration = CreateLogisticFeeConfiguration.fromJson(jsonData);
      }
      else {
        debugPrint('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint('create pg fee configuration api error: $e');
    }
    return createLogisticFeeConfiguration;
  }

  /// Update Logistic Fee
  Future<UpdateLogisticFeeConfiguration> updateLogisticFee(body) async {
    UpdateLogisticFeeConfiguration updateLogisticFeeConfiguration = UpdateLogisticFeeConfiguration();
    try {
      var headers = {
        'token': AppConstants.token,
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('${AppConstants.baseUrl}lFee/updateLogisticsFee'));

      request.body = json.encode(body);
      request.headers.addAll(headers);

      // Send the request and read the response stream once
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Read the response stream once
        String responseString = await response.stream.bytesToString();
        debugPrint('API Response: $responseString');

        // Parse the response
        final jsonData = jsonDecode(responseString);
        updateLogisticFeeConfiguration = UpdateLogisticFeeConfiguration.fromJson(jsonData);
      }
      else {
        debugPrint('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint('create pg fee configuration api error: $e');
    }
    return updateLogisticFeeConfiguration;
  }
}
