import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/core.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/core/utils/size_utils.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/premium/previum_view.dart';
import 'package:taptohello/presentation/shop/teams.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/services/shared_preference_service.dart';
import 'package:taptohello/theme/app_style.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

class ChooseProfileView extends ConsumerStatefulWidget {
  const ChooseProfileView({super.key});

  @override
  ConsumerState<ChooseProfileView> createState() =>
      _ActivateDeviceScreenState();
}

class _ActivateDeviceScreenState extends ConsumerState<ChooseProfileView>
    with BaseScreenView {
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  late AuthViewModel _viewModel;
  final TextEditingController _nameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
    _viewModel.getMultipleAccount(
        context, _userDetailService.userDetailResponse?.user?.type ?? "");
    debugPrint('My user type: ');
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(authViewModel);
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
            "Choose a Profile to Share",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                    _viewModel.getMultipleAccountsResponse?.accounts?.length ??
                        0,
                    (index) => InkWell(
                      onTap: () {
                        print('Main user id: ${_viewModel
                            .getMultipleAccountsResponse
                            ?.accounts?[index]
                            .id}');
                        SharedPreferenceService.setString('userId', _viewModel
                            .getMultipleAccountsResponse
                            ?.accounts?[index]
                            .id ?? '');
                        if(AppConstants.userId !=
                            _viewModel
                                .getMultipleAccountsResponse
                                ?.accounts?[index]
                                .id) {
                          _viewModel.switchAccount(
                              context,
                              _viewModel.getMultipleAccountsResponse
                                  ?.accounts?[index].id ??
                                  "",
                              false);
                        }

                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
  width: 64,
  height: 64,
  decoration: ShapeDecoration(
    image: DecorationImage(
      fit: BoxFit.cover,
      image: CachedNetworkImageProvider(
        (_viewModel.getMultipleAccountsResponse != null &&
                _viewModel.getMultipleAccountsResponse!.accounts != null &&
                _viewModel.getMultipleAccountsResponse!.accounts!.isNotEmpty &&
                _viewModel.getMultipleAccountsResponse!.accounts![index].profileImg != null &&
                _viewModel.getMultipleAccountsResponse!.accounts![index].profileImg!.isNotEmpty)
            ? (_viewModel.getMultipleAccountsResponse!.accounts![index].profileImg!.contains(AppConstants.imageBaseUrl)
                ? _viewModel.getMultipleAccountsResponse!.accounts![index].profileImg!
                : AppConstants.imageBaseUrl + _viewModel.getMultipleAccountsResponse!.accounts![index].profileImg!)
            : "https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_640.png",
      ),
    ),
    shape: OvalBorder(),
  ),
),

//                                     Container(
//   width: 64,
//   height: 64,
//   decoration: ShapeDecoration(
//     image: DecorationImage(
//       fit: BoxFit.cover,
//       image: CachedNetworkImageProvider(
//         (_viewModel.getMultipleAccountsResponse?.accounts?[index].profileImg != null &&
//                 _viewModel.getMultipleAccountsResponse?.accounts?[index].profileImg!.isNotEmpty)
//             ? (_viewModel.getMultipleAccountsResponse?.accounts?[index].profileImg!.contains(AppConstants.imageBaseUrl)
//                 ? _viewModel.getMultipleAccountsResponse?.accounts?[index].profileImg!
//                 : AppConstants.imageBaseUrl + _viewModel.getMultipleAccountsResponse?.accounts?[index].profileImg!)
//             : "https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_640.png",
//       ),
//     ),
//     shape: OvalBorder(),
//   ),
// )

                                    // Container(
                                    //   width: 64,
                                    //   height: 64,
                                    //   decoration: ShapeDecoration(
                                    //     image: DecorationImage(
                                    //         fit: BoxFit.cover,
                                    //         image: NetworkImage(_viewModel
                                    //                     .getMultipleAccountsResponse
                                    //                     ?.accounts?[index]
                                    //                     .profileImg ==
                                    //                 ""
                                    //             ? "https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_640.png"
                                    //             : _viewModel
                                    //                     .getMultipleAccountsResponse
                                    //                     ?.accounts?[index]
                                    //                     .profileImg ??
                                    //                 "https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_640.png")),
                                    //     shape: OvalBorder(),
                                    //   ),
                                    // ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          _viewModel
                                                                  .getMultipleAccountsResponse
                                                                  ?.accounts?[
                                                                      index]
                                                                  .name ??
                                                              "",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF1E1E1E),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 0.18,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 6),
                                                        Text(
                                                          _viewModel
                                                                      .getMultipleAccountsResponse
                                                                      ?.accounts?[
                                                                          index]
                                                                      .type ==
                                                                  "parent"
                                                              ? "Master Profile"
                                                              : 'Basic Profile',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF858585),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 11),
                                                  Container(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        AppConstants.userId ==
                                                                _viewModel
                                                                    .getMultipleAccountsResponse
                                                                    ?.accounts?[
                                                                        index]
                                                                    .id
                                                            ? Icon(
                                                                Icons
                                                                    .check_circle,
                                                                size: 24,
                                                                color: Color(
                                                                    0xFF1EA357))
                                                            : SizedBox(),
                                                        const SizedBox(
                                                            width: 10),
                                                        //   Icon(
                                                        //     size: 24,
                                                        //     Icons.info_outline,
                                                        //     color:
                                                        //         Color(0xFF999999),
                                                        //   ),
                                                        //   InkWell(
                                                        //     onTap: () {
                                                        //       _viewModel.switchAccount(
                                                        //           context,
                                                        //           _viewModel
                                                        //                   .getMultipleAccountsResponse
                                                        //                   ?.accounts?[
                                                        //                       index]
                                                        //                   .id ??
                                                        //               "",
                                                        //           true);
                                                        //     },
                                                        //     child: Icon(
                                                        //       size: 24,
                                                        //       Icons.edit,
                                                        //       color: Color(
                                                        //           0xFF999999),
                                                        //     ),
                                                        //   ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${_viewModel.getMultipleAccountsResponse?.accounts?[index].cards?.length ?? 0} Hello device connected',
                                                    style: TextStyle(
                                                      color: Color(0xFF858585),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 14),
                                                  AppConstants.userId ==
                                                          _viewModel
                                                              .getMultipleAccountsResponse
                                                              ?.accounts?[index]
                                                              .id
                                                      ? Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 3),
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: Color(
                                                                0x0A1EA357),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  width: 0.50,
                                                                  color: Color(
                                                                      0xFF1EA357)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Active',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 13,
                                                                  color: Color(
                                                                      0xFF1EA357),
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      : SizedBox(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Visibility(
                  //   visible: AppConstants.eligibility == true,
                  //   child: InkWell(
                  //     onTap: () {
                  //       if ((_userDetailService.userDetailResponse?.user?.isPro ?? false) &&
                  //           ((_viewModel.getMultipleAccountsResponse?.accounts
                  //                       ?.length ??
                  //                   0) <=
                  //               2) &&
                  //           _userDetailService.userDetailResponse?.user?.type ==
                  //               "parent") {
                  //         showModalBottomSheet(
                  //           context: context,
                  //           builder: (context) {
                  //             var focusNode = FocusNode();
                  //             FocusScope.of(context).requestFocus(focusNode);
                  //             return Padding(
                  //               padding: const EdgeInsets.symmetric(
                  //                   horizontal: 16.0, vertical: 16),
                  //               child: Column(children: [
                  //                 CustomTextFormField(
                  //                   focusNode: focusNode,
                  //                   hintText: "Enter Name",
                  //                   controller: _nameController,
                  //                 ),
                  //                 SizedBox(height: 16),
                  //                 InkWell(
                  //                   onTap: () {
                  //                     _viewModel.createMultipleAccount(
                  //                         context,
                  //                         _viewModel
                  //                             .creatgeMultipleAccountRequest
                  //                             .copyWith(
                  //                                 name: _nameController.text),
                  //                         _userDetailService.userDetailResponse
                  //                                 ?.user?.type ??
                  //                             "");
                  //                   },
                  //                   child: Container(
                  //                       decoration: BoxDecoration(
                  //                           color: AppCol.primary,
                  //                           borderRadius:
                  //                               BorderRadius.circular(30),
                  //                           border: Border.all(
                  //                               color: AppCol.primary)),
                  //                       margin: getMargin(
                  //                           top: 8,
                  //                           bottom: 8,
                  //                           left: 12,
                  //                           right: 12),
                  //                       padding: getMargin(
                  //                           top: 10,
                  //                           bottom: 10,
                  //                           left: 16,
                  //                           right: 16),
                  //                       child: Text("Create Multiple Account",
                  //                           overflow: TextOverflow.ellipsis,
                  //                           textAlign: TextAlign.left,
                  //                           style: AppStyle
                  //                               .txtPoppinsMedium10Gray900
                  //                               .copyWith(
                  //                                   fontSize: 14,
                  //                                   color: Colors.white))),
                  //                 ),
                  //               ]),
                  //             );
                  //           },
                  //         );
                  //         // Navigator.of(context).push(MaterialPageRoute(
                  //         //   builder: (context) => ActivationScreen(
                  //         //     isNfc: false,
                  //         //   ),
                  //         // ));
                  //         //Todo: add duplicate api

                  //         // _viewModel.createMultipleAccount(context);
                  //         // Navigator.of(context).push(MaterialPageRoute(
                  //         //   builder: (context) => ActivationScreen(
                  //         //     isNfc: false,
                  //         //   ),
                  //         // ));
                  //         //Todo: add duplicate api
                  //       } else if ((_userDetailService.userDetailResponse?.user
                  //                   ?.isProPlus ?? false) &&
                  //           ((_viewModel.getMultipleAccountsResponse?.accounts
                  //                       ?.length ??
                  //                   0) <=
                  //               5) &&
                  //           _userDetailService.userDetailResponse?.user?.type ==
                  //               "parent") {
                  //         showModalBottomSheet(
                  //           context: context,
                  //           builder: (context) {
                  //             var focusNode = FocusNode();
                  //             FocusScope.of(context).requestFocus(focusNode);
                  //             return Padding(
                  //               padding: const EdgeInsets.symmetric(
                  //                   horizontal: 16.0, vertical: 16),
                  //               child: Column(children: [
                  //                 CustomTextFormField(
                  //                   focusNode: focusNode,
                  //                   hintText: "Enter Name",
                  //                   controller: _nameController,
                  //                 ),
                  //                 SizedBox(height: 16),
                  //                 InkWell(
                  //                   onTap: () {
                  //                     _viewModel.createMultipleAccount(
                  //                         context,
                  //                         _viewModel
                  //                             .creatgeMultipleAccountRequest
                  //                             .copyWith(
                  //                                 name: _nameController.text),
                  //                         _userDetailService.userDetailResponse
                  //                                 ?.user?.type ??
                  //                             "");
                  //                   },
                  //                   child: Container(
                  //                       decoration: BoxDecoration(
                  //                           color: AppCol.primary,
                  //                           borderRadius:
                  //                               BorderRadius.circular(30),
                  //                           border: Border.all(
                  //                               color: AppCol.primary)),
                  //                       margin: getMargin(
                  //                           top: 8,
                  //                           bottom: 8,
                  //                           left: 12,
                  //                           right: 12),
                  //                       padding: getMargin(
                  //                           top: 10,
                  //                           bottom: 10,
                  //                           left: 16,
                  //                           right: 16),
                  //                       child: Text("Create Multiple Account",
                  //                           overflow: TextOverflow.ellipsis,
                  //                           textAlign: TextAlign.left,
                  //                           style: AppStyle
                  //                               .txtPoppinsMedium10Gray900
                  //                               .copyWith(
                  //                                   fontSize: 14,
                  //                                   color: Colors.white))),
                  //                 ),
                  //               ]),
                  //             );
                  //           },
                  //         );
                  //       } else {
                  //         // Navigator.of(context).pop();
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (context) => PremiumView(),
                  //         ));
                  //       }
                  //     },
                  //     child: Container(
                  //       padding: const EdgeInsets.all(16),
                  //       clipBehavior: Clip.antiAlias,
                  //       decoration: ShapeDecoration(
                  //         color: Colors.white,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(12),
                  //         ),
                  //         shadows: [
                  //           BoxShadow(
                  //             color: Color(0x19999BA8),
                  //             blurRadius: 16,
                  //             offset: Offset(0, 4),
                  //             spreadRadius: 0,
                  //           )
                  //         ],
                  //       ),
                  //       child: Row(
                  //         mainAxisSize: MainAxisSize.min,
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Container(
                  //             margin: EdgeInsets.only(left: 6),
                  //             width: 55,
                  //             height: 55,
                  //             decoration: ShapeDecoration(
                  //               image: DecorationImage(
                  //                   fit: BoxFit.cover,
                  //                   image: AssetImage(
                  //                       "assets/newIcons/pro_circ.png")),
                  //               shape: OvalBorder(),
                  //             ),
                  //           ),
                  //           const SizedBox(width: 14),
                  //           Expanded(
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.min,
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               children: [
                  //                 Container(
                  //                   child: Column(
                  //                     mainAxisSize: MainAxisSize.min,
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.start,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         'Create Business Profiles',
                  //                         style: TextStyle(
                  //                           color: Color(0xFF1E1E1E),
                  //                           fontSize: 18,
                  //                           fontWeight: FontWeight.w600,
                  //                           letterSpacing: 0.18,
                  //                         ),
                  //                       ),
                  //                       const SizedBox(height: 6),
                  //                       Text(
                  //                         'Add Another Profile',
                  //                         style: TextStyle(
                  //                           color: Color(0xFF858585),
                  //                           fontSize: 14,
                  //                           fontFamily: 'Roboto',
                  //                           fontWeight: FontWeight.w400,
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 const SizedBox(width: 11),
                  //                 Container(
                  //                   child: Row(
                  //                     mainAxisSize: MainAxisSize.min,
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.start,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.center,
                  //                     children: [
                  //                       Image.asset(
                  //                         "assets/newIcons/add_out.png",
                  //                         height: 24,
                  //                         color: AppCol.primary,
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 16),
                  // // SizedBox(
                  // //   height: MediaQuery.of(context).size.height / 2.3,
                  // // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.of(context)
                  //         .push(MaterialPageRoute(
                  //       builder: (context) =>
                  //           TeamsWebview(),
                  //     ));
                  //   },
                  //   child: Text.rich(
                  //     TextSpan(
                  //       children: [
                  //         TextSpan(
                  //           text: 'Managing a team? Check out ',
                  //           style: TextStyle(
                  //             color: Color(0xFF666666),
                  //             fontSize: 14,
                  //             fontFamily: 'Roboto',
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //         ),
                  //         TextSpan(
                  //           text: 'Hello Team',
                  //           style: TextStyle(
                  //             color: AppCol.primary,
                  //             fontSize: 14,
                  //             fontFamily: 'Roboto',
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //         TextSpan(
                  //           text: '.',
                  //           style: TextStyle(
                  //             color: Color(0xFF1E1E1E),
                  //             fontSize: 14,
                  //             fontFamily: 'Roboto',
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  // SizedBox(height: 34),
                  // Visibility(
                  //   visible: AppConstants.eligibility == true,
                  //   child: InkWell(
                  //     onTap: () {
                  //       if ((_userDetailService.userDetailResponse?.user?.isPro ?? false) &&
                  //           ((_viewModel.getMultipleAccountsResponse?.accounts
                  //                       ?.length ??
                  //                   0) <=
                  //               2) &&
                  //           _userDetailService.userDetailResponse?.user?.type ==
                  //               "parent") {
                  //         showModalBottomSheet(
                  //           context: context,
                  //           builder: (context) {
                  //             var focusNode = FocusNode();
                  //             FocusScope.of(context).requestFocus(focusNode);
                  //             return Padding(
                  //               padding: const EdgeInsets.symmetric(
                  //                   horizontal: 16.0, vertical: 16),
                  //               child: Column(children: [
                  //                 CustomTextFormField(
                  //                   focusNode: focusNode,
                  //                   hintText: "Enter Name",
                  //                   controller: _nameController,
                  //                 ),
                  //                 SizedBox(height: 16),
                  //                 InkWell(
                  //                   onTap: () {
                  //                     _viewModel.createMultipleAccount(
                  //                         context,
                  //                         _viewModel
                  //                             .creatgeMultipleAccountRequest
                  //                             .copyWith(
                  //                                 name: _nameController.text),
                  //                         _userDetailService.userDetailResponse
                  //                                 ?.user?.type ??
                  //                             "");
                  //                   },
                  //                   child: Container(
                  //                       decoration: BoxDecoration(
                  //                           color: AppCol.primary,
                  //                           borderRadius:
                  //                               BorderRadius.circular(30),
                  //                           border: Border.all(
                  //                               color: AppCol.primary)),
                  //                       margin: getMargin(
                  //                           top: 8,
                  //                           bottom: 8,
                  //                           left: 12,
                  //                           right: 12),
                  //                       padding: getMargin(
                  //                           top: 10,
                  //                           bottom: 10,
                  //                           left: 16,
                  //                           right: 16),
                  //                       child: Text("Create Multiple Account",
                  //                           overflow: TextOverflow.ellipsis,
                  //                           textAlign: TextAlign.left,
                  //                           style: AppStyle
                  //                               .txtPoppinsMedium10Gray900
                  //                               .copyWith(
                  //                                   fontSize: 14,
                  //                                   color: Colors.white))),
                  //                 ),
                  //               ]),
                  //             );
                  //           },
                  //         );
                  //         // Navigator.of(context).push(MaterialPageRoute(
                  //         //   builder: (context) => ActivationScreen(
                  //         //     isNfc: false,
                  //         //   ),
                  //         // ));
                  //         //Todo: add duplicate api

                  //         // _viewModel.createMultipleAccount(context);
                  //         // Navigator.of(context).push(MaterialPageRoute(
                  //         //   builder: (context) => ActivationScreen(
                  //         //     isNfc: false,
                  //         //   ),
                  //         // ));
                  //         //Todo: add duplicate api
                  //       } else if ((_userDetailService.userDetailResponse?.user?.isProPlus ?? false) &&
                  //           ((_viewModel.getMultipleAccountsResponse?.accounts
                  //                       ?.length ??
                  //                   0) <=
                  //               5) &&
                  //           _userDetailService.userDetailResponse?.user?.type ==
                  //               "parent") {
                  //         showModalBottomSheet(
                  //           context: context,
                  //           builder: (context) {
                  //             var focusNode = FocusNode();
                  //             FocusScope.of(context).requestFocus(focusNode);
                  //             return Padding(
                  //               padding: const EdgeInsets.symmetric(
                  //                   horizontal: 16.0, vertical: 16),
                  //               child: Column(children: [
                  //                 CustomTextFormField(
                  //                   focusNode: focusNode,
                  //                   hintText: "Enter Name",
                  //                   controller: _nameController,
                  //                 ),
                  //                 SizedBox(height: 16),
                  //                 InkWell(
                  //                   onTap: () {
                  //                     _viewModel.createMultipleAccount(
                  //                         context,
                  //                         _viewModel
                  //                             .creatgeMultipleAccountRequest
                  //                             .copyWith(
                  //                                 name: _nameController.text),
                  //                         _userDetailService.userDetailResponse
                  //                                 ?.user?.type ??
                  //                             "");
                  //                   },
                  //                   child: Container(
                  //                       decoration: BoxDecoration(
                  //                           color: AppCol.primary,
                  //                           borderRadius:
                  //                               BorderRadius.circular(30),
                  //                           border: Border.all(
                  //                               color: AppCol.primary)),
                  //                       margin: getMargin(
                  //                           top: 8,
                  //                           bottom: 8,
                  //                           left: 12,
                  //                           right: 12),
                  //                       padding: getMargin(
                  //                           top: 10,
                  //                           bottom: 10,
                  //                           left: 16,
                  //                           right: 16),
                  //                       child: Text("Create Multiple Account",
                  //                           overflow: TextOverflow.ellipsis,
                  //                           textAlign: TextAlign.left,
                  //                           style: AppStyle
                  //                               .txtPoppinsMedium10Gray900
                  //                               .copyWith(
                  //                                   fontSize: 14,
                  //                                   color: Colors.white))),
                  //                 ),
                  //               ]),
                  //             );
                  //           },
                  //         );
                  //       } else {
                  //         // Navigator.of(context).pop();
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (context) => PremiumView(),
                  //         ));
                  //       }
                  //     },
                  //     child: Container(
                  //       width: double.infinity,
                  //       margin: EdgeInsets.symmetric(horizontal: 8),
                  //       padding: const EdgeInsets.all(16),
                  //       decoration: ShapeDecoration(
                  //         color: AppCol.primary,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //       ),
                  //       child: Row(
                  //         mainAxisSize: MainAxisSize.min,
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Text.rich(
                  //             TextSpan(
                  //               children: [
                  //                 TextSpan(
                  //                   text: 'Create another profile ',
                  //                   style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: 16,
                  //                     fontFamily: 'Roboto',
                  //                     fontWeight: FontWeight.w600,
                  //                     letterSpacing: 0.16,
                  //                   ),
                  //                 ),
                  //                 TextSpan(
                  //                   text: 'Pro',
                  //                   style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: 16,
                  //                     fontFamily: 'Roboto',
                  //                     fontWeight: FontWeight.w900,
                  //                     letterSpacing: 0.16,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             textAlign: TextAlign.center,
                  //           ),
                  //           const SizedBox(width: 6),
                  //           Image.asset(
                  //             "assets/newIcons/premium.png",
                  //             height: 17,
                  //             color: Colors.white,
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
                ]),
          ),
        ));
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}
