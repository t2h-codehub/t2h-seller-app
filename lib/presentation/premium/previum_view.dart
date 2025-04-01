import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';

import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/premium/features.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';

class PremiumView extends ConsumerStatefulWidget {
  const PremiumView({super.key});

  @override
  ConsumerState<PremiumView> createState() => _PremiumViewState();
}

class _PremiumViewState extends ConsumerState<PremiumView>
    with BaseScreenView, WidgetsBindingObserver {
  late AuthViewModel _viewModel;
  final UserDetailService _userDetailService = getIt<UserDetailService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
    _viewModel.getPlans();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _viewModel.getUserDetail();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(authViewModel);
    debugPrint(
        'Is my account is Pro or not: ${_userDetailService.userDetailResponse?.user?.isProPlus}');
    debugPrint('Is my viewmodel load: ${_viewModel.loading}');
    return FutureBuilder(
        future: _viewModel.getUserDetail(),
        builder: (context, snapshot) {
          return Scaffold(
              backgroundColor: AppCol.bgColor,
              resizeToAvoidBottomInset: false,
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
                title: Text("Plans and Pricing",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    )),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Pro plans and benefits',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppCol.primary,
                            fontSize: 20,
                            // fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            // height: 26,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      _viewModel.loading
                          ? CircularProgressIndicator()
                          : _viewModel.getPlanResponse?.plans?.length == 0
                              ? Text("No Plans available")
                              : ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 16),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: _viewModel
                                          .getPlanResponse?.plans?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    debugPrint('Loossssjss Index is: $index');
                                    return Container(
                                      padding: const EdgeInsets.all(20),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x19999BA8),
                                            blurRadius: 16,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            // height: 254,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  _viewModel
                                                                          .getPlanResponse
                                                                          ?.plans?[
                                                                              index]
                                                                          .title ??
                                                                      "",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF1E1E1E),
                                                                    fontSize:
                                                                        24,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    width: 7),
                                                                Image.asset(
                                                                  "assets/newIcons/premium.png",
                                                                  height: 17,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 5),
                                                          if (index == 0) ...[
                                                            _userDetailService
                                                                        .userDetailResponse
                                                                        ?.user
                                                                        ?.isPro ==
                                                                    true
                                                                ? Container(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          'Subscribed',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xFF1EA357),
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            width:
                                                                                8),
                                                                        Icon(
                                                                            Icons
                                                                                .check_circle,
                                                                            color:
                                                                                Color(0xFF1EA357),
                                                                            size: 20),
                                                                      ],
                                                                    ),
                                                                  )
                                                                : SizedBox
                                                                    .shrink(),
                                                          ],
                                                          if (index == 1) ...[
                                                            _userDetailService
                                                                        .userDetailResponse
                                                                        ?.user
                                                                        ?.isProPlus ==
                                                                    true
                                                                ? Container(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          'Subscribed',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xFF1EA357),
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            width:
                                                                                8),
                                                                        Icon(
                                                                            Icons
                                                                                .check_circle,
                                                                            color:
                                                                                Color(0xFF1EA357),
                                                                            size: 20),
                                                                      ],
                                                                    ),
                                                                  )
                                                                : SizedBox
                                                                    .shrink(),
                                                          ]
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      '₹${_viewModel.getPlanResponse?.plans?[index].mrp} INR',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF555555),
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 16),
                                                Container(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'MRP ₹${_viewModel.getPlanResponse?.plans?[index].monthlyPrice}',
                                                        style: TextStyle(
                                                          color:
                                                              AppCol.primary,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 136,
                                                        height: 14,
                                                        child: Text(
                                                          'per month, billed yearly',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF555555),
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 16),
                                                Container(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ...List.generate(
                                                        _viewModel
                                                                .getPlanResponse
                                                                ?.plans?[index]
                                                                .shortBenefits
                                                                ?.length ??
                                                            0,
                                                        (index2) => Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 8),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              _viewModel
                                                                          .getPlanResponse
                                                                          ?.plans?[
                                                                              index]
                                                                          .shortBenefits?[
                                                                              index2]
                                                                          .image ==
                                                                      ""
                                                                  ? Container()
                                                                  : Image
                                                                      .network(
                                                                      _viewModel
                                                                              .getPlanResponse
                                                                              ?.plans?[index]
                                                                              .shortBenefits?[index2]
                                                                              .image ??
                                                                          "",
                                                                      width: 22,
                                                                      height:
                                                                          22,
                                                                    ),
                                                              const SizedBox(
                                                                  width: 12),
                                                              Text(
                                                                _viewModel
                                                                        .getPlanResponse
                                                                        ?.plans?[
                                                                            index]
                                                                        .shortBenefits?[
                                                                            index2]
                                                                        .title ??
                                                                    "",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xFF555555),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          IgnorePointer(
                                            ignoring: _userDetailService
                                                    .userDetailResponse
                                                    ?.user
                                                    ?.plan
                                                    ?.planType
                                                    ?.title
                                                    ?.toLowerCase() ==
                                                _viewModel.getPlanResponse
                                                    ?.plans?[index].title
                                                    ?.toLowerCase(),
                                            child: InkWell(
                                              onTap: () {
                                                if(_userDetailService
                                                    .userDetailResponse
                                                    ?.user
                                                    ?.type == 'parent' ) {
                                                  if (_userDetailService
                                                      .userDetailResponse
                                                      ?.user
                                                      ?.isPro ==
                                                      false) {
                                                    if (_userDetailService
                                                        .userDetailResponse
                                                        ?.user
                                                        ?.isProPlus ==
                                                        false) {
                                                      _launchURL(
                                                          "${AppConstants.websiteUrl}hello_pro?id=${_viewModel.getPlanResponse?.plans?[index].id}&user=${_userDetailService.userDetailResponse?.user?.id}");
                                                    }
                                                  }
                                                  if (_userDetailService
                                                      .userDetailResponse
                                                      ?.user
                                                      ?.isProPlus ==
                                                      false) {
                                                    _launchURL(
                                                        "${AppConstants.websiteUrl}hello_pro?id=${_viewModel.getPlanResponse?.plans?[index].id}&user=${_userDetailService.userDetailResponse?.user?.id}");
                                                  }
                                                }
                                              },
                                              child: Container(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          // if(index == 0)...[],
                                                          index == 0
                                                              ? Container(
                                                                  height: 38,
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          32,
                                                                      vertical:
                                                                          9),
                                                                  decoration:
                                                                      ShapeDecoration(
                                                                    color: _userDetailService.userDetailResponse?.user?.isPro ==
                                                                            true
                                                                        ? Colors
                                                                            .grey
                                                                        : AppCol.primary,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        _userDetailService.userDetailResponse?.user?.isPro ==
                                                                                false
                                                                            ? 'Get ${_viewModel.getPlanResponse?.plans?[index].title} '
                                                                            : 'Subscribed',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                      _userDetailService.userDetailResponse?.user?.isPro ==
                                                                              false
                                                                          ? Image
                                                                              .asset(
                                                                              "assets/newIcons/premium.png",
                                                                              height: 17,
                                                                              color: Colors.white,
                                                                            )
                                                                          : SizedBox(),
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                          index == 1
                                                              ? Container(
                                                                  height: 38,
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          32,
                                                                      vertical:
                                                                          9),
                                                                  decoration:
                                                                      ShapeDecoration(
                                                                    color: _userDetailService.userDetailResponse?.user?.isProPlus ==
                                                                            true
                                                                        ? Colors
                                                                            .grey
                                                                        : AppCol.primary,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        _userDetailService.userDetailResponse?.user?.isProPlus ==
                                                                                false
                                                                            ? 'Get ${_viewModel.getPlanResponse?.plans?[index].title} '
                                                                            : 'Subscribed',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                      _userDetailService.userDetailResponse?.user?.isProPlus ==
                                                                              false
                                                                          ? Image
                                                                              .asset(
                                                                              "assets/newIcons/premium.png",
                                                                              height: 17,
                                                                              color: Colors.white,
                                                                            )
                                                                          : SizedBox(),
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                          const SizedBox(
                                                              width: 16),
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .push(
                                                                      MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Features(
                                                                        isPlus:
                                                                            false),
                                                              ));
                                                            },
                                                            child: Container(
                                                              height: 38,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          32,
                                                                      vertical:
                                                                          9),
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                      width:
                                                                          0.50,
                                                                      color: AppCol.primary),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Learn More',
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppCol.primary,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                ],
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
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                      SizedBox(height: 16),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ));
        });
  }

  _launchURL(String url) async {
    if (!url.contains("s3")) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalNonBrowserApplication,
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}
