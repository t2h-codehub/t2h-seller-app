import 'package:taptohello/config/flavor_config.dart';

class AppConstants {
  static const String appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'SocioShop',
  );

  static String get baseUrl => FlavorConfig.currentBaseUrl;
  
  static String fcmToken = '';
}

