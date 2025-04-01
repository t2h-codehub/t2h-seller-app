import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/core.dart';

import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/core/utils/image_constant.dart';
import 'package:taptohello/core/utils/size_utils.dart';
import 'package:taptohello/data/auth/model/login.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/presentation/contact/contact_view_model.dart';

import 'package:taptohello/presentation/register/registration_screen.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/presentation/sign_in_screen/forget_password_view.dart';
import 'package:taptohello/services/shared_preference_service.dart';
import 'package:taptohello/theme/app_decoration.dart';
import 'package:taptohello/theme/app_style.dart';
import 'package:taptohello/widgets/custom_checkbox.dart';
import 'package:taptohello/widgets/custom_image_view.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class SignInScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen>
    with BaseScreenView {
  TextEditingController entermobilenumbController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool checkbox = false;
  bool obscurePassword = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AuthViewModel _viewModel;
  late ContactViewModel? _viewModel2;

  bool lang = false;

  @override
  void initState() {
    super.initState();
    getEmailAndPass();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
  }

  getEmailAndPass() {

    debugPrint('My email is: ${SharedPreferenceService.getString('signInPhoneAndEmail')}');
    entermobilenumbController.text = SharedPreferenceService.getString('signInPhoneAndEmail') ?? '';
    passwordController.text =  SharedPreferenceService.getString('signInPassword') ?? '';
    lang = SharedPreferenceService.getString("mylanguage") == '' ? false : true;
    debugPrint('My selected email and password is: ${entermobilenumbController.text}');
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppCol.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 16),
              Padding(
                 padding: getPadding(left: 20, top: 15, right: 20, bottom: 20),
                child: Container(
                  height: getVerticalSize(150),
                  // width:
                  //     getHorizontalSize(280),
                  // padding: getPadding(left: 10, top: 14, right: 10, bottom: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/Picture2.png"))),
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: getPadding(
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      controller: entermobilenumbController,
                      label: "Email or Phone Number",
                      hintText: "Enter email address or phone number",
                      margin: getMargin(
                        top: 24,
                      ),
                      textInputType: TextInputType.emailAddress,
                      suffix: Icon(
                        Icons.person_outline,
                        size: 26,
                      ),
                      maxlength: 50,
                      onChange: (val) {
                        
                        SharedPreferenceService.setString('signInPhoneAndEmail', val);
                      },
                    ),
                    SizedBox(height: 16),
                    CustomTextFormField(
                      controller: passwordController,
                      label: "Password",
                      hintText: "Enter password",
                      margin: getMargin(
                        top: 9,
                      ),
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      isObscureText: obscurePassword,
                      suffix: InkWell(
                        onTap: () {
                          obscurePassword = !obscurePassword;
                          setState(() {});
                        },
                        child: Icon(
                          obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 26,
                        ),
                      ),
                      onChange: (pass) {
                        
                         
                        SharedPreferenceService.setString('signInPassword', pass);
                      },
                    ),
                    Padding(
                      padding: getPadding(
                        left: 1,
                        top: 7,
                        right: 1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                checkbox = !checkbox;
                                if(checkbox == true) {
                                  SharedPreferenceService.setString('signInPhoneAndEmail', entermobilenumbController.text);
                                  // SharedPreferenceService.setString('signInPassword', passwordController.text);
                                } else {
                                 // SharedPreferenceService.setString('signInPhoneAndEmail', '');
                                  // SharedPreferenceService.setString('signInPassword', '');
                                }
                                debugPrint('My saved email is: ${SharedPreferenceService.getString('signInPhoneAndEmail')}');
                              });
                            },
                            child: CustomCheckbox(
                              text: "Remember Me",
                              iconSize: getHorizontalSize(
                                15,
                              ),
                              value: checkbox,
                              margin: getMargin(
                                bottom: 1,
                              ),
                              fontStyle: CheckboxFontStyle.PoppinsRegular12,
                              onChange: (value) {
                                checkbox = value;
                                setState(() {});
                                print('Remember me --- : $checkbox');
                               /* if(checkbox == true) {
                                  SharedPreferenceService.setString('signInPhoneAndEmail', entermobilenumbController.text);
                                  // SharedPreferenceService.setString('signInPassword', passwordController.text);
                                } else {
                                  SharedPreferenceService.setString('signInPhoneAndEmail', '');
                                  // SharedPreferenceService.setString('signInPassword', '');
                                }
                                debugPrint('My saved email is: ${SharedPreferenceService.getString('signInPhoneAndEmail')}');*/
                              },
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ForgetPasswordView(),
                              ));
                            },
                            child: Padding(
                              padding: getPadding(
                                top: 1,
                              ),
                              child: Text(
                                "Forgot Password?",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsRegular12
                                    .copyWith(fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }

                        if (entermobilenumbController.text.isEmpty) {
                          showSnackbar(
                              "Please enter a mobile number on an email");
                          showSnackbar("Please enter a valid email");
                        } else if (passwordController.text.isEmpty) {
                          showSnackbar("Please enter a password");
                        } else {
                          if(checkbox == true) {
                            SharedPreferenceService.setString('signInPhoneAndEmail', entermobilenumbController.text);
                            // SharedPreferenceService.setString('signInPassword', passwordController.text);
                          } else {
                            SharedPreferenceService.setString('signInPhoneAndEmail', '');
                            // SharedPreferenceService.setString('signInPassword', '');
                          }
                          debugPrint('My saved email is: ${SharedPreferenceService.getString('signInPhoneAndEmail')}');
                          onSave(_formKey, context);
                        }
                      },
                      child: SizedBox(
                        height: getVerticalSize(
                          55,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: getPadding(
                                  left: 16,
                                  top: 16,
                                  right: 16,
                                  bottom: 16,
                                ),
                                // height: getVerticalSize(
                                //   60,
                                // ),
                                // width: getHorizontalSize(
                                //   281,
                                // ),
                                decoration: BoxDecoration(
                                  color: AppCol.primary,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              // alignment: Alignment.bottomCenter,
                              child: Text(
                                "Sign In",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsBold15.copyWith(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                   
                   
                    SizedBox(height: 12),

                  
                  
                    /// new Sign in page sign up text
                    Padding(
                      padding: getPadding(
                        top: 12,
                      ),
                      child: Text(
                        "New to Hello? ",
                        style: TextStyle(
                          color: AppCol.gray900,
                          fontSize: getFontSize(
                            15,
                          ),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    /// Create Your Account
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 18),
                        height: getVerticalSize(
                          55,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: getPadding(
                                  left: 16,
                                  top: 16,
                                  right: 16,
                                  bottom: 16,
                                ),
                               
                               
                                decoration: BoxDecoration(
                                  color: AppCol.lightestgrey,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              // alignment: Alignment.bottomCenter,
                              child: Text(
                                "Create Your Account",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsBold15.copyWith(
                                    fontSize: 16, color: AppCol.primary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(
                          top: 12,
                          // right: 83,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgImage41,
                              height: getVerticalSize(
                                34,
                              ),
                              width: getHorizontalSize(
                                28,
                              ),
                              margin: getMargin(
                                top: 14,
                                bottom: 8,
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgImage42,
                              height: getSize(
                                56,
                              ),
                              width: getSize(
                                56,
                              ),
                              margin: getMargin(
                                left: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        270,
                      ),
                      margin: getMargin(
                        left: 5,
                        top: 22,
                        right: 5,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "This page is protected by Google reCAPTCHA to ensure you’re not a bot. ",
                              style: TextStyle(
                                color: AppCol.gray900,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: "Learn more.",
                              style: TextStyle(
                                color: AppCol.primary,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSave(GlobalKey<FormState> formKey, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      _viewModel.loginRequest = LoginRequest(
          phone: entermobilenumbController.text.toLowerCase(),
          email: entermobilenumbController.text.toLowerCase(),
          fcm: AppConstants.fcmToken,
          password: passwordController.text);
      _viewModel.login(_viewModel.loginRequest, context, checkbox, lang);
    }
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message.toString()),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // TODO: implement showSnackbar
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    entermobilenumbController.dispose();

    passwordController.dispose();
  }
}
