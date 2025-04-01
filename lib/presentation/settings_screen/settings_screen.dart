import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/core.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/shared_pref_service.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/activate_card/activate_device_screen.dart';
import 'package:taptohello/presentation/premium/previum_view.dart';
import 'package:taptohello/presentation/shop/shop.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/presentation/sign_in_screen/sign_in_screen.dart';

// ignore_for_file: must_be_immutable
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController groupseventyoneController = TextEditingController();
  final UserDetailService _userDetailService = getIt<UserDetailService>();

  bool quickIntro = false;
  bool buddy = false;
  int percent = 0;
  int num = 0;
  double width = 0.0;
  String userId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getValue(context);
    });
    // getUserId();
  }

  void getValue(BuildContext context) {
    if (_userDetailService.userDetailResponse?.user?.profileImg != null &&
        _userDetailService.userDetailResponse?.user?.profileImg != "") {
      percent = percent + 14;
      num = num + 1;
      setState(() {});
    }
    if (_userDetailService.userDetailResponse?.user?.phone != null &&
        _userDetailService.userDetailResponse?.user?.phone != "") {
      percent = percent + 14;
      num = num + 1;
      setState(() {});
    }
    if (_userDetailService.userDetailResponse?.user?.name != null &&
        _userDetailService.userDetailResponse?.user?.name != "") {
      percent = percent + 14;
      num = num + 1;
      setState(() {});
    }
    if (_userDetailService.userDetailResponse?.user?.bio != null &&
        _userDetailService.userDetailResponse?.user?.bio != "") {
      percent = percent + 14;
      num = num + 1;
      setState(() {});
    }
    if (_userDetailService.userDetailResponse?.user?.companyName != null &&
        _userDetailService.userDetailResponse?.user?.companyName != "") {
      percent = percent + 14;
      num = num + 1;
      setState(() {});
    }
    if (_userDetailService.userDetailResponse?.user?.designation != null &&
        _userDetailService.userDetailResponse?.user?.designation != "") {
      percent = percent + 14;
      setState(() {});

      num = num + 1;
    }
    if (_userDetailService.userDetailResponse?.user?.email != null &&
        _userDetailService.userDetailResponse?.user?.email != "") {
      percent = percent + 14;
      num = num + 1;
      setState(() {});
    }
    if (num == 7) {
      percent = 100;
      width = MediaQuery.of(context).size.width;
    }
    if (num == 6) {
      width = MediaQuery.of(context).size.width / 1.8;
    }
    if (num == 5) {
      width = MediaQuery.of(context).size.width / 1.8;
    }
    if (num == 4) {
      width = MediaQuery.of(context).size.width / 2;
    }
    if (num == 3) {
      width = MediaQuery.of(context).size.width / 2.3;
    }
    if (num == 2) {
      width = MediaQuery.of(context).size.width / 2.8;
    }
    if (num == 1) {
      width = 14;
    }
    if (num == 0) {
      width = 1;
    }
    setState(() {});
  }

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
            "Settings",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
            width: size.width,
            child: SingleChildScrollView(
                child: Padding(
                    padding: getPadding(top: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          /// Complete my hello profile
                          InkWell(
                            onTap: () {
                               /// Route analytics screen
                              /*Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AnalyticsScreen(),
                                ),
                              );*/
                            },
                            child: Container(
                                margin: getMargin(left: 16, top: 13, right: 16),
                                padding: getPadding(
                                    left: 19, top: 10, right: 19, bottom: 10),
                                decoration: AppDecoration.outlineBlack9003f
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder5,
                                        color: Colors.white),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: getPadding(left: 3, top: 2),
                                          child: Text(
                                              "Complete your Hello Profile",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsSemiBold12
                                                  .copyWith(fontSize: 18))),
                                      Row(
                                        children: [
                                          _userDetailService.userDetailResponse
                                                      ?.user?.profileImg !=
                                                  null
                                              ? Container(
                                                  height: 64,
                                                  width: 64,
                                                  margin: getMargin(
                                                    top: 16,
                                                    bottom: 23,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: AppCol.gray700,
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              _userDetailService
                                                                      .userDetailResponse
                                                                      ?.user
                                                                      ?.profileImg ??
                                                                  "")),
                                                      shape: BoxShape.circle))
                                              : Container(
                                                  height: 64,
                                                  width: 64,
                                                  margin: getMargin(
                                                    top: 16,
                                                    bottom: 16,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: AppCol.gray700,
                                                      shape: BoxShape.circle)),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _userDetailService
                                                        .userDetailResponse
                                                        ?.user
                                                        ?.name ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                _userDetailService
                                                        .userDetailResponse
                                                        ?.user
                                                        ?.designation ??
                                                    "Update Designation",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF858585)),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Stack(children: [
                                       
                                       
                                        Container(
                                          height: 10,
                                          // width: getHorizontalSize(240),
                                          decoration: AppDecoration
                                              .outlineGray50001
                                              .copyWith(
                                                  color: Color(0xFFF0F1F6),
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder5,
                                                  border: Border.all(
                                                      color:
                                                          Colors.transparent)),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppCol.primary,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          height: 10,
                                          width: width,
                                        ),
                                      ]),
                                      SizedBox(height: 10),
                                      Padding(
                                          padding: getPadding(
                                              left: 4, top: 7, right: 1),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding: getPadding(top: 1),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                            "Profile completed : ",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsRegular10
                                                                .copyWith(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                        Text("$percent%",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsRegular10
                                                                .copyWith(
                                                                    fontSize:
                                                                        14,
                                                                    color: AppCol
                                                                        .primary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                      ],
                                                    )),
                                                Padding(
                                                    padding:
                                                        getPadding(bottom: 1),
                                                    child: Text(
                                                        "$num/7 tasks done",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsRegular10
                                                            .copyWith(
                                                                fontSize: 12)))
                                              ])),
                                      SizedBox(height: 10),
                                    ])),
                          ),

                        
                        

                          /// Business contact info
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: double.infinity,
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 15),
                              padding: EdgeInsets.only(top: 14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                children: [
                                  /// Business & Contact Info
                                  Image.asset(
                                    'assets/newIcons/Briefcase.png',
                                    height: 60,
                                    width: 60,
                                  ),

                                  /// Business & Contact Info Text
                                  Text(
                                    'Business & Contact Info',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 8),

                                  /// Business & Contact Info title
                                  Text(
                                    'Manage basic Business and Contact details',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),

                                  SizedBox(height: 18),
                                ],
                              ),
                            ),
                          ),

                          /// Buy a hello device
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ShopWebview(),
                              ));
                            },
                            child: Container(
                                margin: getMargin(left: 16, top: 15, right: 16),
                                padding: getPadding(
                                    left: 8, top: 11, right: 8, bottom: 11),
                                decoration: AppDecoration.outlineBlack9003f
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder5,
                                        color: Colors.white),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      /// Buy a Hello Device
                                      Padding(
                                          padding: getPadding(
                                            left: 13,
                                            top: 3,
                                          ),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/newIcons/buy.png",
                                                      height: 40,
                                                    ),
                                                    SizedBox(
                                                      width: 16,
                                                    ),
                                                    Padding(
                                                        padding: getPadding(
                                                            top: 5, bottom: 6),
                                                        child: Text(
                                                            "Buy a Hello Device",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsSemiBold12
                                                                .copyWith(
                                                                    fontSize:
                                                                        16))),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF858585),
                                                  size: 20,
                                                )
                                              ])),

                                      /// Divider
                                      Padding(
                                          padding: getPadding(top: 8),
                                          child: Divider(
                                              height: getVerticalSize(1),
                                              thickness: getVerticalSize(1),
                                              color: AppCol.bgColor)),

                                      /// Activate a Hello Device
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                ActivateDeviceScreen(),
                                          ));
                                        },
                                        child: Padding(
                                            padding: getPadding(
                                              left: 13,
                                              top: 11,
                                            ),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/newIcons/activ.png",
                                                        height: 40,
                                                      ),
                                                      SizedBox(
                                                        width: 16,
                                                      ),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 4,
                                                              bottom: 7),
                                                          child: Text(
                                                              "Activate a Hello Device",
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
                                                                          16))),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      size: 20,
                                                      color: Color(0xFF858585),
                                                    ),
                                                  )
                                                ])),
                                      ),

                                     
                                     
                                    ])),
                          ),
                          //new ui

                          /// Upgrade to Pro
                          Visibility(
                            visible: AppConstants.eligibility == true,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PremiumView(),
                                ));
                              },
                              child: Container(
                                  margin:
                                      getMargin(left: 16, top: 15, right: 16),
                                  padding: getPadding(
                                      left: 8, top: 11, right: 8, bottom: 11),
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
                                        /// Upgarde to pro
                                        Padding(
                                            padding: getPadding(
                                              left: 13,
                                              top: 3,
                                            ),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/newIcons/upgrade.png",
                                                        height: 40,
                                                      ),
                                                      SizedBox(
                                                        width: 16,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 5,
                                                                      bottom:
                                                                          6),
                                                              child: Text(
                                                                  "Upgrade to",
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
                                                                              16))),
                                                          Text(" Pro",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsSemiBold12
                                                                  .copyWith(
                                                                      color: Color(
                                                                          0xFFF05323),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      fontSize:
                                                                          16)),
                                                          Image.asset(
                                                            "assets/newIcons/premium.png",
                                                            height: 14,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      size: 20,
                                                      color: Color(0xFF858585),
                                                    ),
                                                  )
                                                ])),

                                      
                                      
                                      ])),
                            ),
                          ),

               
               

                          /// Delete Account
                          Container(
                              margin: getMargin(left: 16, top: 15, right: 16),
                              padding: getPadding(
                                  left: 8, top: 11, right: 8, bottom: 11),
                              decoration: AppDecoration.outlineBlack9003f
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder5,
                                      color: Colors.white),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => DeleteAccount(),
                                        );
                                      },
                                      child: Padding(
                                          padding: getPadding(
                                            left: 13,
                                            top: 11,
                                          ),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset(
                                                      "assets/newIcons/deleteAcc.png",
                                                      height: 40,
                                                    ),
                                                    SizedBox(
                                                      width: 16,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        bottom:
                                                                            6),
                                                                child: Text(
                                                                    "Delete Account",
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
                                                                                16))),
                                                          ],
                                                        ),
                                                        Container(
                                                          constraints: BoxConstraints(
                                                              maxWidth: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  1.6),
                                                          child: Text(
                                                              "This will delete your account permanently, and you will not be able to network smarter for a greener environment and save trees.",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsSemiBold12
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Color(
                                                                          0xFF666666),
                                                                      fontSize:
                                                                          12)),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20.0),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 20,
                                                    color: Color(0xFF858585),
                                                  ),
                                                )
                                              ])),
                                    ),
                                  ])),
                         
                         

                          /// Footer Section
                          Container(
                              margin: getMargin(top: 32),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "TaptoHello ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500)),
                                    TextSpan(
                                        text: "| Version 1.0.0\n",
                                        style: TextStyle(
                                            color: AppCol.gray900,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: "Terms ",
                                        style: TextStyle(
                                            color: AppCol.indigo500,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500),
                                            recognizer:  TapGestureRecognizer()
                                            ..onTap = () {
                                            ;
                                               launchUrl(Uri.parse(
                                  "${AppConstants.websiteUrl}terms"));
                                  
                                            },
                                            
                                            ),
                                    TextSpan(
                                        text: "& ",
                                        style: TextStyle(
                                            color: AppCol.gray900,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: "Privacy",
                                        style: TextStyle(
                                            color: AppCol.indigo500,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500),
                                            recognizer:  TapGestureRecognizer()
                                            ..onTap = () {
                                              
                                               launchUrl(Uri.parse(
                                  "${AppConstants.websiteUrl}privacy"));
                                            },
                                            
                                            )
                                  ]),
                                  textAlign: TextAlign.center)),
                          SizedBox(
                            height: 50,
                          )
                        ])))));
  }

  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({
    super.key,
  });

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  int indexSelected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    indexSelected = AppConstants.selectedIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.all(17),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.close,
                  color: Color(0xFF000000).withOpacity(0.70),
                ),
              )
            ]),
            Text(
              "Select Language",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              "Select your  preferred language for text sections on edit profile screen for a seamless experience.",
              style: TextStyle(fontSize: 15, color: Color(0xFF666666)),
            ),
            SizedBox(height: 25),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: AppConstants.languageList.length,
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.black),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    indexSelected = index;
                    setState(() {});
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppConstants.languageList[index],
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.18,
                          ),
                        ),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 1,
                                top: 1,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: ShapeDecoration(
                                    shape: OvalBorder(
                                      side: BorderSide(
                                          width: 0.75,
                                          color: Color(0xFF858585)),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: indexSelected == index,
                                child: Positioned(
                                  left: 6.50,
                                  top: 6.50,
                                  child: Container(
                                    width: 11,
                                    height: 11,
                                    decoration: ShapeDecoration(
                                      color: AppCol.primary,
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                SharedPreferenceService.setInt("language", indexSelected);
                AppConstants.selectedIndex = indexSelected;
                setState(() {});
                Navigator.of(context).pop();
              },
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: ShapeDecoration(
                  color: AppCol.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Proceed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ]),
        ),
      ),
    );
  }
}

