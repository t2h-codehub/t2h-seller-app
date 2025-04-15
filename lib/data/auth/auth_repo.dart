import 'package:dartz/dartz.dart';
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
import 'package:taptohello/data/auth/model/login.dart';
import 'package:taptohello/data/auth/model/otp_verify.dart';
import 'package:taptohello/data/auth/model/registration.dart';
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

import '../../core/exceptions.dart';

 

abstract class AuthRepo {
  
  
  Future<Either<ApiException, ReqistrationResponse>> register(
      ReqistrationRequest reqistrationRequest);
      
      Future<Either<ApiException, ChangeLogisticApiResModel>> createLogistic(
      body);
  Future<Either<ApiException, LoginResponse>> login(
    LoginRequest loginRequest,
  );
  Future<Either<ApiException, UserDetailResponse>> getUserDetail();
  Future<Either<ApiException, UserDetailResponse>> getUserSplash();

  Future<Either<ApiException, UpdateUserResponse>> updateUser(
    UpdateUserRequest updateUserRequest,
  );
  Future<Either<ApiException, GetServiceResponse>> services();

  Future<Either<ApiException, AddServiceResponse>> addService(
    AddServiceRequest addServiceRequest,
  );
  Future<Either<ApiException, UserServicesResponse>> getUserServices();
  Future<Either<ApiException, UpdateUserResponse>> toggleService(String id);
  Future<Either<ApiException, UpdateUserResponse>> deleteService(String id);

  Future<Either<ApiException, UpdateUserQrResponse>> updateQrUser(
    UpdateUserQrRequest updateUserQrRequest,
  );
  Future<Either<ApiException, ChangeThemeResponse>> changeTheme(
    ChangeThemeRequest changeThemeRequest,
  );
  Future<Either<ApiException, ChangeThemeResponse>> toggleStatus(
    String info,
  );
  Future<Either<ApiException, GetSearchServicesResponse>> searchServices(
      GetSearchServicesRequest getSearchServicesRequest);
  Future<Either<ApiException, OtpVerifyResponse>> verifyOtp(
      OtpVerifyRequest otpVerifyRequest);
  Future<Either<ApiException, SuccessResponse>> reorderList(
      ReorderRequest reorderRequest);
  Future<Either<ApiException, SuccessResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest,context);
  Future<Either<ApiException, ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest);
  Future<Either<ApiException, SocialSigninResponse>> socialSignin(
      SocialSigninRequest socialSigninRequest);
  Future<Either<ApiException, SuccessResponse>> addCustomService(
      AddCustomServiceRequest addCustomServiceRequest);
  Future<Either<ApiException, SuccessResponse>> deleteCustomService(String id);
  Future<Either<ApiException, SuccessResponse>> addHelloDirect(
      AddhelloDirectRequest addhelloDirectRequest);
  Future<Either<ApiException, OtpResponse>> sendOTP(OtpRequest otpRequest);
  Future<Either<ApiException, SuccessResponse>> deleteAccount();
  Future<Either<ApiException, SuccessResponse>> editProfileLink(
      EditProfileLinkRequest editProfileLinkRequest);
  Future<Either<ApiException, ContactCardResponse>> getContactCards();
  Future<Either<ApiException, SuccessResponse>> deleteContactCard(String id);

  Future<Either<ApiException, SuccessResponse>> addContactCards(
      ContactCardRequest contactCardRequest);
  Future<Either<ApiException, GetPlanResponse>> getPlans();
  Future<Either<ApiException, SuccessResponse>> addTheme(
      AddThemeRequest addThemeRequest);
  Future<Either<ApiException, GetMultipleAccountsResponse>> getMultipleAccount(
      String type);
  Future<Either<ApiException, SuccessResponse>> createDuplicateProfile();
  Future<Either<ApiException, SuccessResponse>> createMultipleAccount(
      CreatgeMultipleAccountRequest creatgeMultipleAccountRequest);
  Future<Either<ApiException, SwitchAccountResponse>> switchAccount();
  Future<Either<ApiException, GetEligibilityResponse>> checkEligibility();
}
