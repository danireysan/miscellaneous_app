import 'dart:developer';

import 'package:flutter_app_badger/flutter_app_badger.dart';

class BadgePlugin {
  static Future<bool> isBadgeSupported() async {
    return await FlutterAppBadger.isAppBadgeSupported();
  }

  static void updateAppBadger(int badgeNumber) async {
    if (!(await isBadgeSupported())) {
      log('Badge not supported');
      return;
    }

    FlutterAppBadger.updateBadgeCount(badgeNumber);

    if (badgeNumber == 0) removeAppBadger();
  }

  static void removeAppBadger() {
    FlutterAppBadger.removeBadge();
  }
}
