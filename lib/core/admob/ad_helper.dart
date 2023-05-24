import 'dart:io';

class AdHelper {
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3434618620442413/4436581333";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3434618620442413/4436581333";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
