import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taptohello/core/apiFunction.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/data/PaymentGatewayModel/getBillingApiResModel.dart';
import 'package:taptohello/data/PaymentGatewayModel/insertBillingApiResModel.dart';
import 'package:taptohello/data/PaymentGatewayModel/merchantPaymentApiResModel.dart';
import 'package:http/http.dart' as http;
import 'package:taptohello/data/PaymentGatewayModel/merchantStatusApiResModel.dart';
import 'package:taptohello/data/PaymentGatewayModel/onboardingApiResModel.dart';
import 'package:taptohello/data/PaymentGatewayModel/onboardingResponseModels.dart';
import 'package:taptohello/data/PaymentGatewayModel/paymentResponse.dart';
import 'package:taptohello/data/PaymentGatewayModel/updateBillingApiResModel.dart';

class PaymentGatewayController {
  /// merchant payment
  Future<PaymentResponse> merchantPaymentGateway(context, body) async {
    MerchantPaymentAPIResModel merchantPaymentAPIResModel =
        MerchantPaymentAPIResModel();
    int statusCode = 0;
    try {
      var headers = {
        'x-partner-apikey': 'laRT45gyqGak930f3138454410c684d0c1c3a6fe2f893ce206c1',
        'x-api-version': '2023-01-01',
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('https://api-sandbox.cashfree.com/partners/merchants'));
      request.body = jsonEncode(body);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      statusCode = response.statusCode;
      debugPrint('My api error is: ${response.statusCode}');

      var responseData = await response.stream.toBytes();
      String responseString = String.fromCharCodes(responseData);
      final jsonData = jsonDecode(responseString);

      // Debugging: Check the entire response JSON
      debugPrint('Response JSON: $jsonData');

      if (statusCode == 200 && jsonData != null) {
        merchantPaymentAPIResModel = MerchantPaymentAPIResModel.fromJson(jsonData);

        // Debugging: Check if the model is populated correctly
        debugPrint('Merchant ID: ${merchantPaymentAPIResModel.merchantId}');
        debugPrint('Merchant Name: ${merchantPaymentAPIResModel.merchantName}');
      } else {
        debugPrint('Error in API response: Status Code: $statusCode');
      }
    } catch (e) {
      debugPrint('Merchant Payment Api Error: $e');
    }
    return PaymentResponse(model: merchantPaymentAPIResModel, statusCode: statusCode);
  }

  Future<OnboardingResponseModel> paymentOnboarding(merchantId) async {
    debugPrint('My merchant id is: $merchantId');
    PaymentOnboardingApiResModel paymentOnboardingApiResModel = PaymentOnboardingApiResModel();
    int statusCode = 0;

    try {
      var headers = {
        'Accept': 'application/json',
        'x-partner-apikey': 'laRT45gyqGak930f3138454410c684d0c1c3a6fe2f893ce206c1',
        'x-api-version': '2023-01-01',
        'content-type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('https://api-sandbox.cashfree.com/partners/merchants/$merchantId/onboarding_link'));
      request.body = json.encode({
        "type": "account_onboarding",
        "return_url": "${AppConstants.storeUrl}Kyc?sucess=true"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      statusCode = response.statusCode;
      debugPrint('My api error is: ${response.statusCode}');

      var responseData = await response.stream.toBytes();
      String responseString = String.fromCharCodes(responseData);
      final jsonData = jsonDecode(responseString);
      if (statusCode == 200 && jsonData != null) {
        paymentOnboardingApiResModel = PaymentOnboardingApiResModel.fromJson(jsonData);
      } else {
        print('Failed to fetch onboarding link: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
    return OnboardingResponseModel(model: paymentOnboardingApiResModel, statusCode: statusCode);
  }

  Future<MerchantStatusApiResModel> merchantStatus(merchantId) async {
    MerchantStatusApiResModel merchantStatusApiResModel = MerchantStatusApiResModel();
    try {

      final Map<String, String> headers = {
        'x-partner-apikey': 'laRT45gyqGak930f3138454410c684d0c1c3a6fe2f893ce206c1',
        'x-api-version': '2023-01-01',
        'Content-Type': 'application/json'
      };

      final uri = Uri.parse('https://api-sandbox.cashfree.com/partners/merchants/$merchantId');
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        merchantStatusApiResModel = MerchantStatusApiResModel.fromJson(data);
        print(data);
      } else {
        print('Error: ${response.statusCode}');
        print(response.body);
      }

    } catch (e) {
      debugPrint('Merchant gateway status is: $e');
    }
    return merchantStatusApiResModel;
  }

  /// insert or create billing
  Future<InsertBillingApiResModel> insertBilling(body) async {
    InsertBillingApiResModel insertBillingApiResModel = InsertBillingApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('bill/insertBilling', body);
      insertBillingApiResModel = InsertBillingApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('My api error is: $e');
    }
    return insertBillingApiResModel;
  }

  /// update billing
  Future<UpdateBillingApiResModel> updateBilling(body) async {
    UpdateBillingApiResModel updateBillingApiResModel = UpdateBillingApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('bill/updateBilling', body);
      updateBillingApiResModel = UpdateBillingApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('My update billing api error: $e');
    }
    return updateBillingApiResModel;
  }

  /// Get billing address
  Future<GetBillingApiResModel> getBilling(body) async {
    GetBillingApiResModel getBillingApiResModel = GetBillingApiResModel();
    try {
      final response = await ApiFun.apiRequestHttpRawBody('bill/getBilling', body);
      getBillingApiResModel = GetBillingApiResModel.fromJson(response);
    } catch (e) {
      debugPrint('My get billing api error: $e');
    }
    return getBillingApiResModel;
  }
}
