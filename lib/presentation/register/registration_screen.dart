import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/presentation/register/verify_phone_view.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class RegistrationScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen>
    with BaseScreenView {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool checkbox = false;
  bool isPasswordObscure = true;
  bool isConfirmObscure = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AuthViewModel _viewModel;

   void _showWebViewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: double.maxFinite,
          height: 400,
          child: WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse('${AppConstants.websiteUrl}terms')),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
  }

    // Email validation function
  bool validateEmail(String email) {
    RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppCol.whiteA700,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 16),
                 Padding(
                 padding: getPadding(left: 40, top: 15, right: 40, bottom: 20),
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
                      /// Name textfield
                      CustomTextFormField(
                        controller: nameController,
                        suffix: Icon(
                          Icons.person_outline,
                          size: 26,
                        ),
                        label: "Name",
                        hintText: "Enter name",
                        margin: getMargin(
                          top: 24,
                        ),
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.name,
                        // isObscureText: true,
                      ),
                      SizedBox(height: 16),

                      /// Email textfield
                      CustomTextFormField(
                        suffix: Icon(
                          Icons.email_outlined,
                          size: 26,
                        ),
                        controller: emailController,
                        maxLines: 100,
                        maxlength: 50 ,
                        label: "Email ID",
                        hintText: "Enter email address",
                        margin: getMargin(
                          top: 9,
                        ),
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),

                      /// Password textfield
                      CustomTextFormField(
                          controller: passwordController,
                          hintText: "Enter password",
                          label: "Password",
                          margin: getMargin(
                            top: 9,
                          ),
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          isObscureText: isPasswordObscure,
                          suffix: InkWell(
                            onTap: () {
                              isPasswordObscure = !isPasswordObscure;
                              setState(() {});
                            },
                            child: Icon(
                              isPasswordObscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 26,
                            ),
                          )),
                      SizedBox(height: 16),

                      /// Confirm password textfield
                      CustomTextFormField(
                          controller: confirmPasswordController,
                          hintText: "Enter confirm password",
                          label: "Confirm Password",
                          margin: getMargin(
                            top: 9,
                          ),
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          isObscureText: isConfirmObscure,
                          suffix: InkWell(
                            onTap: () {
                              isConfirmObscure = !isConfirmObscure;
                              setState(() {});
                            },
                            child: Icon(
                              isConfirmObscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 26,
                            ),
                          )),

                      /// Terms and Condition
                      Container(
                        margin: EdgeInsets.only(top: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: checkbox,
                              activeColor: Colors.green,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: -4),
                              onChanged: (value) {
                                setState(
                                  () {
                                    checkbox = value!;
                                  },
                                );
                              },
                            ),
                            SizedBox(width: 8),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I agree to the ",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Terms and Conditions",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => _showWebViewDialog(context)
                                      // launchUrl(Uri.parse(
                                      //     '${AppConstants.websiteUrl}terms'))
                                          ,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Sign in button
                      Container(
                        margin: getMargin(
                          top: 14,
                        ),
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
                            InkWell(
                              onTap: checkbox
                                  ? () async {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);

                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      if (nameController.text.isEmpty) {
                                        showSnackbar("Please enter a name");
                                      } else if (passwordController.text !=
                                          confirmPasswordController.text) {
                                        showSnackbar(
                                            "Password and confirm password are not same");
                                      } else if (emailController.text.isEmpty ||

                                          !validateEmail(emailController.text)) {
                                        showSnackbar(
                                            "Please enter a valid email");
                                      } else if (passwordController
                                          .text.isEmpty) {
                                        showSnackbar("Please enter a password");
                                      } else {
                                        onSave(_formKey, context);
                                      }
                                    }
                                  : () {},
                              child: Center(
                                // alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Sign Up",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsBold15.copyWith(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Already have an account text
                      Padding(
                        padding: getPadding(
                          top: 24,
                        ),
                        child: Text(
                          "Already have an account? ",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular15
                              .copyWith(fontSize: 14),
                        ),
                      ),

                      /// Already Sign in button
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 24),
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
                                  "Sign In",
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

                    
                    

                      /// Image View
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            top: 12,
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
                      SizedBox(
                        height: 16,
                      ),

                      Container(
                        width: getHorizontalSize(
                          270,
                        ),
                        margin: getMargin(
                          left: 5,
                          top: 10,
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
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSave(GlobalKey<FormState> formKey, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VerifyPhoneView(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text),
      ));
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
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }
}
