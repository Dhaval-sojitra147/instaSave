// ignore_for_file: invalid_use_of_protected_member, avoid_function_literals_in_foreach_calls, avoid_print, void_checks, unused_element, await_only_futures, use_build_context_synchronously

import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:instasave/Infrastructure/Base/SharedPreference/shared_preferences.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/DataBase/collection_data.dart';
import 'package:instasave/Infrastructure/DataBase/recent_data.dart';
import 'package:instasave/UI/Screens/CollectionSection/Widgets/add_to_collection_bottumsheet.dart';
import 'package:instasave/UI/Screens/CollectionSection/Widgets/create_collection_popup.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/downloader.dart';
import 'package:instasave/UI/Screens/HomeSection/Widgets/loader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'dart:ui' as ui;

import 'package:video_watermark/video_watermark.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  PageController? pageController = PageController();

  RecentDBHelper recentDB = RecentDBHelper();
  CollectionDBHelper collectionDB = CollectionDBHelper();
  CollectionDBNameHelper collectionNameDB = CollectionDBNameHelper();
  RxString empty = ''.obs;
  RxString feedCategory = 'Story'.obs;
  RxList feedUrl = [].obs;
  RxList thumbnailsUrls = [].obs;
  RxString caption = ''.obs;
  RxString userName = ''.obs;
  RxString userProfilePic = ''.obs;
  RxString? mediapath;

  RxInt imageIndex = 0.obs;
  RxBool isCopyCationEnable = true.obs;
  RxBool isDownloadingDone = true.obs;
  RxBool isReadingDB = false.obs;
  final GlobalKey<State<StatefulWidget>> imageKey =
  GlobalKey<State<StatefulWidget>>();

  Rx<TextEditingController> link = TextEditingController().obs;
  /// Attribution mark

  final RxList<bool> selectedHorizontalAlignment = <bool>[true, false].obs;
  final RxList<bool> selectedVerticalAlignment = <bool>[true, false].obs;
  final RxList<bool> showAttributeMark = <bool>[true, false].obs;
  final RxList<bool> selectedBGStyle = <bool>[true, false].obs;
  RxList aspectRatio = [].obs;
  BannerAd? bannerAd;
  //BannerAd? postBannerAd;
  BannerAd? postBottomBannerAd;
  BannerAd? repostBottomBannerAd;
  final postBannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      request: const AdRequest(),
      size: const AdSize(width: 336, height: 250),
      listener: const BannerAdListener()).obs;
  bool isLoaded = false;
  RxInt rewardScore = 0.obs;
  RewardedAd? rewardedAd;
  RxInt clickCount = 0.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    homeBannerAds();
    postBannerAds();
    postBottomBannerAds();
    repostBottomBannerAds();
    createRewardedAd();
    showRewardedAd();
    super.onInit();
  }

  Future<void> postBannerAds() async{
    postBannerAd.value.load();
  }
  getLink(BuildContext context) async {
   if(link.value.value.text.isEmpty) {
      ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
      if (cdata != null) {
        if (cdata.text!.contains('https://www.instagram.com/') ||
            cdata.text!.contains('https://instagram.com/')) {
          link.value.value = TextEditingValue(text: '${cdata.text}');
          onFind(context);
        }
      }
    }
  }

  TextEditingController collectionNameController = TextEditingController();

  /// Ads *
  homeBannerAds() {
    bannerAd = BannerAd(
        adUnitId: 'ca-app-pub-3940256099942544/6300978111',
        request: const AdRequest(),
        size: const AdSize(width: 335, height: 250),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            print("loaded");
            isLoaded = true;
            update();
          },
          onAdFailedToLoad: (ad, error) {
            print("error: $error");
            ad.dispose();
          },
        ));
    bannerAd!.load();
  }
  /*postBannerAds() {
    postBannerAd = BannerAd(
        adUnitId: 'ca-app-pub-3940256099942544/6300978111',
        request: const AdRequest(),
        size: const AdSize(width: 335, height: 250),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            print("loaded");
            isLoaded = true;
            update();
          },
          onAdFailedToLoad: (ad, error) {
            print("error: $error");
            ad.dispose();
          },
        ));
    return postBannerAd!.load();
  }*/
  postBottomBannerAds() {
    postBottomBannerAd = BannerAd(
        adUnitId: 'ca-app-pub-3940256099942544/6300978111',
        request: const AdRequest(),
        size: const AdSize(width: 336, height: 50),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            print("loaded");
            isLoaded = true;
            update();
          },
          onAdFailedToLoad: (ad, error) {
            print("error: $error");
            ad.dispose();
          },
        ));
    postBottomBannerAd!.load();
  }
  repostBottomBannerAds() {
    repostBottomBannerAd = BannerAd(
        adUnitId: 'ca-app-pub-3940256099942544/6300978111',
        request: const AdRequest(),
        size: const AdSize(width: 375, height: 50),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            print("loaded");
            isLoaded = true;
            update();
          },
          onAdFailedToLoad: (ad, error) {
            print("error: $error");
            ad.dispose();
          },
        ));
    repostBottomBannerAd!.load();
  }

  static String? get rewardedAdUnited {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313';
    }
    return null;
  }

  createRewardedAd() {
    RewardedAd.load(
      adUnitId: rewardedAdUnited.toString(),
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => rewardedAd = ad,
        onAdFailedToLoad: (error) => rewardedAd = null,
      ),
    );
  }
  showRewardedAd() {
    if (rewardedAd != null) {
      rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          createRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          createRewardedAd();
        },
      );
      rewardedAd?.show(
        onUserEarnedReward: (ad, reward) => rewardScore++,
      );
      rewardedAd = null;
    }
  }

  onCollectionCreate() async {
    await collectionNameDB
        .insertCollection(collectionNameController.text)
        .then((value) async {
      await collectionDB.initCollectionDB(collectionNameController.text);
    });
  }

  Future<void> onFind(context) async {
    isCopyCationEnable.value=true;
    feedCategory.value = '';
    feedUrl.value = [].obs;
    thumbnailsUrls.value = [].obs;
    caption.value = '';
    userName.value = '';
    userProfilePic.value = '';
    selectedHorizontalAlignment.value = <bool>[true, false];
    selectedVerticalAlignment.value = <bool>[true, false];
    selectedBGStyle.value = <bool>[true, false];
     showAttributeMark.value = <bool>[true, false];
    imageIndex.value = 0;
    loadingDialog(context);
    var finallink = link.value.text.replaceAll(" ", "").split("/");
    String InstaHandle='kidsry_games';
    if(Get.isSnackbarOpen)
      {
        Get.closeCurrentSnackbar;
      }

    feedCategory.value = finallink[3] == 'p'
        ? 'Post'
        : finallink[3] == 'reel'
            ? 'Reels'
            : 'Stories';

    FlutterInsta flutterInsta = FlutterInsta();
    if (link.value.text.contains('/reel/')) {
      await flutterInsta.downloadReels(link.value.text).then((value) async {
        if (!value.containsKey('status')) {
          feedUrl.value.add(value['videoUrl']);
          userProfilePic.value=value['ownerProfilePic'];
          thumbnailsUrls.value.add(value['thumbNail']![0]);
          print(feedUrl.value);
          caption.value = value['caption'];
          userName.value = value['owner'];
          Clipboard.setData( ClipboardData(text: "${caption.value}\n\nWith @$InstaHandle by @${userName.value}"));
          for (int i = 0; i < feedUrl.value.length; i++) {
            List<Map<String, dynamic>> data = await recentDB.readRecentData();
            if (data.length < 10) {
              await recentDB.insertRecent(userName:userName.value,feedUrl:feedUrl.value[i],
                  caption:caption.value, profilePic:userProfilePic.value,
                  mediaType: 'Reels' ,thumbnailUrl: thumbnailsUrls.value[i]);
            } else if (data.length >= 10) {
              var id = data.first['id'];
              await recentDB.deleteRecent(id);
              await recentDB.insertRecent(
                  userName:userName.value,feedUrl:feedUrl.value[i],
                  caption:caption.value, profilePic:userProfilePic.value,
                  mediaType: 'Reels' ,thumbnailUrl: thumbnailsUrls.value[i]);
            }
          }
          Get.back();
          Get.toNamed(RoutesConstants.postScreen);
          link.value.text='';
        } else {
          Future.delayed(const Duration(milliseconds: 1000), () {
            Get.back();
            Get.snackbar(
              AppConstants.oops.tr,
              AppConstants.somethingWentWrong.tr,
              snackStyle: SnackStyle.FLOATING,
              backgroundGradient:
                  LinearGradient(colors: ColorConstants.linearGradientButton),
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 3),
              colorText: ColorConstants.white,
            );
          });
        }
      });
    } else if (link.value.text.contains('/stories/')) {
      await flutterInsta.downloadStories(link.value.text).then((value) async {
        if(!value.containsKey('status')){
        feedUrl.value.add(value['mediaUrl']![0]);
        thumbnailsUrls.value.add(value['thumbnailUrl']![0]);
        var linkEdit = link.value.text.replaceAll(" ", "").split("/");
        await flutterInsta.getProfileData(linkEdit[4]);
        userName.value = linkEdit[4];
        userProfilePic.value = flutterInsta.imgUrl;
        for (int i = 0; i < feedUrl.value.length; i++) {
          List<Map<String, dynamic>> data = await recentDB.readRecentData();
          if (data.length < 10) {
            await recentDB.insertRecent(userName:userName.value,feedUrl:feedUrl.value[i],
                caption:caption.value, profilePic:userProfilePic.value,
                mediaType: 'Stories' ,thumbnailUrl: thumbnailsUrls.value[i]);
          } else if (data.length >= 10) {
            var id = data.first['id'];
            await recentDB.deleteRecent(id);
            await recentDB.insertRecent(
                userName:userName.value,feedUrl:feedUrl.value[i],
                caption:caption.value, profilePic:userProfilePic.value,
                mediaType: 'Stories' ,thumbnailUrl: thumbnailsUrls.value[i]);
          }
        }
        Get.back();
        Get.toNamed(RoutesConstants.postScreen);
        link.value.text='';}
        else{
          Future.delayed(const Duration(seconds: 3), () {
            Get.back();
            Get.snackbar(
              AppConstants.oops.tr,
              AppConstants.somethingWentWrong.tr,
              snackStyle: SnackStyle.FLOATING,
              backgroundGradient: LinearGradient(colors: ColorConstants.linearGradientButton),
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 3),
              colorText: ColorConstants.white,
            );
          });
        }
      });
    }
    else if (link.value.text.contains('/p/')) {
      await flutterInsta.downloadPosts(link.value.text).then((value) async {
        if (!value.containsKey('status')) {
          feedUrl.value.addAll(value['PostUrl']);
          caption.value = value['caption'];
          userName.value = value['owner'];
          userProfilePic.value = value['ownerProfilePic'];

          thumbnailsUrls.value.addAll(value['thumbnails']);
          Clipboard.setData( ClipboardData(text: "${caption.value}\n\nWith @$InstaHandle by @${userName.value}"));
          for (int i = 0; i < feedUrl.value.length; i++) {
            List<Map<String, dynamic>> data = await recentDB.readRecentData();
            if (data.length < 10) {
              await recentDB.insertRecent(userName:userName.value,feedUrl:feedUrl.value[i],
                  caption:caption.value, profilePic:userProfilePic.value,
                  mediaType: 'Post' ,thumbnailUrl: thumbnailsUrls.value[i]);
            } else if (data.length >= 10) {
              var id = data.first['id'];
              await recentDB.deleteRecent(id);
              await recentDB.insertRecent(userName:userName.value,feedUrl:feedUrl.value[i],
                  caption:caption.value, profilePic:userProfilePic.value,
                  mediaType: 'Post' ,thumbnailUrl: thumbnailsUrls.value[i]);
            }
          }
          Get.back();
          Get.toNamed(RoutesConstants.postScreen);
          link.value.text='';
        }
        else {
          Future.delayed(const Duration(seconds: 3), () {
            Get.back();
            Get.snackbar(
              AppConstants.oops.tr,
              value['message'],
              snackStyle: SnackStyle.FLOATING,
              backgroundGradient: LinearGradient(colors: ColorConstants.linearGradientButton),
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 3),
              colorText: ColorConstants.white,
            );
          });
        }
      });
    }
  }
  /// Auto download

  Future<void> downloading(context)async{
    bool? isAutoDownload = await LocalStorage().getBoolValuesSF('DownloadAutoStart')??false;
    print('Auto download $isAutoDownload');
    if(isAutoDownload!){

    for(int i=0;i<feedUrl.length;i++) {
      if (!feedUrl[i].toString().contains(AppConstants.jpg.tr))
      {
        isReadingDB.value = true;
        if (showAttributeMark[0] == true) {
          await downloadWaterMarkedVideo(context: context, key: imageKey, link: feedUrl[i].toString());
        } else {
          await downloadVideo(link: feedUrl[i].toString());
        }
      } else if (
      feedUrl[i].toString().contains(
          AppConstants.jpg.tr)) {
        await downloadImage(context, imageKey);
      }
    }
    Get.snackbar('Download Status', 'Download complete...',
      snackStyle: SnackStyle.FLOATING,
      backgroundGradient:
      LinearGradient(colors: ColorConstants.linearGradientButton),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      colorText: ColorConstants.white,
    );
  }
  }

  downloadImage(BuildContext context,GlobalKey key) async {
    Random rng = Random();
    RenderRepaintBoundary? boundary;
    if (key.currentContext != null) {
      boundary =
      key.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    }
    ui.Image image = await boundary!.toImage(pixelRatio: 10);
    final directory = (await getExternalStorageDirectory())!.path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    String path = '$directory/screenshot/${rng.nextInt(200)}.jpg';
    File imgFile = File(path);
    if (imgFile.existsSync() == false) {
      await File('$directory/screenshot/${rng.nextInt(200)}.jpg')
          .create(recursive: true);
    }
    await imgFile.writeAsBytes(pngBytes);
    await saveImage(imgFile);
    print('Download Done');
    isDownloadingDone.value = true;
    return await imgFile;
  }

  Future<void> saveImage(File file) async {
    Uint8List imagePath = await file.readAsBytes();
    await ImageGallerySaver.saveImage(imagePath);
  }

  Future<String> downloadVideo({required String link}) async {
    var appDocDir = await getApplicationDocumentsDirectory();
    String savePath = "${appDocDir.path}/${DateTime.now()}.mp4";
    await Dio().download(link, savePath);
    // File imageFile = File(savePath);
   await ImageGallerySaver.saveFile(savePath,name: 'InstaSave${DateTime.now()}').then((value) {
    isReadingDB.value = false;
  });
  return savePath;
  }


  Future<void> downloadWaterMarkedVideo({String? link, BuildContext? context, GlobalKey? key,bool wantToSave=false,bool wantToShare=false}) async {
    Random rng=Random();
    RenderRepaintBoundary? boundary = key!.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    ui.Image image= await boundary!.toImage(pixelRatio: 10);
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes =byteData!.buffer.asUint8List();
    String path='$directory/tag/${rng.nextInt(200)}.png';
    File imgFile =File(path);
    if(imgFile.existsSync()==false) {
      await File('$directory/tag/${rng.nextInt(200)}.png').create(recursive: true);
    }
    await imgFile.writeAsBytes(pngBytes);
    var appDocDir = await getTemporaryDirectory();
    String videoPath = "${appDocDir.path}/temp.mp4";
    var dio=Dio();
    await dio.download(link!, videoPath);

    VideoWatermark videoWatermark =await VideoWatermark(sourceVideoPath: videoPath,
      watermark: Watermark(image: WatermarkSource.file(imgFile.path),
        watermarkAlignment:  selectedVerticalAlignment[0] == true &&
            selectedHorizontalAlignment[0] == true
            ? WatermarkAlignment.bottomLeft
            : selectedVerticalAlignment[0] == true &&
            selectedHorizontalAlignment[0] == false
            ? WatermarkAlignment.botomRight
            : selectedVerticalAlignment[0] == false && selectedHorizontalAlignment[0] == false
            ? WatermarkAlignment.topRight
            : WatermarkAlignment.topLeft,
        watermarkSize:  const WatermarkSize(154,34),
        opacity: 1,
      ),
      outputFormat: OutputFormat.mp4,
      onSave: (path) async {
        isDownloadingDone.value = true;
        await _videoDownload(path!);
        if(wantToSave==true){
            isReadingDB.value = false;
            var collectionName = await collectionNameDB.readCollectionData();
            if (collectionName.isEmpty) {
              isReadingDB.value = false;
              await createCollectionPopUp(
                  context: context,
                  textController:collectionNameController,
                  onCreateTap: () async {
                    Get.back();
                    await collectionNameDB.insertCollection(collectionNameController.text).then((value) async {
                      await collectionDB.initCollectionDB(collectionNameController.text);
                    });

                    await saveToCollectionBottomSheet(
                        context: context,
                        imgPath: path,
                        mediaType:feedCategory.value);
                  });
            } else {
              isReadingDB.value = false;
              await saveToCollectionBottomSheet(
                  context: context,
                  imgPath: path,
                  mediaType: feedCategory.value);
            }
        }
        if(wantToShare==true){
          XFile xfile = XFile(path);
          await Share.shareXFiles([xfile]);
        }
      },
      progress: (value){
        print("  ========== Video Conversion Progress-> $value"
        );
      },
    );
    await videoWatermark.generateVideo();
  }

  Future<String> _videoDownload(String videoPath) async {

  await ImageGallerySaver.saveFile(videoPath,name: 'InstaSave${DateTime.now()}',).then((value) {isReadingDB.value = false;});
    return videoPath;
  }

   onSaveTap({BuildContext? context,GlobalKey? imageKey}) async {
    isReadingDB.value = true;
    if(!feedUrl[imageIndex.value].toString().contains('jpg')){
      if(showAttributeMark[0] == true) {
        await downloadWaterMarkedVideo(wantToSave: true,context: context,key: imageKey,link: feedUrl[imageIndex.value].toString());
      }else{
        String videoPath=await downloadVideo(link: feedUrl[imageIndex.value].toString());
        isReadingDB.value = false;
        var collectionName = await collectionNameDB.readCollectionData();
        if (collectionName.isEmpty) {
          isReadingDB.value = false;
          await createCollectionPopUp(
              context: context,
              textController:collectionNameController,
              onCreateTap: () async {
                Get.back();
                await collectionNameDB.insertCollection(collectionNameController.text).then((value) async {
                  await collectionDB.initCollectionDB(collectionNameController.text);
                });

                await saveToCollectionBottomSheet(
                    context: context,
                    imgPath: videoPath,
                    mediaType:feedCategory.value);
              });
        } else {
          isReadingDB.value = false;
          await saveToCollectionBottomSheet(
              context: context,
              imgPath: videoPath,
              mediaType: feedCategory.value);
        }
      }
    }
    else if(feedUrl[imageIndex.value].toString().contains('jpg'))
    {
      File downloadedImg = await downloadImage(context!, imageKey!);
      var collectionName = await collectionNameDB.readCollectionData();
      if (collectionName.isEmpty) {
        isReadingDB.value = false;
        await createCollectionPopUp(
            context: context,
            textController: collectionNameController,
            onCreateTap: () async {
              Get.back();
              await collectionNameDB.insertCollection(collectionNameController.text).then((value) async {
                await collectionDB.initCollectionDB(collectionNameController.text);
              });
              await saveToCollectionBottomSheet(
                  context: context,
                  imgPath: downloadedImg.path,
                  mediaType: feedCategory.value);
            });
      } else {
        isReadingDB.value = false;
        await saveToCollectionBottomSheet(
            context: context,
            imgPath: downloadedImg.path,
            mediaType: feedCategory.value);
      }
    }
  }


  loadingDialog(context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => AlertDialog(
              backgroundColor: ColorConstants.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              content: const Loader(),
            ));
  }
}
