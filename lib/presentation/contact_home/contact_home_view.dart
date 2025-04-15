import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/presentation/contact/contact_view_model.dart';
import 'package:taptohello/presentation/contact_home/swiper_view.dart';
import 'package:taptohello/presentation/edit_card_screen/edit_profile_screen.dart';
import 'package:taptohello/presentation/premium/previum_view.dart';
import 'package:taptohello/services/shared_preference_service.dart';

import '../../helper/locator.dart';
import '../../helper/user_detail_service.dart';

class ContactHomeView extends ConsumerStatefulWidget {
  const ContactHomeView({super.key});

  @override
  ConsumerState<ContactHomeView> createState() => _ContactHomeViewState();
}

class _ContactHomeViewState extends ConsumerState<ContactHomeView>
    with BaseScreenView {
  late ContactViewModel _viewModel;
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  String token = '';
  String userId = '';
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel = ref.read(contactViewModel);
    getUserParentToken();

    _viewModel.attachView(this);
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  getUserParentToken() {
    token = SharedPreferenceService.getString('parentIdToken') ?? '';
    userId = SharedPreferenceService.getString('userId') ?? '';
    setState(() {});

    print('My parent token: $token');
    print('My user id: $userId');
    _viewModel.getConnectedUsers(token, userId);
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(contactViewModel);

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.9;
    final double itemWidth = size.width / 2;

    debugPrint(
        'My profile length is: ${_viewModel.connectedUserResponse?.contacts?.length}');
    return Scaffold(
      backgroundColor: AppCol.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Image.asset(
            "assets/newIcons/home_head.png",
            height: 20,
          ),
        ),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditProfileScreen(),
              ));
            },
            child: Container(
              margin: EdgeInsets.all(12),
              // width: double.infinity,
              padding: EdgeInsets.only(bottom: 8, top: 8, right: 14, left: 14),
              decoration: BoxDecoration(
                  color: AppCol.primary,
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset("assets/newIcons/icon_prof.png"),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _userDetailService.userDetailResponse?.user?.isPro == false ?? false
              ? Visibility(
                  visible: AppConstants.eligibility == true,
                  child: Column(
                    children: [
                      Container(
                        height: 234,
                        width: 175,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(
                                    "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg"))),
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white.withOpacity(0.8)),
                          child: Column(children: [
                            SizedBox(height: 31),
                            Image.asset(
                              "assets/newIcons/pre_circle.png",
                              width: 40,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Subscribe to pro for smarter phygital networking",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                            // SizedBox(
                            //   height: 16,
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //       builder: (context) => PremiumView(),
                            //     ));
                            //   },
                            //   child: Container(
                            //     margin: EdgeInsets.symmetric(horizontal: 16),
                            //     width: double.infinity,
                            //     padding: EdgeInsets.only(
                            //         bottom: 12, top: 12, right: 10, left: 10),
                            //     decoration: BoxDecoration(
                            //         color: AppCol.primary,
                            //         borderRadius: BorderRadius.circular(23)),
                            //     child: Center(
                            //       child: Text(
                            //         "Subscribe",
                            //         style: TextStyle(
                            //             color: Colors.white, fontSize: 14),
                            //         textAlign: TextAlign.center,
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ]),
                        ),
                      ),
                    ],
                  ),
                )
              : _viewModel.connectedUserResponse?.contacts?.length == null
                  ? SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      child: Center(
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : Text(
                                'You don\'t have any network updates at the moment. Please connect with people to build your network.',
                                textAlign: TextAlign.center,
                              ),
                      ),
                    )
                  : Visibility(
                      visible: AppConstants.eligibility == true,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 8.0, left: 8, top: 20),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _userDetailService
                                      .userDetailResponse?.user?.isPro ??
                                  false
                              ? _viewModel.connectedUserResponse?.contacts
                                      ?.length ??
                                  0
                              : (_viewModel.connectedUserResponse?.contacts
                                          ?.length ??
                                      0) +
                                  1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: (itemWidth / itemHeight),
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8),
                          itemBuilder: (context, index) => _userDetailService
                                      .userDetailResponse?.user?.isPro ??
                                  false
                              ? InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SwiperView(
                                            index2: index,
                                            contacts: _viewModel
                                                    .connectedUserResponse
                                                    ?.contacts ??
                                                [],
                                          ),
                                        ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: DecorationImage(
                                            fit: BoxFit.fitHeight,
                                            image: NetworkImage(_viewModel
                                                        .connectedUserResponse
                                                        ?.contacts?[index]
                                                        .profileImg ==
                                                    ""
                                                ? "https://www.qwikcilver.com/wp-content/uploads/2019/01/dummy-post-square-1-thegem-blog-masonry.jpg"
                                                : _viewModel
                                                        .connectedUserResponse
                                                        ?.contacts?[index]
                                                        .profileImg ??
                                                    "https://www.qwikcilver.com/wp-content/uploads/2019/01/dummy-post-square-1-thegem-blog-masonry.jpg"))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  _viewModel
                                                          .connectedUserResponse
                                                          ?.contacts?[index]
                                                          .name ??
                                                      "",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFF05323),
                                                      shape: BoxShape.circle),
                                                  child: Center(
                                                      child: Text(
                                                          _viewModel
                                                                      .connectedUserResponse
                                                                      ?.contacts?[
                                                                          index]
                                                                      .contacts ==
                                                                  null
                                                              ? "0"
                                                              : _viewModel
                                                                      .connectedUserResponse
                                                                      ?.contacts?[
                                                                          index]
                                                                      .contacts
                                                                      .toString() ??
                                                                  "0",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 12))),
                                                )
                                              ],
                                            )
                                          ]),
                                    ),
                                  ),
                                )
                              : index == 0
                                  ? Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          image: DecorationImage(
                                              fit: BoxFit.fitHeight,
                                              image: NetworkImage(
                                                  "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg"))),
                                      child: Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color:
                                                Colors.white.withOpacity(0.8)),
                                        child: Column(children: [
                                          SizedBox(height: 31),
                                          Image.asset(
                                            "assets/newIcons/pre_circle.png",
                                            width: 40,
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            "Subscribe to pro for smarter phygital networking",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          // SizedBox(
                                          //   height: 16,
                                          // ),
                                          // InkWell(
                                          //   onTap: () {
                                          //     Navigator.of(context)
                                          //         .push(MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           PremiumView(),
                                          //     ));
                                          //   },
                                          //   child: Container(
                                          //     margin: EdgeInsets.symmetric(
                                          //         horizontal: 16),
                                          //     width: double.infinity,
                                          //     padding: EdgeInsets.only(
                                          //         bottom: 12,
                                          //         top: 12,
                                          //         right: 10,
                                          //         left: 10),
                                          //     decoration: BoxDecoration(
                                          //         color: AppCol.primary,
                                          //         borderRadius:
                                          //             BorderRadius.circular(
                                          //                 23)),
                                          //     child: Center(
                                          //       child: Text(
                                          //         "Subscribe",
                                          //         style: TextStyle(
                                          //             color: Colors.white,
                                          //             fontSize: 14),
                                          //         textAlign: TextAlign.center,
                                          //       ),
                                          //     ),
                                          //   ),
                                          // )
                                        ]),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SwiperView(
                                                index2: index - 1,
                                                contacts: _viewModel
                                                        .connectedUserResponse
                                                        ?.contacts ??
                                                    [],
                                              ),
                                            ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            image: DecorationImage(
                                                fit: BoxFit.fitHeight,
                                                image: NetworkImage(_viewModel
                                                            .connectedUserResponse
                                                            ?.contacts?[
                                                                index - 1]
                                                            .profileImg ==
                                                        ""
                                                    ? "https://www.qwikcilver.com/wp-content/uploads/2019/01/dummy-post-square-1-thegem-blog-masonry.jpg"
                                                    : _viewModel
                                                            .connectedUserResponse
                                                            ?.contacts?[
                                                                index - 1]
                                                            .profileImg ??
                                                        "https://www.qwikcilver.com/wp-content/uploads/2019/01/dummy-post-square-1-thegem-blog-masonry.jpg"))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      _viewModel
                                                              .connectedUserResponse
                                                              ?.contacts?[
                                                                  index - 1]
                                                              .name ??
                                                          "",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xFFF05323),
                                                          shape:
                                                              BoxShape.circle),
                                                      child: Center(
                                                          child: Text(
                                                              _viewModel
                                                                          .connectedUserResponse
                                                                          ?.contacts?[index -
                                                                              1]
                                                                          .contacts ==
                                                                      null
                                                                  ? "0"
                                                                  : _viewModel
                                                                          .connectedUserResponse
                                                                          ?.contacts?[index -
                                                                              1]
                                                                          .contacts
                                                                          .toString() ??
                                                                      "0",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      12))),
                                                    )
                                                  ],
                                                )
                                              ]),
                                        ),
                                      ),
                                    ),
                        ),
                      ),
                    )
        ]),
      ),
    );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}
