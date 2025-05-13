import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import 'package:flutter/services.dart';
import 'package:taptohello/core/api_client.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/exceptions.dart';
import 'package:taptohello/data/auth/model/add_contact_card.dart';
import 'package:taptohello/data/auth/model/add_custom_service.dart';
import 'package:taptohello/data/auth/model/add_hello_direct.dart';
import 'package:taptohello/data/auth/model/add_service.dart';
import 'package:taptohello/data/auth/model/change_theme.dart';
import 'package:taptohello/data/auth/model/edit_profile_link.dart';
import 'package:taptohello/data/auth/model/eligibility.dart';
import 'package:taptohello/data/auth/model/forget_password.dart';
import 'package:taptohello/data/auth/model/get_all_contact_card.dart';
import 'package:taptohello/data/auth/model/get_all_plans.dart';
import 'package:taptohello/data/auth/model/get_multiple_account.dart';
import 'package:taptohello/data/auth/model/otp_verify.dart';
import 'package:taptohello/data/auth/model/registration.dart';
import 'package:taptohello/data/auth/auth_repo.dart';
import 'package:taptohello/data/auth/model/login.dart';
import 'package:taptohello/data/auth/model/reorder_list.dart';
import 'package:taptohello/data/auth/model/reset_password.dart';
import 'package:taptohello/data/auth/model/search_services.dart';
import 'package:taptohello/data/auth/model/send_otp.dart';
import 'package:taptohello/data/auth/model/services.dart';
import 'package:taptohello/data/auth/model/social_sigin.dart';
import 'package:taptohello/data/auth/model/success_response.dart';
import 'package:taptohello/data/auth/model/switch_account.dart';
import 'package:taptohello/data/auth/model/update_user.dart';
import 'package:taptohello/data/auth/model/user_detail.dart';
import 'package:taptohello/data/auth/model/user_services.dart';
import 'package:taptohello/data/productCategoryModel/logisticResModel.dart';
import 'package:taptohello/data/upload/models/add_theme_model.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiClient _apiClient;

  AuthRepoImpl(this._apiClient);

