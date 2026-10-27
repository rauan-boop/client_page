// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

Future<String> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  try {
    if (kIsWeb) {
      // Для Web версии (твоя PWA)
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      return '${webBrowserInfo.browserName.name} on ${webBrowserInfo.platform} (${webBrowserInfo.userAgent})';
    } else if (Platform.isAndroid) {
      // Для Android
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return '${androidInfo.manufacturer} ${androidInfo.model} (Android ${androidInfo.version.release})';
    } else if (Platform.isIOS) {
      // Для iOS
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return '${iosInfo.name} ${iosInfo.model} (iOS ${iosInfo.systemVersion})';
    }
  } catch (e) {
    return 'Unknown Device/Platform';
  }

  return 'Unknown Platform';
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
