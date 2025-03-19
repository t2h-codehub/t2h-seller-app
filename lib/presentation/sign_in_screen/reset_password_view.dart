import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/auth/model/reset_password.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

class ResetPasswordView extends ConsumerStatefulWidget {
  final String userId;
  const ResetPasswordView({
    required this.userId,
    super.key,
  });

  @override
  ConsumerState<ResetPasswordView> createState() => _VerifyPhoneViewState();
}

class _VerifyPhoneViewState extends ConsumerState<ResetPasswordView>
    with BaseScreenView {
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool obscurePassword = true;
  bool obscurePincode = true;
  bool obscureCPassword = true;
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  late AuthViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(authViewModel);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey2,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 190,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/newIcons/color_header.png"))),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        24, 50, 24, 0),
                                    child: Image.asset(
                                      "assets/images/back.png",
                                      height: 24,
                                    )),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                "assets/newIcons/otp.png",
                                height: 88,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Reset Password",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsBold15
                      .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: Center(
                  child: Text(
                    "Enter the OTP sent on your email address and reset your password",
                    // overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtPoppinsBold15
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16.0, 24, 16),
                child: CustomTextFormField(
                    autoFocus: true,
                    maxlength: 4,
                    controller: pinCodeController,
                    label: "Enter OTP",
                    hintText: "Enter OTP",
                    margin: getMargin(
                      top: 9,
                    ),
                    isObscureText: obscurePincode,
                    textInputType: TextInputType.number,
                    suffix: InkWell(
                      onTap: () {
                        obscurePincode = !obscurePincode;
                        setState(() {});
                      },
                      child: Icon(
                        obscurePincode
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 26,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomTextFormField(
                    controller: passwordController,
                    label: "New Password",
                    hintText: "New Password",
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
                    )),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomTextFormField(
                    controller: confirmPasswordController,
                    label: "Confirm Password",
                    hintText: "Confirm Password",
                    margin: getMargin(
                      top: 9,
                    ),
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    isObscureText: obscureCPassword,
                    suffix: InkWell(
                      onTap: () {
                        obscureCPassword = !obscureCPassword;
                        setState(() {});
                      },
                      child: Icon(
                        obscureCPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 26,
                      ),
                    )),
              ),
              SizedBox(height: 16),
              Container(
                margin: getMargin(top: 16, left: 24, right: 24),
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
                      onTap: () async {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        if (pinCodeController.text.isEmpty) {
                          showSnackbar("Please enter the otp");
                        }
                        if (passwordController.text.isEmpty) {
                          showSnackbar("Please enter the password");
                        }
                        if (confirmPasswordController.text.isEmpty) {
                          showSnackbar("Please enter the confirm password");
                        }
                        if (confirmPasswordController.text !=
                            passwordController.text) {
                          showSnackbar(
                              "Password and confirm password are not same");
                        } else {
                          onSave(_formKey2, context);

                          // }
                        }
                      },
                      child: Center(
                        // alignment: Alignment.bottomCenter,
                        child: Text(
                          "Reset Password",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsBold15
                              .copyWith(fontSize: 16, color: Colors.white),
                        ),
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
      _viewModel.resetPasswordRequest = ResetPasswordRequest(
          newPassword: passwordController.text,
          otp: int.parse(pinCodeController.text),
          userId: widget.userId);
      _viewModel.resetPassword(
        _viewModel.resetPasswordRequest,
        context,
      );
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    // emailController.dispose();
  }
}
