import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/core.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/core/utils/size_utils.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/activate_card/activation_screen.dart';
import 'package:taptohello/presentation/premium/previum_view.dart';
import 'package:taptohello/theme/app_decoration.dart';
import 'package:taptohello/theme/app_style.dart';

class ActivateDeviceScreen extends ConsumerStatefulWidget {
  const ActivateDeviceScreen({super.key});

  @override
  ConsumerState<ActivateDeviceScreen> createState() =>
      _ActivateDeviceScreenState();
}

class _ActivateDeviceScreenState extends ConsumerState<ActivateDeviceScreen> {
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/newIcons/circle_path.png",
                height: 150,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.only(top: 24, bottom: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text("Activate a Hello Device",
                            style: TextStyle(
                                // color: ColorConstant.indigo500,
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Text(
                            "Activate any of your Hello Device and connect your\nprofile with it Instantly to network phygitally\nwith others",
                            style: TextStyle(
                              // color: ColorConstant.indigo500,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  if (AppConstants.eligibility == true) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ActivationScreen(
                              isNfc: true,
                            )));
                  } else {
                    if (_userDetailService
                            .userDetailResponse?.user?.cards?.isEmpty ??
                        true) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ActivationScreen(
                          isNfc: true,
                        ),
                      ));
                    } else if ((_userDetailService
                                .userDetailResponse?.user?.plan?.planType?.title
                                ?.toLowerCase() ==
                            "pro+") ||
                        _userDetailService
                                .userDetailResponse?.user?.plan?.planType?.title
                                ?.toLowerCase() ==
                            "pro") {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ActivationScreen(
                          isNfc: true,
                        ),
                      ));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PremiumView(),
                      ));
                    }
                  }
                },
                child: Column(
                  children: [
                    Container(
                        margin: getMargin(
                          top: 15,
                        ),
                        padding: getPadding(
                            left: 16, top: 16, right: 20, bottom: 16),
                        decoration: AppDecoration.outlineBlack9003f.copyWith(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12)),
                            color: Colors.white),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/newIcons/activ_nfc.png",
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding:
                                              getPadding(top: 7, bottom: 2),
                                          child: Text(
                                              "NFC - Near Field Communication",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsSemiBold12
                                                  .copyWith(
                                                fontSize: 16,
                                              ))),
                                      Padding(
                                          padding: getPadding(bottom: 6),
                                          child: Text(
                                              "Works only in NFC enabled smartphones",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsSemiBold12
                                                  .copyWith(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.normal))),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF858585),
                                size: 20,
                              )
                            ])),
                    Container(
                        margin: getMargin(
                          top: 2,
                        ),
                        padding: getPadding(
                            left: 16, top: 16, right: 20, bottom: 16),
                        decoration: AppDecoration.outlineBlack9003f.copyWith(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                            color: Colors.white),
                        child: Padding(
                            padding: getPadding(bottom: 6),
                            child: Text(
                                "Place your Hello device at the back of your smartphone and hold the Hello device QR code in contact with your phone’s NFC zone. Now press “Activate” and wait till the activation process gets completed and confirmation message appears.",
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsSemiBold12.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal)))),
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  if (AppConstants.eligibility == true) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ActivationScreen(
                              isNfc: false,
                            )));
                  } else {
                    if ((_userDetailService
                            .userDetailResponse?.user?.cards?.isEmpty ??
                        true)) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ActivationScreen(
                          isNfc: false,
                        ),
                      ));
                    } else if ((_userDetailService
                                .userDetailResponse?.user?.plan?.planType?.title
                                ?.toLowerCase() ==
                            "pro+") ||
                        (_userDetailService
                                .userDetailResponse?.user?.plan?.planType?.title
                                ?.toLowerCase() ==
                            "pro")) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ActivationScreen(
                          isNfc: false,
                        ),
                      ));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PremiumView(),
                      ));
                    }
                  }
                },
                child: Column(
                  children: [
                    Container(
                        margin: getMargin(
                          top: 15,
                        ),
                        padding: getPadding(
                            left: 16, top: 16, right: 20, bottom: 16),
                        decoration: AppDecoration.outlineBlack9003f.copyWith(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12)),
                            color: Colors.white),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/newIcons/activ_qr.png",
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding:
                                              getPadding(top: 7, bottom: 2),
                                          child: Text(
                                              "QR Code printed on Device",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsSemiBold12
                                                  .copyWith(
                                                fontSize: 16,
                                              ))),
                                      Padding(
                                          padding: getPadding(bottom: 6),
                                          child: Text(
                                              "Works with all smartphones",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsSemiBold12
                                                  .copyWith(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.normal))),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF858585),
                                size: 20,
                              )
                            ])),
                    Container(
                        margin: getMargin(
                          top: 2,
                        ),
                        padding: getPadding(
                            left: 16, top: 16, right: 20, bottom: 16),
                        decoration: AppDecoration.outlineBlack9003f.copyWith(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                            color: Colors.white),
                        child: Padding(
                            padding: getPadding(bottom: 6),
                            child: Text(
                                "Hold the QR code printed on your Hello device under the scanner and press “Activate” and wait till the activation process gets completed and confirmation message appears.",
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsSemiBold12.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal)))),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
