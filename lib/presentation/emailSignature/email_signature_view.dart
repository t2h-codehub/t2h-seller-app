import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/foundation.dart';


import 'package:screenshot/screenshot.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';





class EmailSignatureView extends StatefulWidget {
  const EmailSignatureView({super.key});

  @override
  State<EmailSignatureView> createState() => _EmailSignatureViewState();
}

class _EmailSignatureViewState extends State<EmailSignatureView> {
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  ScreenshotController screenshotController = ScreenshotController();
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
          "Your email signature",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: getMargin(left: 16, top: 14, right: 16),
          child: Screenshot(
            controller: screenshotController,
            child: Container(
              width: double.infinity,
              // margin: getMargin(left: 16, top: 14, right: 16),
              decoration: AppDecoration.outlineBlack9003f6
                  .copyWith(color: Colors.white),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    padding: getPadding(
                      left: 15,
                      top: 5,
                      right: 15,
                    ),
                    decoration: AppDecoration.gradientGray6007fGray6007f
                        .copyWith(borderRadius: BorderRadius.circular(16)),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: getPadding(
                                left: 8, top: 17, right: 8, bottom: 17),
                            margin: getMargin(right: 16),
                            decoration: AppDecoration.outlineBlack9003f
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder5,
                                    color: Colors.white),
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CachedNetworkImage(
                                      // imageUrl: _userDetailService
                                      //         .userDetailResponse
                                      //         ?.user
                                      //         ?.qrCode ??
                                      //     "",
                                      imageUrl: (_userDetailService.userDetailResponse?.user?.qrCode != null &&
          _userDetailService.userDetailResponse!.user!.qrCode!.isNotEmpty)
      ? (_userDetailService.userDetailResponse!.user!.qrCode!
              .contains(AppConstants.imageBaseUrl)
          ? _userDetailService.userDetailResponse!.user!.qrCode!
          : AppConstants.imageBaseUrl +
              _userDetailService.userDetailResponse!.user!.qrCode!)
      : '',
                                      // svgPath: ImageConstant
                                      //     .imgGroup1000001797BlueGray90001,
                                      height: 100,
                                      width: 100,
                                    ),
                                    Image.asset(
                                        height: 110,
                                        width: 110,
                                        "assets/newIcons/qr_overlay.png")
                                  ],
                                ),
                                SizedBox(height: 12),
                              ],
                            ),
                          ),
                          Padding(
                              padding: getPadding(top: 20, bottom: 16),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                            _userDetailService.userDetailResponse?.user?.name ?? "N/A",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtPoppinsSemiBold12
                                                .copyWith(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      ],
                                    ),
                                    SizedBox(height: 6),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Text(
                                          _userDetailService.userDetailResponse?.user?.designation ?? "Update Designation",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsMedium12
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color(0xFF858585))),
                                    ),
                                    SizedBox(height: 6),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Text(
                                          _userDetailService.userDetailResponse?.user?.companyName ?? "Update Designation",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsMedium12
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color(0xFF858585))),
                                    ),
                                    Padding(
                                        padding: getPadding(top: 8),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.phone_outlined,
                                              size: 20,
                                              color: AppCol.primary,
                                            ),
                                            Text(
                                                " +91 ${_userDetailService.userDetailResponse?.user?.phone ?? "N/A"}",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsMedium10Gray900
                                                    .copyWith(
                                                  fontSize: 14,
                                                )),
                                          ],
                                        )),
                                  ])),
                        ])),
              ]),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            await screenshotController
                .capture(delay: Duration(milliseconds: 10))
                .then((capturedImage) async {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Email Signature saved to gallery")));
              // final result = await ImageGallerySaver.saveImage(
              //     Uint8List.fromList(capturedImage!),
              //     quality: 80,
              //     name: "Email Signature");
           
           
            });
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: ShapeDecoration(
              color: AppCol.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Download Image',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.16,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            await screenshotController
                .capture(delay: Duration(milliseconds: 10))
                .then((capturedImage) async {
              // final result = await ImageGallerySaver.saveImage(
              //     Uint8List.fromList(capturedImage!),
              //     quality: 80,
              //     name: "Email Signature");
              // XFile file = XFile.fromData(capturedImage);
              // Share.shareXFiles([file]);
              // showing the captured widget
            }).catchError((onError) {
              print(onError);
            });
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: AppCol.primary),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Email the Signature',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppCol.primary,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.16,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
