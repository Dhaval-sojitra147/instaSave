import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6911353052442103/4609130516';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
  //ios changes id in interstitialAd
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6911353052442103/3268128688";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/5135589807";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  //ios changes id in rewardedAd
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6911353052442103/3978575129";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/5135589807";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

}