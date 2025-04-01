import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/auth/model/otp_verify.dart';
import 'package:taptohello/data/auth/model/send_otp.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';

class VerifyOtpView extends ConsumerStatefulWidget {
  final String mobileNo;
  final String? uuid;

  const VerifyOtpView({
    required this.mobileNo,
    this.uuid,
    super.key,
  });

  @override
  ConsumerState<VerifyOtpView> createState() => _VerifyPhoneViewState();
}

class _VerifyPhoneViewState extends ConsumerState<VerifyOtpView>
    with BaseScreenView {
  TextEditingController entermobilenumbController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AuthViewModel _viewModel;
  int secondsRemaining = 60;
  bool enableResend = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(authViewModel);
    return Scaffold(
      body: Column(
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
                              padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
                              child: Icon(
                                Icons.arrow_back,
                                color: AppCol.primary,
                              ),
                            ),
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
              "Phone Verification",
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
                "Enter the OTP sent on your registered phone number",
                // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppStyle.txtPoppinsBold15
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          ),
         
         
      SizedBox(height: 10),
          Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.mobileNo}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.edit, color: AppCol.primary),
              onPressed:() {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
          SizedBox(height: 20),
          pinField(),
          Container(
            margin: getMargin(top: 16, left: 16, right: 16),
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
                    if (widget.uuid == "") {
                      _viewModel.otpVerifyRequest = OtpVerifyRequest(
                          otp: int.parse(entermobilenumbController.text),
                          userNumber: widget.mobileNo,
                          authKey: "");
                      _viewModel.verifyOtp(
                        _viewModel.otpVerifyRequest,
                        context,
                      );
                    } else {
                      _viewModel.otpVerifyRequest = OtpVerifyRequest(
                          otp: int.parse(entermobilenumbController.text),
                          userNumber: widget.mobileNo,
                          authKey: widget.uuid);
                      _viewModel.verifyOtp(
                        _viewModel.otpVerifyRequest,
                        context,
                      );
                    }
                   
                   
                  },
                  child: Center(
                    // alignment: Alignment.bottomCenter,
                    child: Text(
                      "Verify",
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: enableResend ? _resendCode : null,
                  child: Row(
                    children: [
                      Text(
                        "Didn’t receive an OTP? ",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF666666)),
                      ),
                      Text(
                        "Resend",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF666666)),
                      ),
                    ],
                  ),
                ),
                Text(
                  "$secondsRemaining Sec",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF05323)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _resendCode() {
    //other code here
    _viewModel.resendOtp(OtpRequest(mobile: widget.mobileNo), context,
        widget.mobileNo, widget.uuid);
    setState(() {
      secondsRemaining = 60;
      enableResend = false;
    });
  }

  
  

  Widget pinField() {
    final defaultPinTheme = PinTheme(
      width: 70,
      height: 56,
      margin: EdgeInsets.only(right: 8),
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      controller: entermobilenumbController,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return s?.length == 4 ? null : 'Please enter the pin';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
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

    timer?.cancel();

    super.dispose();
  }
}
