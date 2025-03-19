import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  String appName = dotenv.env['APP_NAME'] ?? 'DefaultAppName';

  /// Update Android app name in values/strings.xml
  final androidFile = File('android/app/src/main/res/values/strings.xml');
  if (!androidFile.existsSync()) {
    print("Android strings.xml file does not exist. Creating it now...");
    await androidFile.create(recursive: true);
  }

  String androidContent = '''
<resources>
    <string name="app_name">$appName</string>

    <!-- Facebook configuration -->
    <string name="facebook_app_id">2071769666505226</string>
    <string name="fb_login_protocol_scheme">fb2071769666505226</string>
    <string name="facebook_client_token">d44771e1609fa0ec856b336d0815038f</string>
</resources>
''';

  await androidFile.writeAsString(androidContent);
  print(" Android app name updated to: $appName");

  /// Update iOS app name in Info.plist
  final iosFile = File('ios/Runner/Info.plist');
  if (!iosFile.existsSync()) {
    print("iOS Info.plist file does not exist. Creating it now...");
    await iosFile.create(recursive: true);
  }

  String iosContent = await iosFile.readAsString();
  iosContent = iosContent.replaceAll(
    RegExp(r'<key>CFBundleDisplayName</key>\s*<string>.*</string>'),
    '<key>CFBundleDisplayName</key><string>$appName</string>'
  );

  await iosFile.writeAsString(iosContent);
  print("iOS app name updated to: $appName");

  print("App name successfully updated from .env: $appName");
}