// @override
// loadCertificate();
@override
 Future<void> loadCertificate() async {
  SecurityContext securityContext = SecurityContext.defaultContext;
  final ByteData certData = await rootBundle.load('assets/api_taptohello_com.pem');
  securityContext.setTrustedCertificatesBytes(certData.buffer.asUint8List());
  print("Certificate loaded successfully!");
}

  @override
  Future<Either<ApiException, LoginResponse>> login(
      LoginRequest loginRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/login",
          
          loginRequestToJson(loginRequest));
      return Right(LoginResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  
// //login to shiprocket
//    @override
//   Future<Either<ApiException, LoginResponse>> loginShiprocket(
//       LoginRequest loginRequest) async {
//     try {
//       final response = await _apiClient.post(
//           "${AppConstants.baseUrl}deliveryLogistic/create-Logistic",
//           loginRequestToJson(loginRequest));
//       return Right(LoginResponse.fromJson(response.data!));
//     } catch (e) {
//       return Left(ApiException(e.toString()));
//     }
//   }

  @override
  Future<Either<ApiException, UserDetailResponse>> getUserDetail() async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}user/get-user/${AppConstants.userId}",
      );
      print('My user details: ${response.data?['User']['contacts']}');
      print('My user details: ${response.data?['token']}');
      return Right(UserDetailResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, UserDetailResponse>> getUserSplash() async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}user/get-user/${AppConstants.userId}",
      );
      return Right(UserDetailResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, ReqistrationResponse>> register(
   
      ReqistrationRequest reqistrationRequest) async {
    try {
       loadCertificate();
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/register",
          reqistrationRequestToJson(reqistrationRequest));
      return Right(ReqistrationResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

//createLogistic
   @override
  Future<Either<ApiException, ChangeLogisticApiResModel>> createLogistic(
      body) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}deliveryLogistic/create-Logistic",
          body);
      return Right(ChangeLogisticApiResModel.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  //   Future<ChangeLogisticApiResModel> createLogistic(body) async {
  //   ChangeLogisticApiResModel changeLogisticApiResModel = ChangeLogisticApiResModel();
  //   try {
  //     final response = await ApiFun.apiRequestHttpRawBody('deliveryLogistic/create-Logistic', body);
  //     changeLogisticApiResModel = ChangeLogisticApiResModel.fromJson(response);
  //   } catch (e) {
  //     debugPrint('Change User Name Api Error: $e');
  //   }
  //   return changeLogisticApiResModel;
  // }

  @override
  Future<Either<ApiException, UpdateUserResponse>> updateUser(
      UpdateUserRequest updateUserRequest) async {
    try {
      final response = await _apiClient.put(
          "${AppConstants.baseUrl}user/update-user",
          updateUserRequest.toJson());
      return Right(UpdateUserResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
  

  @override
  Future<Either<ApiException, GetServiceResponse>> services() async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}service/get-all-services",
      );
      return Right(GetServiceResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, AddServiceResponse>> addService(
      AddServiceRequest addServiceRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/services",
          addServiceRequestToJson(addServiceRequest));
      return Right(AddServiceResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, UserServicesResponse>> getUserServices() async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}user/services",
      );
      return Right(UserServicesResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, UpdateUserResponse>> toggleService(
      String id) async {
    try {
      var body = {};
      final response = await _apiClient.put(
          "${AppConstants.baseUrl}user/services/toggle-active/$id",
          jsonEncode(body));
      return Right(UpdateUserResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, UpdateUserResponse>> deleteService(
      String id) async {
    try {
      final response = await _apiClient.delete(
        "${AppConstants.baseUrl}user/services/$id",
      );
      return Right(UpdateUserResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, UpdateUserQrResponse>> updateQrUser(
      UpdateUserQrRequest updateUserQrRequest) async {
    try {
      final response = await _apiClient.put(
          "${AppConstants.baseUrl}user/update-user",
          updateUserQrRequest.toJson());
      return Right(UpdateUserQrResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, ChangeThemeResponse>> changeTheme(
      ChangeThemeRequest changeThemeRequest) async {
    try {
      final response = await _apiClient.patch(
          "${AppConstants.baseUrl}user/change-color",
          changeThemeRequest.toJson());
      return Right(ChangeThemeResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, ChangeThemeResponse>> toggleStatus(
      String info) async {
    try {
      final response = await _apiClient
          .put("${AppConstants.baseUrl}user/toggle-status/$info", {});
      return Right(ChangeThemeResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, GetSearchServicesResponse>> searchServices(
      GetSearchServicesRequest getSearchServicesRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}service/search-services",
          getSearchServicesRequestToJson(getSearchServicesRequest));
      return Right(GetSearchServicesResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, OtpVerifyResponse>> verifyOtp(
      OtpVerifyRequest otpVerifyRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/otp-verify",
          otpVerifyRequestToJson(otpVerifyRequest));
      return Right(OtpVerifyResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> reorderList(
      ReorderRequest reorderRequest) async {
    try {
      final response = await _apiClient.put(
          "${AppConstants.baseUrl}user/services/reorder",
          reorderRequestToJson(reorderRequest));
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest,context ) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/reset-password",
          resetPasswordRequestToJson(resetPasswordRequest));
  //         final message = response.data!['message'] ?? "Password reset successful";

  // // Show success message
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(content: Text(message)),
  // );
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/forgot-password",
          forgetPasswordRequestToJson(forgetPasswordRequest));

          
      return Right(ForgetPasswordResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SocialSigninResponse>> socialSignin(
      SocialSigninRequest socialSigninRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/social-sign-in",
          socialSigninRequestToJson(socialSigninRequest));
      return Right(SocialSigninResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> addCustomService(
      AddCustomServiceRequest addCustomServiceRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/add-custom-service",
          addCustomServiceRequestToJson(addCustomServiceRequest));
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> deleteCustomService(
      String id) async {
    try {
      final response = await _apiClient.delete(
        "${AppConstants.baseUrl}user/delete-custom-service/$id",
      );
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> addHelloDirect(
      AddhelloDirectRequest addhelloDirectRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/add-hello-direct",
          addhelloDirectRequestToJson(addhelloDirectRequest));
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, OtpResponse>> sendOTP(
      OtpRequest otpRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/send-otp",
          otpRequestToJson(otpRequest));
      return Right(OtpResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> deleteAccount() async {
    try {
      final response = await _apiClient.delete(
        "${AppConstants.baseUrl}user/delete-user",
      );
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> editProfileLink(
      EditProfileLinkRequest editProfileLinkRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/update-username",
          editProfileLinkRequestToJson(editProfileLinkRequest));
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, ContactCardResponse>> getContactCards() async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}user/get-contact-cards",
      );
      return Right(ContactCardResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> addContactCards(
      ContactCardRequest contactCardRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/add-contact-card",
          contactCardRequestToJson(contactCardRequest));
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> deleteContactCard(
      String id) async {
    try {
      final response = await _apiClient.delete(
        "${AppConstants.baseUrl}user/delete-contact-card/$id",
      );
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, GetPlanResponse>> getPlans() async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}user/get-all-plans",
      );
      return Right(GetPlanResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> addTheme(
      AddThemeRequest addThemeRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/custom-theme",
          addThemeRequestToJson(addThemeRequest));
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, GetMultipleAccountsResponse>> getMultipleAccount(
      String type) async {
    try {
      final response = await _apiClient.get(
          "${AppConstants.baseUrl}user/get-multiple-accounts?type=$type");
      return Right(GetMultipleAccountsResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> createDuplicateProfile() async {
    try {
      var body = {};
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/create-duplicate-account",
          jsonEncode(body));
      print(response);
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SuccessResponse>> createMultipleAccount(
      CreatgeMultipleAccountRequest creatgeMultipleAccountRequest) async {
    try {
      final response = await _apiClient.post(
          "${AppConstants.baseUrl}user/create-multiple-account",
          creatgeMultipleAccountRequestToJson(creatgeMultipleAccountRequest));
      print(response);
      return Right(SuccessResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, SwitchAccountResponse>> switchAccount() async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}user/switch-account",
      );
      print('My switch account model:  ${response.data}');
      return Right(SwitchAccountResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, GetEligibilityResponse>>
      checkEligibility() async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}user/check-eligibility",
      );
      print(response);
      return Right(GetEligibilityResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
