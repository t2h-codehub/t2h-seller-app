import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/auth/model/forget_password.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

class ForgetPasswordView extends ConsumerStatefulWidget {
  const ForgetPasswordView({
    super.key,
  });

  @override
  ConsumerState<ForgetPasswordView> createState() => _VerifyPhoneViewState();
}

class _VerifyPhoneViewState extends ConsumerState<ForgetPasswordView>
    with BaseScreenView {
  TextEditingController emailController = TextEditingController();
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
      body: Form(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 50, 24, 0),
                                  child: Image.asset(
                                    "assets/images/back.png",
                                    height: 24,
                                  )),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              "assets/newIcons/password.png",
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
                "Forgot Password?",
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
                  "Please enter your registered mobile number to receive OTP to reset your password",
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
                // maxlength: 10,
                controller: emailController,
                hintText: "Enter mobile number",
                label: "Mobile Number",
                maxlength: 10,

                margin: getMargin(
                  top: 9,
                ),
                suffix: Icon(
                  Icons.phone_outlined,
                  size: 26,
                ),
                textInputType: TextInputType.number,
              ),
            ),
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
                      if (emailController.text.isEmpty) {
                        showSnackbar("Please enter a valid number");
                      } else {
                        onSave(_formKey2, context);
                      }
                    },
                    child: Center(
                      // alignment: Alignment.bottomCenter,
                      child: Text(
                        "Submit",
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
    );
  }

  void onSave(GlobalKey<FormState> formKey, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      _viewModel.forgetPasswordRequest = ForgetPasswordRequest(
        mobile: emailController.text,
      );
      _viewModel.forgetPassword(
        _viewModel.forgetPasswordRequest,
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

    emailController.dispose();
  }
}
