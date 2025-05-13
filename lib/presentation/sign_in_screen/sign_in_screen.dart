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
import 'package:get_storage/get_storage.dart';

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
  bool _isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AuthViewModel _viewModel;
  late ContactViewModel? _viewModel2;

  final box = GetStorage();

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
    // entermobilenumbController.text = SharedPreferenceService.getString('signInPhoneAndEmail') ?? '';
    // passwordController.text =  SharedPreferenceService.getString('signInPassword') ?? '';
//     final username = box.read('signInPhoneAndEmail') ?? "";
// final password = box.read('signInPassword') ?? "";

//     print('username, ${username}');
//     entermobilenumbController.text = username;
//     passwordController.text = password;
 checkbox = box.read('rememberMe') ?? false; // Retrieve saved checkbox state

  if (checkbox) {
    entermobilenumbController.text = box.read('signInPhoneAndEmail') ?? '';
    passwordController.text = box.read('signInPassword') ?? '';
  }
    lang = SharedPreferenceService.getString("mylanguage") == '' ? false : true;
    debugPrint('My selected email and password is: ${entermobilenumbController.text}');
    // setState(() {});
  }

  void _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await _viewModel.login(
        LoginRequest(
          email: entermobilenumbController.text.trim(),
          password: passwordController.text.trim(),
          fcm: AppConstants.fcmToken,
        ),
        context,
        checkbox,
        lang,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppCol.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Container(
                    height: getVerticalSize(180),
                    // width:
                    //     getHorizontalSize(280),
                    // padding: getPadding(left: 10, top: 14, right: 10, bottom: 20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/socioshopImage.jpeg"))),
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
                            
                           // SharedPreferenceService.setString('signInPhoneAndEmail', val);
                           box.write('signInPhoneAndEmail', val);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email or phone number';
                            }
                            return null;
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
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                            child: Icon(
                              obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 26,
                            ),
                          ),
                          onChange: (pass) {
                            
                             
                          //  SharedPreferenceService.setString('signInPassword', pass);
                            box.write('signInPassword', pass);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
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
        box.write('rememberMe', checkbox);  // Save checkbox state

        if (checkbox) {
          box.write('signInPhoneAndEmail', entermobilenumbController.text);
          box.write('signInPassword', passwordController.text);
        } else {
          box.remove('signInPhoneAndEmail'); // Remove saved credentials
          box.remove('signInPassword');
        }
      });
    },
    child: CustomCheckbox(
      text: "Remember Me",
      iconSize: getHorizontalSize(15),
      value: checkbox,
      margin: getMargin(bottom: 1),
      fontStyle: CheckboxFontStyle.PoppinsRegular12,
      onChange: (value) {
        setState(() {
          checkbox = value;
          box.write('rememberMe', checkbox); // Save checkbox state

          if (checkbox) {
            box.write('signInPhoneAndEmail', entermobilenumbController.text);
            box.write('signInPassword', passwordController.text);
          } else {
            box.remove('signInPhoneAndEmail');
            box.remove('signInPassword');
          }
        });
      },
    ),
  ),

                              // InkWell(
                              //   onTap: () {
                              //     setState(() {
                              //       checkbox = !checkbox;
                              //       if(checkbox == true) {
                              //         // SharedPreferenceService.setString('signInPhoneAndEmail', entermobilenumbController.text);
                              //         //  SharedPreferenceService.setString('signInPassword', passwordController.text);

                              //          box.write('signInPhoneAndEmail', entermobilenumbController.text);
                              //          box.write('signInPassword', passwordController.text);
                              //       } else {
                              //       //  SharedPreferenceService.setString('signInPhoneAndEmail', '');
                              //       //   SharedPreferenceService.setString('signInPassword', '');

                              //       box.write('signInPhoneAndEmail', '');
                              //          box.write('signInPassword', '');
                              //       }
                              //       debugPrint('My saved email is: ${SharedPreferenceService.getString('signInPhoneAndEmail')}');
                              //     });
                              //   },
                              //   child: CustomCheckbox(
                              //     text: "Remember Me",
                              //     iconSize: getHorizontalSize(
                              //       15,
                              //     ),
                              //     value: checkbox,
                              //     margin: getMargin(
                              //       bottom: 1,
                              //     ),
                              //     fontStyle: CheckboxFontStyle.PoppinsRegular12,
                              //     onChange: (value) {
                              //       checkbox = value;
                              //       setState(() {});
                              //       print('Remember me --- : $checkbox');
                              //       if(checkbox == true) {

                              //             box.write('signInPhoneAndEmail', entermobilenumbController.text);
                              //          box.write('signInPassword', passwordController.text);
                               
                               

                              //         // SharedPreferenceService.setString('signInPhoneAndEmail', entermobilenumbController.text);
                              //         //  SharedPreferenceService.setString('signInPassword', passwordController.text);
                              //       } else {
                              //         // SharedPreferenceService.setString('signInPhoneAndEmail', '');
                              //         //  SharedPreferenceService.setString('signInPassword', '');

                              //          box.write('signInPhoneAndEmail', '');
                              //          box.write('signInPassword', '');
                              //       }
                              //       debugPrint('My saved email is: ${SharedPreferenceService.getString('signInPhoneAndEmail')}');
                              //     },
                              //   ),
                              // ),
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
                        Padding(
                          padding: getPadding(top: 24),
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppCol.primary,
                              minimumSize: Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
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
                                      "This page is protected by Google reCAPTCHA to ensure you're not a bot. ",
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
            if (_isLoading)
              Container(
                color: Colors.black.withOpacity(0.3),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppCol.primary),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    entermobilenumbController.dispose();

    passwordController.dispose();
  }
}
