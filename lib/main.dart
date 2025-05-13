import 'dart:async';
import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:dio/io.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/core.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/presentation/MyOrders/controllers/ordersControllers.dart';
import 'package:taptohello/presentation/splash/splash_screen.dart';
import 'package:taptohello/services/shared_preference_service.dart';
import 'package:taptohello/config/flavor_config.dart';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Dio dio = Dio();
final orderControllerProvider = ChangeNotifierProvider((ref) => OrderControllers());





Future<void> loadCertificate() async {
  SecurityContext securityContext = SecurityContext.defaultContext;
  final ByteData certData = await rootBundle.load('assets/api_taptohello_com.pem');
  securityContext.setTrustedCertificatesBytes(certData.buffer.asUint8List());
  print("Certificate loaded successfully!");
}



// Future<void> updateAppName() async {
//   await dotenv.load();
  
//   // Get APP_NAME from the .env file
//   String appName = dotenv.env['APP_NAME'] ?? 'DefaultAppName';

//   ///  Update Android strings.xml (without creating the file)
//   final androidFile = File('android/app/src/main/res/values/strings.xml');
  
//   if (!androidFile.existsSync()) {
//     print("Android strings.xml file does not exist. Please create it manually.");
//     return;
//   }

//   // Update app_name in strings.xml using correct regex
//   String androidContent = await androidFile.readAsString();
//   androidContent = androidContent.replaceAllMapped(
//     RegExp(r'<string name="app_name">.*?</string>'), 
//     (match) => '<string name="app_name">$appName</string>'
//   );
//   await androidFile.writeAsString(androidContent);
//   print("Android app name updated to: $appName");

//   ///  Update iOS Info.plist
//   final iosFile = File('ios/Runner/Info.plist');
  
//   if (!iosFile.existsSync()) {
//     print("❌ iOS Info.plist file does not exist. Please create it manually.");
//     return;
//   }

//   String iosContent = await iosFile.readAsString();
//   iosContent = iosContent.replaceAllMapped(
//     RegExp(r'(<key>CFBundleDisplayName<\/key>\s*<string>).*?(<\/string>)'), 
//     (match) => '${match.group(1)}$appName${match.group(2)}'
//   );
//   await iosFile.writeAsString(iosContent);
//   print("iOS app name updated to: $appName");

//   print("🎉 App name successfully updated to: $appName");
// }


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize flavor configuration
  const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'socioshop');
  FlavorConfig(
    flavor: flavor == 'socioshop' ? Flavor.socioshop : Flavor.socioshoptest,
    name: flavor == 'socioshop' ? 'SocioShop' : 'SocioShop Test',
    apiBaseUrl: flavor == 'socioshop' 
        ? 'https://api.socioshop.in/' 
        : 'https://api.mysocio.shop/',
    domainName: flavor == 'socioshop' 
        ? 'mysocio.shop' 
        : 'mysocio.shop',
    storeUrl: flavor == 'socioshop' 
        ? 'https://mysocio.shop/' 
        : 'https://test.mysocio.shop/',
  );

   //Test- Url
  // static const String baseUrl = "https://api.mysocio.shop/";
  // static const String domainName = "mysocio.shop";
  // static const String storeUrl = "https://test.mysocio.shop/";
  
  
  //Live- Url
  // static const String baseUrl = "https://api.socioshop.in/";
  // static const String domainName = "mysocio.shop";
  //  static const String storeUrl = "https://mysocio.shop/";



  // await NfcManager.instance.isAvailable();
  await SharedPreferenceService.init();

  // Initialize Firebase based on flavor
  if (FlavorConfig.instance.flavor == Flavor.socioshop) {
    if (Platform.isIOS) {
      // await Firebase.initializeApp();
      // String? token = await FirebaseMessaging.instance.getAPNSToken();
      // if (token != null) {
      //   AppConstants.fcmToken = token;
      // } else {
      //   await Future<void>.delayed(
      //     const Duration(
      //       seconds: 1,
      //     ),
      //   );
      //   // token = await FirebaseMessaging.instance.getAPNSToken();
      //   // if (token != null) {
      //   //   AppConstants.fcmToken = token;
      //   // }
      // }
    } else {
      // await Firebase.initializeApp();
      // final String? token = await FirebaseMessaging.instance.getToken();
      // AppConstants.fcmToken = token ?? "";
    }
  } else {
    // For test flavor, set a dummy token and skip Firebase
    AppConstants.fcmToken = "test_token";
    print("Test flavor detected, skipping Firebase initialization");
  }

  
  

  
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
  } catch (e) {
    print("Service locator setup failed: $e");
  }
  
  await loadCertificate();
  await dotenv.load();
  
  // await updateAppName();
  
  runApp(ProviderScope(child: MyApp()));
  
}



