// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapnil_s_application4/core/constants.dart';

import 'package:swapnil_s_application4/helper/base_screen_view.dart';
import 'package:swapnil_s_application4/helper/locator.dart';
import 'package:swapnil_s_application4/helper/user_detail_service.dart';

import 'package:swapnil_s_application4/presentation/home/home_view.dart';
import 'package:swapnil_s_application4/presentation/onboarding/onboarding.dart';
import 'package:swapnil_s_application4/presentation/profileWebview/profile_screen.dart';
import 'package:swapnil_s_application4/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:swapnil_s_application4/presentation/splash/splash_view_model.dart';
import 'package:swapnil_s_application4/services/shared_preference_service.dart';
import 'package:uni_links/uni_links.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with BaseScreenView {
  bool initialURILinkHandled = false;
  late SplashViewModel _viewModel;
  String? token = "";
  String? userId = "";
  bool? isOnboardingViewed = false;

  Uri? _initialURI;
  Uri? _currentURI;
  Object? _err;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel = ref.read(splashViewModel);
    _viewModel.attachView(this);

    Future.delayed(Duration(seconds: 3)).then((value) async {
      // _initURIHandler();
      // _incomingLinkHandler();
      // await Permission.camera.request();

      debugPrint('My token is are: ${AppConstants.authToken}');
      token = SharedPreferenceService.getString(AppConstants.authToken);
      userId = SharedPreferenceService.getString(AppConstants.userIdPref);
      int selectedIndex = SharedPreferenceService.getInt("language") ?? 0;
      AppConstants.selectedIndex = selectedIndex;

      setState(() {});
      isOnboardingViewed =
          SharedPreferenceService.getBool(AppConstants.isOnboardingViewed);

      AppConstants.token = token ?? "";
      AppConstants.userId = userId ?? "";
      AppConstants.isOnboarding = isOnboardingViewed ?? false;
      if (AppConstants.isOnboarding == false) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Onboarding(),
        ));
      } else if (token == "" ||
          token == null ||
          userId == "" ||
          userId == null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ));
      } else {
        debugPrint('My token is are: $token');
        AppConstants.token = token ?? "";
        debugPrint('My token is are: ${AppConstants.token}');
        await _viewModel.getUserDetail();
        if (_viewModel.userDetailResponse != null &&
            _viewModel.userDetailResponse?.user?.phone != null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeView(),
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage("assets/images/new_splashView.gif"))),
      ),
    );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
  Future<void> _initURIHandler() async {
    // 1
    if (!initialURILinkHandled) {
      initialURILinkHandled = true;
      // 2
      // Fluttertoast.showToast(
      //     msg: "Invoked _initURIHandler",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.green,
      //     textColor: Colors.white);
      try {
        // 3
        final initialURI = await getInitialUri();
        // 4
        if (initialURI != null) {
          debugPrint("Initial URI received $initialURI");
          if (!mounted) {
            return;
          }
          setState(() {
            _initialURI = initialURI;
          });
          AppConstants.deeplink = _initialURI;
          setState(() {});
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => ProfileScreenWebview(
          //           url: _initialURI.toString(),
          //         )));
        } else {
          debugPrint("Null Initial URI received");
        }
      } on PlatformException {
        // 5
        debugPrint("Failed to receive initial uri");
      } on FormatException catch (err) {
        // 6
        if (!mounted) {
          return;
        }
        debugPrint('Malformed Initial URI received');
        setState(() => _err = err);
      }
    }
  }

  void _incomingLinkHandler() {
    // 1
    if (!kIsWeb) {
      // 2
    }
  }
}
