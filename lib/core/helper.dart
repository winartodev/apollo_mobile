import 'dart:io';

class Helper {
  static String getTargetPlatform() {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'ios';
    } else {
      return 'android';
    }
  }
}
