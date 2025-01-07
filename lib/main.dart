import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:swapnil_s_application4/core/app_export.dart';
import 'package:swapnil_s_application4/core/core.dart';
import 'package:swapnil_s_application4/helper/locator.dart';
import 'package:swapnil_s_application4/presentation/splash/splash_screen.dart';
import 'package:swapnil_s_application4/services/shared_preference_service.dart';
import 'package:uni_links/uni_links.dart';

bool _initialUriIsHandled = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NfcManager.instance.isAvailable();
  await SharedPreferenceService.init();
  await Firebase.initializeApp();
  final String? token = await FirebaseMessaging.instance.getToken();
  AppConstants.fcmToken = token ?? "";
  // await Firebase.initializeApp(
  // options: const FirebaseOptions(
  //     apiKey: "AIzaSyDgaZvi95BYNaA3CKhfum-8nZYr2GRYceo",
  //     authDomain: "hello-e79ba.firebaseapp.com",
  //     projectId: "hello-e79ba",
  //     storageBucket: "hello-e79ba.appspot.com",
  //     messagingSenderId: "82267455961",
  //     appId: "1:82267455961:web:c7f7009554d564fcaf59c8",
  //     measurementId: "G-V0D7P6L6H5"),
  // );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  try {
    setupServiceLocator();
    // await dotenv.load();
  } catch (e) {
    // Logger.write(e.toString());
  }

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  Uri? _initialUri;
  Uri? _latestUri;
  Object? _err;

  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();

    _handleIncomingLinks();
    _handleInitialUri();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppCol.primary,
            ),
        primaryColor: AppCol.primary,
        visualDensity: VisualDensity.standard,
      ),
      title: 'Hello',
      debugShowCheckedModeBanner: false,
      // initialRoute: AppRoutes.signInScreen,
      // routes: AppRoutes.routes,
      home: SplashScreen(),
      // routerConfig: router,
    );
  }

  void _handleIncomingLinks() {
    if (!kIsWeb) {
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      _sub = uriLinkStream.listen((Uri? uri) {
        if (!mounted) return;
        print('got uri: $uri');
        setState(() {
          _latestUri = uri;
          _err = null;
          AppConstants.deeplink = _latestUri;
        });

        // openAppLink(_latestUri!);
      }, onError: (Object err) {
        if (!mounted) return;
        print('got err: $err');
        setState(() {
          _latestUri = null;
          if (err is FormatException) {
            _err = err;
          } else {
            _err = null;
          }
        });
      });
    }
  }

  Future<void> _handleInitialUri() async {
    // In this example app this is an almost useless guard, but it is here to
    // show we are not going to call getInitialUri multiple times, even if this
    // was a weidget that will be disposed of (ex. a navigation route change).
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;
      print('_handleInitialUri called');
      try {
        final uri = await getInitialUri();
        if (uri == null) {
          print('no initial uri');
        } else {
          print('got initial uri: $uri');
        }
        AppConstants.deeplink = uri;
        setState(() {});
        // openAppLink(_latestUri!);
        if (!mounted) return;
        setState(() => _initialUri = uri);
      } on PlatformException {
        // Platform messages may fail but we ignore the exception
        print('falied to get initial uri');
      } on FormatException catch (err) {
        if (!mounted) return;
        print('malformed initial uri');
        setState(() => _err = err);
      }
    }
  }
}

/// This handles '/' and '/details'.
