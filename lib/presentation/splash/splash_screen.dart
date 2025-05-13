// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/config/flavor_config.dart';

import 'package:taptohello/helper/base_screen_view.dart';

import 'package:taptohello/presentation/home/home_view.dart';
import 'package:taptohello/presentation/onboarding/onboarding.dart';
import 'package:taptohello/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:taptohello/presentation/splash/splash_view_model.dart';
import 'package:taptohello/services/shared_preference_service.dart';
// import 'package:uni_links/uni_links.dart';

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
    super.initState();
    _viewModel = ref.read(splashViewModel);
    _viewModel.attachView(this);
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      // Initialize SharedPreferences
      // await SharedPreferenceService.init();
      
      // Add a small delay for splash screen
      await Future.delayed(Duration(seconds: 2));

      // Get stored values
      token = SharedPreferenceService.getString(AppConstants.authToken);
      userId = SharedPreferenceService.getString(AppConstants.userIdPref);
      int selectedIndex = SharedPreferenceService.getInt("language") ?? 0;
      isOnboardingViewed = SharedPreferenceService.getBool(AppConstants.isOnboardingViewed);

      debugPrint('Stored Token: $token');
      debugPrint('Stored UserId: $userId');

      // Update app constants
      AppConstants.selectedIndex = selectedIndex;
      AppConstants.token = token ?? "";
      AppConstants.userId = userId ?? "";
      AppConstants.isOnboarding = isOnboardingViewed ?? false;

      // Check if user is logged in
      bool isLoggedIn = token != null && token!.isNotEmpty && 
                       userId != null && userId!.isNotEmpty;

      if (!isLoggedIn) {
        debugPrint('User not logged in, navigating to sign in');
        _navigateToSignIn();
      } else {
        debugPrint('User is logged in, verifying details');
        // Always verify user details, regardless of flavor
        await _viewModel.getUserDetail();
        if (_viewModel.userDetailResponse?.user?.phone != null) {
          debugPrint('User details verified, navigating to home');
          _navigateToHome();
        } else {
          debugPrint('Invalid user details, clearing data and navigating to sign in');
          await _clearAuthData();
          _navigateToSignIn();
        }
      }
    } catch (e) {
      debugPrint("Error in splash screen: $e");
      // Clear potentially corrupted data
      await _clearAuthData();
      _navigateToSignIn();
    }
  }

  Future<void> _clearAuthData() async {
    try {
      await SharedPreferenceService.remove(AppConstants.authToken);
      await SharedPreferenceService.remove(AppConstants.userIdPref);
      AppConstants.token = "";
      AppConstants.userId = "";
      debugPrint('Auth data cleared successfully');
    } catch (e) {
      debugPrint('Error clearing auth data: $e');
    }
  }

  void _navigateToSignIn() {
    if (mounted) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ));
    }
  }

  void _navigateToHome() {
    if (mounted) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeView(),
      ));
    }
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
            image: AssetImage("assets/images/SplashSocialShop.gif"),
          ),
        ),
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
    
    
      try {
       
       
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
