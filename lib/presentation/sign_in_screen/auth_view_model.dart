import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/data/auth/auth_repo.dart';
import 'package:taptohello/data/auth/model/add_contact_card.dart';
import 'package:taptohello/data/auth/model/add_custom_service.dart';
import 'package:taptohello/data/auth/model/add_hello_direct.dart';
import 'package:taptohello/data/auth/model/add_service.dart';
import 'package:taptohello/data/auth/model/change_theme.dart';
import 'package:taptohello/data/auth/model/edit_profile_link.dart';
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
import 'package:taptohello/data/auth/model/update_user.dart';
import 'package:taptohello/data/auth/model/user_detail.dart';
import 'package:taptohello/data/auth/model/user_services.dart';
import 'package:taptohello/data/upload/models/add_theme_model.dart';
import 'package:taptohello/data/upload/upload_repo.dart';

import 'package:taptohello/helper/base_view_model.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/changeLanguage/change_language_view.dart';
import 'package:taptohello/presentation/edit_card_screen/edit_profile_screen.dart';
import 'package:taptohello/presentation/home/home_view.dart';
import 'package:taptohello/presentation/profileScreen/profile_bottom_sheet.dart';
import 'package:taptohello/presentation/profileScreen/profile_screen.dart';

import 'package:taptohello/presentation/register/otp_verify_view.dart';
import 'package:taptohello/presentation/register/verify_phone_view.dart';
import 'package:taptohello/presentation/sign_in_screen/reset_password_view.dart';
import 'package:taptohello/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:taptohello/provider/repository_provider.dart';

import '../../helper/base_screen_view.dart';
import '../../services/shared_preference_service.dart';

final authViewModel = ChangeNotifierProvider.autoDispose(
  (ref) => AuthViewModel(
    ref.read(authRepoProvider),
    ref.read(uploadProvider),
  ),
);

class AuthViewModel extends BaseViewModel<BaseScreenView> {
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  UserDetailResponse? _userDetailResponse;

  UserDetailResponse? get userDetailResponse => _userDetailResponse;
  GetServiceResponse? _getServiceResponse;

  GetServiceResponse? get getServiceResponse => _getServiceResponse;
  UserServicesResponse? _userServicesResponse;

  UserServicesResponse? get userServicesResponse => _userServicesResponse;
  GetSearchServicesResponse? _getSearchServicesResponse;

  GetSearchServicesResponse? get getSearchServicesResponse =>
      _getSearchServicesResponse;
  GetMultipleAccountsResponse? _getMultipleAccountsResponse;

  GetMultipleAccountsResponse? get getMultipleAccountsResponse =>
      _getMultipleAccountsResponse;
  ContactCardResponse? _contactCardResponse;

  CreatgeMultipleAccountRequest creatgeMultipleAccountRequest =
      CreatgeMultipleAccountRequest(name: "");

  ContactCardResponse? get contactCardResponse => _contactCardResponse;

  GetPlanResponse? _getPlanResponse;

  GetPlanResponse? get getPlanResponse => _getPlanResponse;
  final AuthRepo _authRepo;
  final UploadRepo _uploadRepo;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  final bool _checking = true;
  AddCustomServiceRequest addCustomServiceRequest =
      AddCustomServiceRequest(link: "", logo: "", title: "");
  AddThemeRequest addThemeRequest =
      AddThemeRequest(color1: "", color2: "", image: "");
  EditProfileLinkRequest editProfileLinkRequest =
      EditProfileLinkRequest(username: "");
  ReqistrationRequest reqistrationRequest =
      const ReqistrationRequest(email: "", password: "", fcm: "");
  AddhelloDirectRequest addhelloDirectRequest = const AddhelloDirectRequest(
    serviceId: "",
  );
  OtpVerifyRequest otpVerifyRequest =
      const OtpVerifyRequest(otp: 0, userNumber: "");
  ForgetPasswordRequest forgetPasswordRequest =
      const ForgetPasswordRequest(mobile: "");
  ResetPasswordRequest resetPasswordRequest =
      const ResetPasswordRequest(newPassword: "", otp: 0, userId: "");
  GetSearchServicesRequest getSearchServicesRequest =
      const GetSearchServicesRequest(title: "");
  UpdateUserRequest updateUserRequest = const UpdateUserRequest();
  UpdateUserQrRequest updateUserQrRequest = const UpdateUserQrRequest();
  ContactCardRequest contactCardRequest = const ContactCardRequest();

  AddServiceRequest addServiceRequest = const AddServiceRequest();