class DeleteAccount extends ConsumerStatefulWidget {
  const DeleteAccount({
    super.key,
  });

  @override
  ConsumerState<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends ConsumerState<DeleteAccount> {
  int indexSelected = 0;
  bool val1 = false;
  bool val2 = false;
  bool val3 = false;
  bool val4 = false;
  bool val5 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    indexSelected = AppConstants.selectedIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(17),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: SingleChildScrollView(
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      color: Color(0xFF000000).withOpacity(0.70),
                    ),
                  )
                ]),
                Text(
                  'Delete Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 295,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Do you really want to ',
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'DELETE',
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: ' your Hello Account and profile permanently?',
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 44),
                Row(
                  children: [
                    Checkbox(
                        activeColor: AppCol.primary,
                        value: val1,
                        onChanged: (value) {
                          val1 = value ?? false;
                          val5 = false;

                          setState(() {});
                        }),
                    Text(
                      'I am not comfortable in paying charges \nanymore.',
                      style: TextStyle(
                        color: Color(0xFF6C757D),
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: AppCol.primary,
                        value: val2,
                        onChanged: (value) {
                          val2 = value ?? false;
                          val5 = false;

                          setState(() {});
                        }),
                    Text(
                      'I am spending too much time on the \nplatform and want to reduce screen time.',
                      style: TextStyle(
                        color: Color(0xFF6C757D),
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: AppCol.primary,
                        value: val3,
                        onChanged: (value) {
                          val3 = value ?? false;
                          val5 = false;

                          setState(() {});
                        }),
                    Text(
                      'I prefer using other communication or\nnetworking tools.',
                      style: TextStyle(
                        color: Color(0xFF6C757D),
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: AppCol.primary,
                        value: val4,
                        onChanged: (value) {
                          val4 = value ?? false;
                          val5 = false;
                          setState(() {});
                        }),
                    Text(
                      'Any other reason, don’t want to disclose.',
                      style: TextStyle(
                        color: Color(0xFF6C757D),
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: AppCol.primary,
                        value: val5,
                        onChanged: (value) {
                          val5 = value ?? false;
                          val1 = false;
                          val2 = false;
                          val3 = false;
                          val4 = false;
                          setState(() {});
                        }),
                    Text(
                      'None of the above ',
                      style: TextStyle(
                        color: Color(0xFF6C757D),
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
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
                            'Cancel',
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
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        ref
                            .read(authViewModel)
                            .deleteAccount()
                            .then((value) => showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => DeleteSuccess(),
                                ));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 14),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: AppCol.primary),
                            borderRadius: BorderRadius.circular(23),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Delete Account',
                              style: TextStyle(
                                color: AppCol.primary,
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class DeleteSuccess extends ConsumerStatefulWidget {
  const DeleteSuccess({
    super.key,
  });

  @override
  ConsumerState<DeleteSuccess> createState() => _DeleteSuccessState();
}

class _DeleteSuccessState extends ConsumerState<DeleteSuccess> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SharedPreferenceService.clearAll();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ));
        return false;
      },
      child: Scaffold(
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
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
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
                      "It's sad to see you leave, Hello!! We would be waiting to see you back very soon. Please feel free to share your feedback with us at support@taptohello.com \n Your Hello Account has been successfully deleted!",
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
                      SharedPreferenceService.clearAll();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ));
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
      ),
    );
  }
}