// Function to compare the server certificate and loaded certificate
bool compareCertificates(X509Certificate cert, List<int> certBytes) {
  // Check if the certificate's bytes match the loaded certificate's bytes
  return List<int>.from(cert.der) == certBytes;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  Uri? _initialUri;
  Uri? _latestUri;
  Object? _err;

  StreamSubscription? _sub;
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();

    // _handleIncomingLinks();
    // _handleInitialUri();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }



  

  @override
  Widget build(BuildContext context) {
     String appName = dotenv.env['APP_NAME'] ?? 'DefaultAppName';
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
      title: appName,
      //'Hello',
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
     // final appLinks = AppLinks();
      _appLinks = AppLinks();
      _sub = _appLinks.uriLinkStream.listen((uri) {
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
    _appLinks = AppLinks();

    // Handle links
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      debugPrint('onAppLink: $uri');
      openAppLink(uri);
    });
  }


   void openAppLink(Uri uri) {
    AppConstants.deeplink = uri;
    //_navigatorKey.currentState?.pushNamed(uri.fragment);
  }

  

// Future<void> _handleInitialUri() async {
//   // Guard to ensure the initial URI is handled only once.
//   if (!_initialUriIsHandled) {
//     _initialUriIsHandled = true;
//     print('_handleInitialUri called');
    
//     try {
//       // Use AppLinks to get the initial URI
//       _appLinks = AppLinks();

//       _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
//       debugPrint('onAppLink: $uri');
//       openAppLink(uri);
//     });
//       //final uri = await appLinks.getInitialAppLink();
      
//       // if (uri == null) {
//       //   print('No initial URI');
//       // } else {
//       //   print('Got initial URI: $uri');
//       //   AppConstants.deeplink = uri; // Assign to your constants or handle logic
//       // }

//       // Ensure the widget is still mounted before updating the state
//       if (!mounted) return;
//       setState(() => _initialUri = uri);
//     } on Exception catch (e) {
//       print('Failed to get initial URI: $e');
//       setState(() {
//         _initialUri = null;
//         _err = e; // Store the error to display or handle it
//       });
//     }
//   }
   
// }

 


  // Future<void> _handleInitialUri() async {
  //   // In this example app this is an almost useless guard, but it is here to
  //   // show we are not going to call getInitialUri multiple times, even if this
  //   // was a weidget that will be disposed of (ex. a navigation route change).
  //   if (!_initialUriIsHandled) {
  //     _initialUriIsHandled = true;
  //     print('_handleInitialUri called');
  //     try {
  //       // Use AppLinks to get the initial URI
  //     final appLinks = AppLinks();
  //       final uri = await appLinks.getInitialAppLink();
  //       if (uri == null) {
  //         print('no initial uri');
  //       } else {
  //         print('got initial uri: $uri');
  //       }
  //       AppConstants.deeplink = uri;
  //       setState(() {});
  //       // openAppLink(_latestUri!);
  //       if (!mounted) return;
  //       setState(() => _initialUri = uri);
  //     } on PlatformException {
  //       // Platform messages may fail but we ignore the exception
  //       print('falied to get initial uri');
  //     } on FormatException catch (err) {
  //       if (!mounted) return;
  //       print('malformed initial uri');
  //       setState(() => _err = err);
  //     }
  //   }
  // }

  //  Future<void> _handleInitialUri() async {
  //   // Ensure the initial URI is only handled once.
  //   if (_initialUriIsHandled) return;

  //   _initialUriIsHandled = true;
  //   print('_handleInitialUri called');

  //   try {
  //     // Use AppLinks to get the initial URI
  //     final appLinks = AppLinks();
  //     final uri = await appLinks.getInitialAppLink();

  //     if (uri == null) {
  //       print('No initial URI');
  //     } else {
  //       print('Got initial URI: $uri');
  //     }

  //     setState(() {
  //       _initialUri = uri;
  //       _err = null;
  //     });

  //     // Handle the URI (optional: navigation or other logic)
  //     // Example: Navigate to a specific page
  //     // _navigateToPage(uri);
  //   } on Exception catch (e) {
  //     print('Failed to get initial URI: $e');
  //     setState(() {
  //       _initialUri = null;
  //       _err = e;
  //     });
  //   }
  // }
}

/// This handles '/' and '/details'.
