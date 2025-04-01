
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/data/auth/model/registration.dart';
import 'package:taptohello/data/auth/model/send_otp.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

class VerifyPhoneView extends ConsumerStatefulWidget {
  final String? name;
  final String? email;
  final String? password;
  final String? uuid;

  const VerifyPhoneView(
      {super.key, this.name, this.email, this.uuid = "", this.password});

  @override
  ConsumerState<VerifyPhoneView> createState() => _VerifyPhoneViewState();
}

class _VerifyPhoneViewState extends ConsumerState<VerifyPhoneView>
    with BaseScreenView {
  TextEditingController entermobilenumbController = TextEditingController();
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
                              "assets/newIcons/phone_head.png",
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
                "Verify Phone Number",
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
                  "Please enter your phone number to receive the OTP for verification",
                  // overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtPoppinsBold15
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextFormField(
                autoFocus: true,
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                  child: Text("+91 |"),
                ),
                maxlength: 10,
                controller: entermobilenumbController,
                hintText: "Enter phone number",
                label: "Phone Number",
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
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      padding: getPadding(
                        left: 24,
                        top: 16,
                        right: 24,
                        bottom: 16,
                      ),
                     
                     
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
                      if (entermobilenumbController.text.isEmpty ||
                          entermobilenumbController.text.length != 10) {
                        showSnackbar("Please enter a valid mobile number");
                      } else {
                        onSave(_formKey2, context);
                      }
                    },
                    child: Center(
                      // alignment: Alignment.bottomCenter,
                      child: Text(
                        "Send OTP",
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

  Future<void> loadCertificate() async {
  SecurityContext securityContext = SecurityContext.defaultContext;
  final ByteData certData = await rootBundle.load('assets/api_taptohello_com.pem');
  securityContext.setTrustedCertificatesBytes(certData.buffer.asUint8List());
  print("Certificate loaded successfully!");
}

Future<void> apiCall() async {
  Dio dio = Dio(
  BaseOptions(
    baseUrl: "https://api.mysocio.shop",
  ),
);

// Disable SSL verification (TEMPORARY SOLUTION)
(dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    (HttpClient client) {
  client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  return client;
};

try {
  final response = await dio.post("/user/register", data: {
    "name": "akshay",
    "email": "akshay78900@email.com",
    "phone": "8787878712",
    "fcm": "",
    "password": "akshay8443"
  });

  print("Response: ${response.data}");
} catch (e) {
  print("Dio Error: $e");
}

}

  void onSave(GlobalKey<FormState> formKey, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (widget.uuid == "") {
        _viewModel.reqistrationRequest = ReqistrationRequest(
            email: widget.email,
            password: widget.password,
            name: widget.name,
            fcm: AppConstants.fcmToken,
            phone: entermobilenumbController.text);
            await loadCertificate();
        await _viewModel.register(
          _viewModel.reqistrationRequest,
          context,
        );
      // await apiCall();
      } else {
        await _viewModel.sendOtp(
            OtpRequest(
              mobile: "91${entermobilenumbController.text}",
            ),
            context,
            entermobilenumbController.text,
            widget.uuid);
      }
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

    entermobilenumbController.dispose();
  }
}
