import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/firebase_messaging_provider.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/core/utils/size_utils.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/Analytics/analyticsScreen.dart';
import 'package:taptohello/presentation/MyOrders/myOrdersMainScreen.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/manageStoreScreen.dart';
import 'package:taptohello/presentation/profileScreen/profile_screen.dart';
import 'package:taptohello/presentation/scan/scan_qr_view.dart';
import 'package:taptohello/presentation/share_hello_profile_screen/share_hello_profile_screen.dart';
import 'package:taptohello/services/shared_preference_service.dart';
import 'package:taptohello/theme/app_style.dart';

class HomeView extends StatefulWidget {
  final int indexfromPrevious;

  const HomeView({super.key, this.indexfromPrevious = 0});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  String ownid = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 200)).then((value) {
      ownid = _userDetailService.userDetailResponse?.user?.id ?? "";
      print('user id is-----: $ownid');
      setState(() {});
      SharedPreferenceService.setString('userId', ownid);
      if (AppConstants.deeplink != null) {
        openAppLink(AppConstants.deeplink!, context);
      }
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        _navigateToSingleFeedView(message);
        _showNotification(message);
      });
      index = widget.indexfromPrevious;
      setState(() {});
    });
  }

  void _navigateToSingleFeedView(RemoteMessage message) {}

//Show the notification's body if available
  void _showNotification(RemoteMessage message) {
    if (message.notification != null) {
      print(
          'Message contained a notification: ${message.notification?.body ?? ""}');
      FirebaseMessagingProvider.showNotification(
          message, message.notification!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
          height: getVerticalSize(94),
          width: double.infinity,
          
          // margin: getMargin(top: 38),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 34),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Column(children: [
                      Image.asset(
                        // index == 0
                        //     ?
                        "assets/newIcons/profile_selected.png",
                        // : "assets/newIcons/profile_unselected.png",
                        color: index != 0 ? Colors.grey : null,
                        height: 22,
                      ),
                      SizedBox(height: 7),
                      Text("Profile",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular10Gray700.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color:
                                  index == 0 ? AppCol.primary : AppCol.gray700))
                    ]),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Column(children: [
                      Image.asset(
                        "assets/images/storeIcon.png",
                        height: 22,
                        color: index == 1 ? AppCol.primary : null,
                      ),
                      SizedBox(height: 7),
                      Text("Shop",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular10Gray700.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color:
                                  index == 1 ? AppCol.primary : AppCol.gray700))
                    ]),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                      // ScaffoldMessenger.of(context)
                      //     .showSnackBar(SnackBar(content: Text('coming soon')));
                    },
                    child: Column(children: [
                      Image.asset(
                        color: index == 2 ? AppCol.primary : null,
                        "assets/images/myOrdersIcon.png",
                        height: 22,
                      ),
                      SizedBox(height: 7),
                      Text("My Orders",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular10Gray700.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: index == 2
                                  ? AppCol.primary
                                  : AppCol.gray700)),
                      // Text("(Coming Soon)",
                      //     overflow: TextOverflow.ellipsis,
                      //     textAlign: TextAlign.left,
                      //     style: AppStyle.txtPoppinsRegular10Gray700.copyWith(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 12,
                      //         color: AppCol.red400)),
                    ]),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = 3;
                      });
                    },
                    child: Column(children: [
                      Image.asset(
                        index == 3
                            ? "assets/newIcons/share_selected.png"
                            : "assets/newIcons/share_unselected.png",
                        height: 22,
                      ),
                      SizedBox(height: 7),
                      Text("Share",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular10Gray700.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color:
                                  index == 3 ? AppCol.primary : AppCol.gray700))
                    ]),
                  ),
                 if (Platform.isAndroid)
  InkWell(
    onTap: () {
      setState(() {
        // index = 4;
      });
    },
    child: Column(
      children: [
        Image.asset(
          "assets/images/analyticsIcons.png",
          height: 22,
          color: index == 4 ? AppCol.primary : null,
        ),
        SizedBox(height: 7),
        Text(
          "Analytics",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtPoppinsRegular10Gray700.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: index == 4 ? AppCol.primary : AppCol.gray700,
          ),
        ),
        Text(
          "(Coming Soon)",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtPoppinsRegular10Gray700.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: AppCol.red400,
          ),
        ),
      ],
    ),
  )
else
  SizedBox.shrink(),
                ]),
          )),
          backgroundColor: Colors.white,
      body: getView(index),
    );
  }

  Widget getView(int ind) {
    switch (ind) {
      case 0:
        // return ContactHomeView();
        return ProfileScreen(
          onHelloStoreTap: (value) {
            index = value;
            print('My value are: $value');
            setState(() {});
          },
        );
      case 1:
        return ManageStoreScreen();
      case 3:
        // return ContactListView();
        return ShareHelloProfileScreen();
      case 4:
        return AnalyticsScreen();
      case 2:
        return MyOrdersMainScreen();
      default:
        return ProfileScreen(
          onHelloStoreTap: (val) {},
        );
    }
  }

  void openAppLink(Uri uri, BuildContext context) {
    print("this is the link ${AppConstants.deeplink}?connectUserId=$ownid");
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          QrProfileScreenWebview(url: "$uri?connectUserId=$ownid"),
    ));
  }
}
