import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/card/models/activate_card_model.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/activate_card/acitvate_card_view_model.dart';
import 'package:taptohello/presentation/activate_card/qr_scanner_view.dart';

class ActivationScreen extends ConsumerStatefulWidget {
  final bool isNfc;
  const ActivationScreen({super.key, required this.isNfc});

  @override
  ConsumerState<ActivationScreen> createState() => _ActivationScreenState();
}

class _ActivationScreenState extends ConsumerState<ActivationScreen>
    with BaseScreenView {
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  late ActivateCardViewModel _viewModel;
  String? _result;
  String id = "";

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(activateCardViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(activateCardViewModel);
    return Scaffold(
      backgroundColor: AppCol.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
              )),
        ),
        title: Text(
          "Activate Hello Device",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          widget.isNfc ? nfcInfo() : qrInfo(),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: getPadding(left: 2, top: 16, bottom: 16),
                    child: Text("Choose profile to Activate with",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsSemiBold12
                            .copyWith(fontSize: 14))),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    // height: getVerticalSize(43),
                    // width: getHorizontalSize(243),

                    margin: getMargin(top: 7),
                    child: Stack(alignment: Alignment.center, children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: getPadding(right: 10),
                              child: Icon(Icons.expand_more))),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              padding: getPadding(
                                  left: 6, top: 5, right: 6, bottom: 5),
                              decoration: AppDecoration.outlineGray500.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5,
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Row(children: [
                                Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppCol.primary,
                                      ),
                                      shape: BoxShape.circle),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(_userDetailService
                                                    .userDetailResponse
                                                    ?.user
                                                    ?.profileImg ??
                                                "https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_640.png"))),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        getPadding(left: 9, top: 7, bottom: 7),
                                    child: Text(
                                        _userDetailService.userDetailResponse
                                                ?.user?.name ??
                                            "",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsMedium12
                                            .copyWith(fontSize: 16)))
                              ])))
                    ])),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (widget.isNfc) {
                      var availability = await FlutterNfcKit.nfcAvailability;
                      if (availability != NFCAvailability.available) {
                        showSnackbar(
                            "Sorry nfc is not available in this device please connect your account using Qr");
                      }

                      var tag = await FlutterNfcKit.poll(
                          timeout: Duration(seconds: 5),
                          iosMultipleTagMessage: "Multiple tags found!",
                          iosAlertMessage: "Scan your tag");

                      print(jsonEncode(tag));
                      if (tag.type == NFCTagType.iso7816) {
                        var result = await FlutterNfcKit.transceive(
                            "00B0950000",
                            timeout: Duration(seconds: 5));
                      }

                      await FlutterNfcKit.setIosAlertMessage("hi there!");

                      if (tag.ndefAvailable!) {
                        var ndefRecords = await FlutterNfcKit.readNDEFRecords();
                        print(ndefRecords.toString());
                        var ndefString = '';
                        for (int i = 0; i < ndefRecords.length; i++) {
                          ndefString += '${i + 1}: ${ndefRecords[i]}\n';
                        }
                        setState(() {
                          _result = ndefString;
                        });
                        int startIndex =
                            _result.toString().indexOf("/profile/") +
                                "/profile/".length;
                        id = _result.toString().substring(startIndex);
                        id = id.replaceAll('\n', '');
                        print(id);
                      }

                      await FlutterNfcKit.finish();
// iOS only: show alert/error message on finish
                      await FlutterNfcKit.finish(iosAlertMessage: "Success");
// or
                      await FlutterNfcKit.finish(iosErrorMessage: "Failed");
                      _viewModel.activateCardRequest = ActivateCardRequest(
                          cardId: id.replaceAll("/n", "").toString());
                      _viewModel.activateCard(
                          _viewModel.activateCardRequest, context);
                    } else {
                      String id = await Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => QRScannerView()));
                      _viewModel.activateCardRequest =
                          ActivateCardRequest(cardId: id.toString());
                      await _viewModel.activateCard(
                          _viewModel.activateCardRequest, context);
                    }
                  },
                  child: Container(
                      margin: getMargin(
                        top: 16,
                      ),
                      width: double.infinity,
                      padding:
                          getPadding(left: 18, top: 9, right: 18, bottom: 9),
                      decoration: AppDecoration.outlineBlack9003f.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                          color: AppCol.primary),
                      child: Padding(
                          padding: getPadding(bottom: 8, top: 8),
                          child: Center(
                            child: Text("Activate",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsSemiBold12.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ))),
                ),
              ]),
        ]),
      ),
    );
  }

  Column nfcInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Activate a Hello Device using NFC",
            style: TextStyle(
                // color: ColorConstant.indigo500,
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600)),
        SizedBox(height: 4),
        Text("Works only in NFC enabled smartphones",
            style: TextStyle(
              // color: ColorConstant.indigo500,
              fontSize: 12,
              fontFamily: 'Roboto',
            )),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
          child: Text(
              "Place your Hello device at the back of your phone and hold the Hello logo in contact with your phone.",
              textAlign: TextAlign.center,
              style: TextStyle(
                // color: ColorConstant.indigo500,
                fontSize: 15,
                fontFamily: 'Roboto',
              )),
        ),
        SizedBox(height: 16),
        Image.asset(
          "assets/images/nfc_activate.png",
          width: 266,
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Column qrInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          child: Text("Activate Hello Device using QR Code printed on Device",
              textAlign: TextAlign.center,
              style: TextStyle(
                  // color: ColorConstant.indigo500,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600)),
        ),
        SizedBox(height: 4),
        Text("Works with all smartphones",
            style: TextStyle(
              // color: ColorConstant.indigo500,
              fontSize: 12,
              fontFamily: 'Roboto',
            )),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
          child: Text(
              "Hold the Qr code printed on your Hello device under the scanner.",
              textAlign: TextAlign.center,
              style: TextStyle(
                // color: ColorConstant.indigo500,
                fontSize: 15,
                fontFamily: 'Roboto',
              )),
        ),
        SizedBox(height: 16),
        Image.asset(
          "assets/images/qr_activate.png",
          width: 266,
        )
      ],
    );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message.toString())));
  }

  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }
}

class ActivateSuccess extends ConsumerStatefulWidget {
  const ActivateSuccess({
    super.key,
  });

  @override
  ConsumerState<ActivateSuccess> createState() => _DeleteSuccessState();
}

class _DeleteSuccessState extends ConsumerState<ActivateSuccess> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(17),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Column(children: [
                Image.asset(
                  "assets/newIcons/succ.png",
                  height: 54,
                ),
                SizedBox(height: 16),
                Text(
                  'Success',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 295,
                  child: Text(
                    "Your Hello device has been successfully activated and connected to your profile!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 44),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 14),
                    decoration: ShapeDecoration(
                      color: AppCol.primary,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: AppCol.primary),
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
