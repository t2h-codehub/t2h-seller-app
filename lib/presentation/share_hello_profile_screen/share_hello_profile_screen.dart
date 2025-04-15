import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:share_plus/share_plus.dart';


import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/choose_profile/choose_profile_view.dart';
import 'package:taptohello/presentation/customBranding/custom_branding_view.dart';
import 'package:taptohello/presentation/settings_screen/settings_screen.dart';
import 'package:taptohello/services/shared_preference_service.dart';

class ShareHelloProfileScreen extends StatefulWidget {
  const ShareHelloProfileScreen({super.key});

  @override
  State<ShareHelloProfileScreen> createState() =>
      _ShareHelloProfileScreenState();
}

class _ShareHelloProfileScreenState extends State<ShareHelloProfileScreen>
    with BaseScreenView {
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  bool isShare = false;
  String qrColor = "";
  int val = 0;

  @override
  void initState() {
    getColor();
    super.initState();
  }

  getColor() {
    qrColor = SharedPreferenceService.getString('qrColor') ?? '';
    print('My qr color: $qrColor');
    // hexStringToHexInt(qrColor);
  }

  hexStringToHexInt(String hex) {
    hex = hex.replaceFirst('#', '');
    hex = hex.length == 6 ? 'ff$hex' : hex;
    int val = int.parse(hex, radix: 16);
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppCol.bgColor,
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset("assets/newIcons/setting.png"),
                  ),
                ),
              ],
              title: Text(
                "Share Profile",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              centerTitle: true,
            ),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(top: 17),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) => ChooseProfileView(),
                                  ))
                                      .then((value) {
                                    setState(() {});
                                  });
                                },
                                child: Container(
                                    margin: getMargin(left: 16, right: 16),
                                    padding:
                                        getPadding(left: 16, right: 16, top: 8),
                                    decoration: AppDecoration.outlineBlack9003f
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder5,
                                            color: Colors.white),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              // height: getVerticalSize(43),
                                              // width: getHorizontalSize(243),
                                              margin: getMargin(top: 7),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Icon(
                                                          Icons.expand_more,
                                                          color:
                                                              Color(0xFF858585),
                                                        )),
                                                    Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                            padding: getPadding(
                                                                top: 5,
                                                                bottom: 5),
                                                            decoration: AppDecoration
                                                                .outlineGray500
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .roundedBorder5,
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .transparent)),
                                                            child: Row(
                                                                children: [
                                                                  Container(
                                                                    height: 40,
                                                                    width: 40,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        image: DecorationImage(
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image: NetworkImage(_userDetailService.userDetailResponse?.user?.profileImg ?? "https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_640.png"))),
                                                                  ),
                                                                  Padding(
                                                                      padding: getPadding(
                                                                          left:
                                                                              9,
                                                                          top:
                                                                              7,
                                                                          bottom:
                                                                              7),
                                                                      child: Text(
                                                                          _userDetailService.userDetailResponse?.user?.name ??
                                                                              "",
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          textAlign: TextAlign
                                                                              .left,
                                                                          style: AppStyle
                                                                              .txtPoppinsMedium12
                                                                              .copyWith(fontSize: 16)))
                                                                ])))
                                                  ])),
                                          SizedBox(
                                            height: 16,
                                          )
                                        ])),
                              ),
                              Container(
                                padding: getPadding(
                                    left: 8, top: 17, right: 8, bottom: 17),
                                margin: getMargin(left: 16, top: 15, right: 16),
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
                                        Image.network(
                                          _userDetailService.userDetailResponse
                                                  ?.user?.qrCode ??
                                              "",
                                          // svgPath: ImageConstant
                                          //     .imgGroup1000001797BlueGray90001,
                                          height: 150,
                                          width: 160,
                                          // color: ,
                                        ),
                                        Image.asset(
                                            height: 157,
                                            width: 130,
                                            "assets/newIcons/qr_overlay.png")
                                      ],
                                    ),
                                    
                                    // SizedBox(height: 12),
                                    // InkWell(
                                    //   onTap: () {
                                    //     bool? isBranding = _userDetailService
                                    //             .userDetailResponse
                                    //             ?.user
                                    //             ?.isCustomBranding ??
                                    //         false;
                                    //     if (isBranding) {
                                    //       Navigator.of(context)
                                    //           .push(MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             CustomBrandingView(),
                                    //       ));
                                    //     } else {
                                    //       showSnackbar(
                                    //           "Please enable custom branding from edit profile section");
                                    //     }
                                    //   },
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.center,
                                    //     children: [
                                    //       Container(
                                    //         padding: getPadding(
                                    //             left: 32,
                                    //             top: 17,
                                    //             right: 32,
                                    //             bottom: 17),
                                    //         decoration: AppDecoration
                                    //             .outlineBlack9003f
                                    //             .copyWith(
                                    //                 borderRadius:
                                    //                     BorderRadiusStyle
                                    //                         .roundedBorder5,
                                    //                 border: Border.all(
                                    //                     color:
                                    //                         Color(0xFFF05323))),
                                    //         child: Row(children: [
                                    //           Text("Edit HelloCode™ with",
                                    //               style: AppStyle
                                    //                   .txtPoppinsSemiBold12
                                    //                   .copyWith(
                                    //                       fontSize: 14,
                                    //                       color: Color(
                                    //                           0xFFF05323))),
                                    //           Text(" Pro",
                                    //               style: AppStyle
                                    //                   .txtPoppinsSemiBold12
                                    //                   .copyWith(
                                    //                       fontSize: 14,
                                    //                       fontWeight:
                                    //                           FontWeight.bold,
                                    //                       color: Color(
                                    //                           0xFFF05323))),
                                    //           SizedBox(width: 8),
                                    //           Image.asset(
                                    //             "assets/newIcons/premium.png",
                                    //             height: 16,
                                    //             width: 18,
                                    //           )
                                    //         ]),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        Clipboard.setData(ClipboardData(
                                                text: (_userDetailService
                                                                .userDetailResponse
                                                                ?.user
                                                                ?.username !=
                                                            "" &&
                                                        _userDetailService
                                                                .userDetailResponse
                                                                ?.user
                                                                ?.username !=
                                                            null)
                                                    ? "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}"
                                                    : "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.id}"))
                                            .then((_) {
                                          print(
                                              "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.id}");
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Profile copied to clipboard")));
                                        });
                                      },
                                      child: Container(
                                          width: double.infinity,
                                          padding: getPadding(
                                              left: 18,
                                              top: 18,
                                              right: 18,
                                              bottom: 18),
                                          decoration: AppDecoration
                                              .outlineBlack9003f
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder5),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Image.asset(
                                                    "assets/newIcons/copy.png",
                                                    height: 20),
                                                Padding(
                                                    padding: getPadding(
                                                      left: 11,
                                                      top: 4,
                                                    ),
                                                    child: Text(
                                                        "Copy Profile Link",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsSemiBold12
                                                            .copyWith(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppCol
                                                                    .primary)))
                                              ])),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {},
                                child: Container(
                                    padding: getPadding(
                                        left: 8, top: 17, right: 8, bottom: 17),
                                    margin:
                                        getMargin(left: 16, top: 15, right: 16),
                                    decoration: AppDecoration.outlineBlack9003f
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder5,
                                            color: Colors.white),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              await Permission.storage
                                                  .request();
                                              var response = await Dio().get(
                                                  _userDetailService
                                                          .userDetailResponse
                                                          ?.user
                                                          ?.qrCode ??
                                                      "",
                                                  options: Options(
                                                      responseType:
                                                          ResponseType.bytes));
                                              
                                              

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Qr saved to gallery")));
                                            },
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 10,
                                                    right: 10,
                                                    top: 3),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(children: [
                                                      Image.asset(
                                                        "assets/newIcons/save_qr.png",
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 13),
                                                          child: Text(
                                                              "Save HelloCode™ to Photos",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsSemiBold12
                                                                  .copyWith(
                                                                      fontSize:
                                                                          16)))
                                                    ]),
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Color(0xFF858585),
                                                      size: 20,
                                                    )
                                                  ],
                                                )),
                                          ),
                                          Padding(
                                              padding: getPadding(top: 14),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color: AppCol.bgColor)),
                                          InkWell(
                                            onTap: () {
                                              (_userDetailService
                                                              .userDetailResponse
                                                              ?.user
                                                              ?.username !=
                                                          "" &&
                                                      _userDetailService
                                                              .userDetailResponse
                                                              ?.user
                                                              ?.username !=
                                                          null)
                                                  ? launchUrl(Uri.parse(
                                                      "https://api.whatsapp.com/send?text=Check out my profile ${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}"))
                                                  : launchUrl(Uri.parse(
                                                      "https://api.whatsapp.com/send?text=Check out my profile ${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.id}"));
                                            },
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 9,
                                                    top: 17,
                                                    right: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "assets/how/whatsapp.png",
                                                            height: 40,
                                                            width: 40,
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 12),
                                                              child: Text(
                                                                  "Share Profile with WhatsApp",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtPoppinsSemiBold12
                                                                      .copyWith(
                                                                          fontSize:
                                                                              16)))
                                                        ]),
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Color(0xFF858585),
                                                      size: 20,
                                                    )
                                                  ],
                                                )),
                                          ),
                                          Padding(
                                              padding: getPadding(top: 16),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color: AppCol.bgColor)),
                                          InkWell(
                                            onTap: () {

                                              Share.share(
                                                  "Check out my Shop Profile ${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}");
                                              (_userDetailService
                                                  .userDetailResponse
                                                  ?.user
                                                  ?.username !=
                                                  "" &&
                                                  _userDetailService
                                                      .userDetailResponse
                                                      ?.user
                                                      ?.username !=
                                                      null)
                                                  ? launchUrl(Uri.parse(
                                                  "Check out my Shop Profile ${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}"))
                                                  : launchUrl(Uri.parse(
                                                  "Check out my Shop Profile ${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.id}"));
                                              // launchUrl(Uri.parse(
                                              //     "https://instagram.com/"));
                                            },
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 9,
                                                    top: 16,
                                                    right: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(children: [
                                                      Image.asset(
                                                        "assets/newIcons/share_insta.png",
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 12),
                                                          child: Text(
                                                              "Share Profile with Instagram",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsSemiBold12
                                                                  .copyWith(
                                                                      fontSize:
                                                                          16)))
                                                    ]),
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Color(0xFF858585),
                                                      size: 20,
                                                    )
                                                  ],
                                                )),
                                          )
                                        ])),
                              ),
                              Container(
                                  margin:
                                      getMargin(left: 16, top: 15, right: 16),
                                  padding: getPadding(
                                      left: 7, top: 19, right: 7, bottom: 19),
                                  decoration: AppDecoration.outlineBlack9003f
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5,
                                          color: Colors.white),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            final Uri emailLaunchUri = Uri(
                                              scheme: 'mailto',
                                              path: '',
                                              queryParameters: {
                                                'subject':
                                                    'Checkout my Hello profile',
                                                'body': (_userDetailService
                                                                .userDetailResponse
                                                                ?.user
                                                                ?.username !=
                                                            "" &&
                                                        _userDetailService
                                                                .userDetailResponse
                                                                ?.user
                                                                ?.username !=
                                                            null)
                                                    ? "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}"
                                                    : "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.id}"
                                              },
                                            );
                                            launchUrl(emailLaunchUri);
                                          },
                                          child: Padding(
                                              padding: getPadding(
                                                  left: 10, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(children: [
                                                    Image.asset(
                                                      "assets/newIcons/share_email.png",
                                                      height: 40,
                                                      width: 40,
                                                    ),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 12),
                                                        child: Text(
                                                            "Share Profile with Email",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsSemiBold12
                                                                .copyWith(
                                                                    fontSize:
                                                                        16)))
                                                  ]),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Color(0xFF858585),
                                                    size: 20,
                                                  )
                                                ],
                                              )),
                                        ),
                                        Padding(
                                            padding: getPadding(top: 15),
                                            child: Divider(
                                              height: getVerticalSize(1),
                                              thickness: getVerticalSize(1),
                                              color: AppCol.bgColor,
                                            )),
                                        InkWell(
                                          onTap: () {
                                            Clipboard.setData(ClipboardData(
                                                    text: (_userDetailService
                                                                    .userDetailResponse
                                                                    ?.user
                                                                    ?.username !=
                                                                "" &&
                                                            _userDetailService
                                                                    .userDetailResponse
                                                                    ?.user
                                                                    ?.username !=
                                                                null)
                                                        ? "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}"
                                                        : "${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.id}"))
                                                .then((_) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Profile copied to clipboard!')));
                                            });
                                          },
                                          child: Padding(
                                              padding: getPadding(
                                                  left: 10, top: 22, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(children: [
                                                    Image.asset(
                                                      "assets/newIcons/share_text.png",
                                                      height: 40,
                                                      width: 40,
                                                    ),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 12),
                                                        child: Text(
                                                            "Share Profile with Text",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsSemiBold12
                                                                .copyWith(
                                                                    fontSize:
                                                                        16)))
                                                  ]),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Color(0xFF858585),
                                                    size: 20,
                                                  )
                                                ],
                                              )),
                                        ),
                                      
                                      
                                        Padding(
                                            padding: getPadding(top: 20),
                                            child: Divider(
                                                height: getVerticalSize(1),
                                                thickness: getVerticalSize(1),
                                                color: AppCol.bgColor,
                                                indent: getHorizontalSize(2))),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            Share.share((_userDetailService
                                                            .userDetailResponse
                                                            ?.user
                                                            ?.username !=
                                                        "" &&
                                                    _userDetailService
                                                            .userDetailResponse
                                                            ?.user
                                                            ?.username !=
                                                        null)
                                                ? "Check out my Hello profile ${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.username}"
                                                : "Check out my Hello profile ${AppConstants.storeUrl}${_userDetailService.userDetailResponse?.user?.id}");
                                          },
                                          child: Padding(
                                              padding: getPadding(
                                                  left: 10,
                                                  top: 22,
                                                  right: 10,
                                                  bottom: 2),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(children: [
                                                    Image.asset(
                                                      "assets/newIcons/share_other.png",
                                                      height: 40,
                                                      width: 40,
                                                    ),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 12),
                                                        child: Text(
                                                            "Share Profile by Another Way",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsSemiBold12
                                                                .copyWith(
                                                                    fontSize:
                                                                        16)))
                                                  ]),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Color(0xFF858585),
                                                    size: 20,
                                                  )
                                                ],
                                              )),
                                        ),
                                      ])),
                              SizedBox(
                                height: 20,
                              )
                            ]))))));
  }

  onTapArrowleft12(BuildContext context) {
    Navigator.pop(context);
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
}