  LoginRequest loginRequest = const LoginRequest(email: "", password: "");

  AuthViewModel(this._authRepo, this._uploadRepo);

  Future<void> addContactCard(ContactCardRequest contactCardRequest) async {
    // toggleLoading();
    await _authRepo.addContactCards(contactCardRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            getContactCard();
          }),
        );
    // toggleLoading();
    notifyListeners();
  }

  Future<void> getContactCard() async {
    // toggleLoading();
    await _authRepo.getContactCards().then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            _contactCardResponse = r;
          }),
        );
    // toggleLoading();
    notifyListeners();
  }

  Future<void> deleteContactCard(String id) async {
    // toggleLoading();
    await _authRepo.deleteContactCard(id).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            getContactCard();
          }),
        );
    // toggleLoading();
    notifyListeners();
  }

   



  Future<void> register(
    ReqistrationRequest reqistrationRequest,
    BuildContext context,
  ) async {
    await _authRepo.register(reqistrationRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
          }, (r) async {
            // _newsListResponse = r;
            AppConstants.token = r.token!;
            AppConstants.userId = r.user!.id!;

            AppConstants.token = r.token!;
            AppConstants.userId = r.user!.id!;
            // if (isRemember) {
            SharedPreferenceService.setString(
              AppConstants.authToken,
              AppConstants.token,
            );
            SharedPreferenceService.setString(
              AppConstants.userIdPref,
              AppConstants.userId,
            );

            await sendOtp(OtpRequest(mobile: "91${r.user?.phone}"), context,
                r.user?.phone ?? "", "");

            // }

            // _newsListResponse = r;
          }),
        );
    // toggleLoading();
  }

  Future<void> verifyOtp(
    OtpVerifyRequest otpVerifyRequest,
    BuildContext context,
  ) async {
    await _authRepo.verifyOtp(otpVerifyRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
          }, (r) async {
            // }
            // await getUserDetail();
            // _newsListResponse = r;
            if (r.success == true) {
              AppConstants.token = r.token!;
              AppConstants.userId = r.user!.id!;

              AppConstants.token = r.token!;
              AppConstants.userId = r.user!.id!;
              // if (isRemember) {
              SharedPreferenceService.setString(
                AppConstants.authToken,
                AppConstants.token,
              );
              SharedPreferenceService.setString(
                AppConstants.userIdPref,
                AppConstants.userId,
              );

              await getUserDetail();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeView()),
                (route) => false,
              );

              // }

              // _newsListResponse = r;
            }
          }),
        );
    toggleLoading();
  }

  Future<void> login(
      LoginRequest loginRequest, BuildContext context, bool isRemember, bool lang) async {
    await _authRepo.login(loginRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
          }, (r) async {
            AppConstants.token = r.token!;
            AppConstants.userId = r.user!.id!;

            AppConstants.token = r.token!;
            AppConstants.userId = r.user!.id!;
            // if (isRemember) {
            SharedPreferenceService.setString(
              AppConstants.authToken,
              AppConstants.token,
            );
            SharedPreferenceService.setString(
              AppConstants.userIdPref,
              AppConstants.userId,
            );

            if (r.user?.isMobileVerified == false) {
              await sendOtp(OtpRequest(mobile: "91${r.user?.phone}"), context,
                  r.user?.phone ?? "", "");

              await getUserDetail();
              // _newsListResponse = r;
            } else {
              await getUserDetail();
              print('My token: ${r.token}');
              SharedPreferenceService.setString('parentIdToken', r.token.toString());
              debugPrint('My lnguage os: ${SharedPreferenceService.getInt("language")}');
              debugPrint('My lang is: $lang');
              debugPrint('My model is: $r');
              r.user?.services?.forEach((element) {
                if(element.title == "Instagram") {
                  SharedPreferenceService.setString('instaUserName', element.content.toString());
                  debugPrint('My user name is: ${element.content}');
                  debugPrint('My user name is: ${SharedPreferenceService.getString('instaUserName')}');
                }
              });
              // debugPrint('My instagram id is: ${r.user.services[]}');
              // debugPrint('My proplusis: ${r.user.}');
              lang
                  ? Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeView()),
                    (route) => false,
              ) : Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => ChangeLanguageView()),
                      (route) => false,
                    );
            }
          }),
        );
  }

  Future<void> updateUser(
      UpdateUserRequest updateUserRequest, BuildContext context,
      {bool isMulti = false}) async {
    await _authRepo
        .updateUser(updateUserRequest)
        .then((value) => value.fold((l) {
              view?.showSnackbar(l.message);
            }, (r) async {
              if (r.success == true) {
                await getUserDetail();
                view?.showSnackbar(
                  "Profile Updated Successfully",
                );
                isMulti
                    ? Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeView(
                          indexfromPrevious: 4,
                        ),
                      ))
                    : Navigator.of(context).pop();
              }
            }

                // _newsListResponse = r;

                ));
    toggleLoading();
  }

  Future<void> getUserDetail() async {
    if (AppConstants.token.isEmpty ||
        AppConstants.token == "" ||
        AppConstants.userId.isEmpty ||
        AppConstants.userId == '') {
      return;
    } else {
      print('My user id is --------: ${AppConstants.userId}');
      await _authRepo.getUserDetail().then(
            (value) => value.fold((l) {
              view?.showSnackbar(l.message, color: Colors.red);
            }, (r) async {
              _userDetailResponse = r;
            //  print('My updated mdoel: $_userDetailResponse');
              // await elegibility();
              _userDetailService.setuserDetail(_userDetailResponse);
            }),
          );
    }
  }

  Future<bool?> getuserSplash() async {
    if (AppConstants.token.isNotEmpty ||
        AppConstants.token != "" ||
        AppConstants.userId.isNotEmpty ||
        AppConstants.userId != '') {
      await _authRepo.getUserSplash().then(
            (value) => value.fold((l) {
              return false;
            }, (r) async {
              _userDetailResponse = r;
              _userDetailService.setuserDetail(_userDetailResponse);
              return true;
            }),
          );
    } else {
      return false;
    }
    return null;
  }

  Future<void> services() async {
    // toggleLoading();
    await _authRepo.services().then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            _getServiceResponse = r;
            print("these are the services$_getServiceResponse");
          }),
        );
    // toggleLoading();
    notifyListeners();
  }

  Future<void> addCustomService(
      AddCustomServiceRequest addCustomServiceRequest) async {
    // toggleLoading();
    await _authRepo.addCustomService(addCustomServiceRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            await getUserDetail();
            notifyListeners();
          }),
        );
    // toggleLoading();
  }

  Future<void> deleteCustomService(String id) async {
    // toggleLoading();
    await _authRepo.deleteCustomService(id).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            await getUserDetail();
            notifyListeners();
          }),
        );
    // toggleLoading();
  }

  Future<void> searchServices(
      GetSearchServicesRequest getSearchServicesRequest) async {
    // toggleLoading();
    await _authRepo.searchServices(getSearchServicesRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            _getSearchServicesResponse = r;
          }),
        );
    // toggleLoading();
    notifyListeners();
  }

  Future<void> addService(
      AddServiceRequest addServiceRequest, BuildContext context) async {
    await _authRepo.addService(addServiceRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            if (r.success == true) {
              view!.showSnackbar("Detail Added");
              await getUserDetail();
              await getUserServices();
            }
          }),
        );

    notifyListeners();
  }

  Future<void> editProfileLink(EditProfileLinkRequest editProfileLinkRequest,
      BuildContext context) async {
    await _authRepo.editProfileLink(editProfileLinkRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            if (r.success == true) {
              Navigator.of(context).pop(true);
              getUserDetail();
              view!.showSnackbar("Profile Link Updated");
            }
          }),
        );

    notifyListeners();
  }

  Future<void> getMultipleAccount(BuildContext context, String type) async {
    await _authRepo.getMultipleAccount(type).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            _getMultipleAccountsResponse = null;
            _getMultipleAccountsResponse = r;

            getUserDetail();
            // view!.showSnackbar("Profile Link Updated");
          }),
        );

    notifyListeners();
  }

  Future<void> createDuplicateProfile(BuildContext context, String type) async {
    await _authRepo.createDuplicateProfile().then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            // _getMultipleAccountsResponse = r;
            getMultipleAccount(context, type);
            Navigator.of(context).pop();
            showDialog(
                context: context, builder: (context) => DuplicateSuccess());

            // view?.showSnackbar("Card is activated");
            // _newsListResponse = r;

            // view!.showSnackbar("Profile Link Updated");
          }),
        );

    notifyListeners();
  }

  Future<void> createMultipleAccount(
      BuildContext context,
      CreatgeMultipleAccountRequest creatgeMultipleAccountRequest,
      String type) async {
    await _authRepo.createMultipleAccount(creatgeMultipleAccountRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            getMultipleAccount(context, type);
            Navigator.of(context).pop();

            showDialog(
                context: context,
                builder: (context) => MultiSuccess(
                      content: null,
                    ));
          }),
        );

    notifyListeners();
  }

  Future<void> switchAccount(
      BuildContext context, String userID, bool sendToEdit) async {
    AppConstants.userId = userID;
    await SharedPreferenceService.setString(
      AppConstants.userIdPref,
      AppConstants.userId,
    );
    notifyListeners();
    await _authRepo.switchAccount().then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            AppConstants.token = r.token!;

            // if (isRemember) {
            SharedPreferenceService.setString(
              AppConstants.authToken,
              AppConstants.token,
            );
            notifyListeners();
            // getMultipleAccount(context);
            // Navigator.of(context).pop();
            if (sendToEdit == true) {
              await getUserDetail();
              notifyListeners();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditProfileScreen(
                  gotoMulti: true,
                ),
              ));
            } else {
              await getUserDetail();
              notifyListeners();
              showDialog(
                  context: context,
                  builder: (context) => MultiSuccess(
                        content: "Switched Account successful",
                      ));
            }
          }),
        );

    notifyListeners();
  }

  Future<String?> uploadSingleFile(File file) async {
    String? fileUrl;

    await _uploadRepo.uploadSingleFile(file).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
            return "";
          }, (r) {
            fileUrl = r.fileUrl;
          }),
        );
    return fileUrl;
  }

  Future<void> getUserServices() async {
    // toggleLoading();
    await _authRepo.getUserServices().then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            _userServicesResponse = r;
          }),
        );
    // toggleLoading();
    notifyListeners();
  }

  Future<void> deleteAccount() async {
    // toggleLoading();
    await _authRepo.deleteAccount().then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {}),
        );
    // toggleLoading();
    notifyListeners();
  }

  Future<void> toggleService(String id) async {
    // toggleLoading();
    await _authRepo.toggleService(id).then(
          (value) => value.fold((l) {
            // view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            getUserDetail();
            getUserServices();

            notifyListeners();

            // _userServicesResponse = r;
          }),
        );
    // toggleLoading();
    notifyListeners();
  }

  Future<void> deleteService(String id) async {
    // toggleLoading();
    await _authRepo.deleteService(id).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            getUserServices();
            // _userServicesResponse = r;
          }),
        );
    // toggleLoading();
    notifyListeners();
  }

  Future<void> getPlans() async {
    // toggleLoading();
    await _authRepo.getPlans().then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            _getPlanResponse = r;
          }),
        );
    // toggleLoading();
    notifyListeners();
  }

  Future<void> updateQr(
    UpdateUserQrRequest updateUserQrRequest,
  ) async {
    await _authRepo
        .updateQrUser(updateUserQrRequest)
        .then((value) => value.fold((l) {
              // view?.showSnackbar(l.message);
            }, (r) async {
             
             
            }

                // _newsListResponse = r;

                ));
    toggleLoading();
  }

  Future<void> sendOtp(
      OtpRequest otpRequest, context, String mobile, String? uuid) async {
    await _authRepo.sendOTP(otpRequest).then((value) => value.fold((l) {
          view?.showSnackbar("Otp has been send to your mobile number");
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VerifyOtpView(
                    mobileNo: mobile,
                    uuid: uuid,
                  )));
          print(l);
        }, (r) async {
          view?.showSnackbar("Otp has been send to your mobile number");
          print(r);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VerifyOtpView(
                    mobileNo: mobile,
                    uuid: uuid,
                  )));
        }

            // _newsListResponse = r;

            ));
    toggleLoading();
  }

  Future<void> resendOtp(
      OtpRequest otpRequest, context, String mobile, String? uuid) async {
    await _authRepo.sendOTP(otpRequest).then((value) => value.fold((l) {
          view?.showSnackbar("Otp has been send to your mobile number");

          print(l);
        }, (r) async {
          view?.showSnackbar("Otp has been send to your mobile number");
          print(r);
        }

            // _newsListResponse = r;

            ));
    toggleLoading();
  }

  Future<void> changeTheme(int index) async {
    // toggleLoading();
    ChangeThemeRequest changeThemeRequest = ChangeThemeRequest(index: index);
    await _authRepo.changeTheme(changeThemeRequest).then(
          (value) => value.fold((l) {
            // view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            getUserServices();
            // _userServicesResponse = r;
          }),
        );
    // toggleLoading();
    notifyListeners();
  }

  Future<void> addCustomBranding(File? file, String? color) async {
    // toggleLoading();
    await _uploadRepo.addCustomBranding(file, color).then(
          (value) => value.fold((l) {
            // view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            await getUserServices();
            view?.showSnackbar(
              "Custom branding Added to profile",
            );
            // _userServicesResponse = r;
          }),
        );
    // toggleLoading();
    notifyListeners();
  }

  Future<void> addTheme(AddThemeRequest addTheme) async {
    // toggleLoading();
    if (_userDetailService.userDetailResponse?.user?.theme == true) {
      await toggleStatus("theme");
    }
    await _authRepo.addTheme(addTheme).then(
          (value) => value.fold((l) {
            // view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            await getUserServices();
            view?.showSnackbar(
              "Custom branding Added to profile",
            );
            // _userServicesResponse = r;
          }),
        );
    // toggleLoading();
    notifyListeners();
  }

  Future<void> toggleStatus(String info) async {
    // toggleLoading();
    await _authRepo.toggleStatus(info).then(
          (value) => value.fold((l) {
            // view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            await getUserDetail();
            notifyListeners();

            // _userServicesResponse = r;
          }),
        );
    // toggleLoading();
  }

  Future<void> elegibility() async {
    // toggleLoading();
    await _authRepo.checkEligibility().then(
          (value) => value.fold((l) {
            // view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            if (Platform.isIOS) {
              AppConstants.eligibility = r.value ?? true;
            } else {
              AppConstants.eligibility = true;
            }

            notifyListeners();

            // _userServicesResponse = r;
          }),
        );
    // toggleLoading();
  }

  Future<void> reorderList(String serviceId, int index) async {
    // toggleLoading();
    ReorderRequest reorderRequest =
        ReorderRequest(id: serviceId, orderId: index);
    await _authRepo.reorderList(reorderRequest).then(
          (value) => value.fold((l) {
            print(l);
            // view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            print(r);

            notifyListeners();

            // _userServicesResponse = r;
          }),
        );
    // toggleLoading();
  }

  Future<void> resetPassword(
      ResetPasswordRequest resetPasswordRequest, BuildContext context) async {
    // toggleLoading();

    await _authRepo.resetPassword(resetPasswordRequest,context).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            notifyListeners();
           ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(r.message.toString())),
  );
            view?.showSnackbar(
                "Login to your new account with the new password");
            
            
        
Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignInScreen()));

            // _userServicesResponse = r;
          }),
        );
    // toggleLoading();
  }

  Future<void> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest, BuildContext context) async {
    // toggleLoading();

    await _authRepo.forgetPassword(forgetPasswordRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            notifyListeners();
             ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP sent successfully")));
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => ResetPasswordView(
                      userId: r.userId ?? "",
                    )));
            // _userServicesResponse = r;
          }),
        );
    // toggleLoading();
  }

  Future<void> addHelloDirect(
      AddhelloDirectRequest addhelloDirectRequest, BuildContext context) async {
    // toggleLoading();

    await _authRepo.addHelloDirect(addhelloDirectRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message, color: Colors.red);
          }, (r) async {
            notifyListeners();
            Navigator.of(context).pop();
            view?.showSnackbar("Hello Direct Added");

            // _userServicesResponse = r;
          }),
        );
    // toggleLoading();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    
    
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    
    
  }

  Future<void> signInWithApple(BuildContext context) async {
   
   
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    print(credential);

   
   
    socialSignin(
        SocialSigninRequest(
            fcm: AppConstants.fcmToken,
            email: "${credential.userIdentifier}@apple.com",
            name: credential.givenName ?? "",
            type: "google",
            uid: credential.userIdentifier,
            phone: ""),
        context,
        credential.givenName ?? "",
        "",
        "${credential.userIdentifier}@apple.com");
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  Future<void> socialSignin(SocialSigninRequest socialSigninRequest,
      BuildContext context, String name, String number, String uuid) async {
    await _authRepo.socialSignin(socialSigninRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
          }, (r) async {
            // }
            // await getUserDetail();
            // _newsListResponse = r;
            if (r.success == true) {
              AppConstants.token = r.token!;
              AppConstants.userId = r.user!.id!;

              AppConstants.token = r.token!;
              AppConstants.userId = r.user!.id!;
              // if (isRemember) {
              SharedPreferenceService.setString(
                AppConstants.authToken,
                AppConstants.token,
              );
              SharedPreferenceService.setString(
                AppConstants.userIdPref,
                AppConstants.userId,
              );

              if (r.user?.isMobileVerified == false) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => VerifyPhoneView(
                          uuid: uuid,
                        )));
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => ChangeLanguageView()),
                  (route) => false,
                );
              }
             
             
            }
          }),
        );
    toggleLoading();
  }

  loginFb(BuildContext context) async {
   
   
  }
}
