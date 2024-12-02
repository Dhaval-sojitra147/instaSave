import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/CollectionSection/Widgets/collection_card.dart';
import 'package:instasave/UI/Screens/CollectionSection/Widgets/create_collection_popup.dart';
import 'package:instasave/UI/Screens/CollectionSection/Widgets/delete_collection_popup.dart';
import 'package:instasave/UI/Screens/CollectionSection/Widgets/recent_card.dart';
import 'package:instasave/UI/Screens/CollectionSection/collection_controller.dart';
import 'package:instasave/UI/Screens/HomeSection/home_controller.dart';
import 'package:instasave/Widgets/app_bar.dart';

class CollectionScreen extends GetView<CollectionController> {

  CollectionScreen({super.key});

  @override
  CollectionController controller = Get.put(CollectionController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollectionController>(builder: (controller) {
      controller.getData();
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar:
            instasaveAppBar(title: AppConstants.collection.tr, getBack: false),
        body: SizedBox(
          height: displayHeight(context),
          width: displayWidth(context),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: displayWidth(context) * .0533),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (controller.isRecent.value == true)
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: displayHeight(context) * .0295,
                                  bottom: displayHeight(context) * .0147,
                                ),
                                child: Text(
                                  AppConstants.recent.tr,
                                  style: TextStylePoppinsSemiBold18(
                                      color: ColorConstants.white),
                                ),
                              ),
                            ),

                          /// Recent section
                          SizedBox(
                            height: controller.isRecent.value == true
                                ? displayHeight(context) * .3078
                                : 0,
                            child: ListView.builder(
                              itemCount: controller.recentData.isNotEmpty
                                  ? controller.recentData.length
                                  : 0,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                //var reversedData=snapshot.data!.reversed.toList();
                                var reversedData =
                                    controller.recentData.reversed.toList();
                                Future.delayed(Duration.zero, () async {
                                  controller.isRecent.value = true;
                                });
                                return recentCard(
                                  mediaLink: reversedData[index]['thumbnailUrl']
                                      .toString(),
                                  profileImageLink: reversedData[index]
                                          ['profilePic']
                                      .toString(),
                                  userName: reversedData[index]['userName']
                                      .toString(),
                                  caption:
                                      reversedData[index]['caption'].toString(),
                                  onDownloadTap: () async {
                                    homeController.feedCategory.value = '';
                                    homeController.feedUrl.value = [].obs;
                                    homeController.thumbnailsUrls.value =
                                        [].obs;
                                    homeController.caption.value = '';
                                    homeController.userName.value = '';
                                    homeController.userProfilePic.value = '';
                                    homeController.selectedHorizontalAlignment
                                        .value = <bool>[true, false];
                                    homeController.selectedVerticalAlignment
                                        .value = <bool>[true, false];
                                    homeController.selectedBGStyle.value =
                                        <bool>[true, false];
                                    homeController.imageIndex.value = 0;
                                    homeController.caption.value =
                                        reversedData[index]['caption']
                                            .toString();
                                    homeController.userName.value =
                                        reversedData[index]['userName']
                                            .toString();
                                    homeController.userProfilePic.value =
                                        reversedData[index]['profilePic']
                                            .toString();
                                    homeController.feedUrl.addAll([
                                      reversedData[index]['feedUrl'].toString(),
                                      homeController.feedCategory.value =
                                          reversedData[index]['mediaType']
                                              .toString(),
                                    ]);
                                    Get.toNamed(RoutesConstants.feedScreen);
                                  },
                                );
                              },
                            ),
                          ),

                          /// Collection Section
                          SizedBox(
                              height: displayHeight(context) * .7,
                              child: controller.collectionGroup.isNotEmpty
                                  ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                          if (controller.recentData.isNotEmpty)
                                            if (controller
                                                .collectionGroup.isEmpty)
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: displayHeight(
                                                                context) *
                                                            .0381,
                                                        bottom: displayHeight(
                                                                context) *
                                                            .0381),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          AppConstants
                                                              .collection.tr,
                                                          style: TextStylePoppinsRegular18(
                                                              color:
                                                                  ColorConstants
                                                                      .white),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () =>
                                                              createCollectionPopUp(
                                                            context: context,
                                                            textController:
                                                                controller
                                                                    .collectionNameController,
                                                            //controller: controller
                                                          ),
                                                          child: Container(
                                                            height: displayHeight(
                                                                    context) *
                                                                .0492,
                                                            width: displayWidth(
                                                                    context) *
                                                                .1066,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: ColorConstants
                                                                      .linearGradientDeleteButton),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: const Icon(
                                                              Icons.add,
                                                              color:
                                                                  ColorConstants
                                                                      .white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Image.asset(
                                                    ImageConstants
                                                        .emptyCollection,
                                                    height:
                                                        displayHeight(context) *
                                                            .1108,
                                                    width:
                                                        displayWidth(context) *
                                                            .24,
                                                  ),
                                                  Text(
                                                    AppConstants.oops.tr,
                                                    style:
                                                        TextStylePoppinsSemiBold16(
                                                            color:
                                                                ColorConstants
                                                                    .white),
                                                  ),
                                                  Text(
                                                    AppConstants
                                                        .createCollection.tr,
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        TextStylePoppinsRegular12(
                                                            color: ColorConstants
                                                                .white
                                                                .withOpacity(
                                                                    .4)),
                                                  )
                                                ],
                                              ),
                                          if (controller
                                              .collectionGroup.isNotEmpty)
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      displayHeight(context) *
                                                          .0381),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    AppConstants.collection.tr,
                                                    style:
                                                        TextStylePoppinsRegular18(
                                                            color:
                                                                ColorConstants
                                                                    .white),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      createCollectionPopUp(
                                                        context: context,
                                                        textController: controller
                                                            .collectionNameController,
                                                      );
                                                      await controller
                                                          .getCollectionGroupData();
                                                    },
                                                    child: Container(
                                                      height: displayHeight(
                                                              context) *
                                                          .0492,
                                                      width: displayWidth(
                                                              context) *
                                                          .1066,
                                                      decoration: BoxDecoration(
                                                        gradient: LinearGradient(
                                                            colors: ColorConstants
                                                                .linearGradientDeleteButton),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: ColorConstants
                                                            .white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          SizedBox(
                                              height: controller
                                                          .isRecent.value ==
                                                      false
                                                  ? displayHeight(context) * .55
                                                  : controller.isCollection
                                                              .value ==
                                                          true
                                                      ? displayHeight(context) *
                                                          .3694
                                                      : 0,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  child: Obx(
                                                    () => ListView.builder(
                                                        physics:
                                                            const BouncingScrollPhysics(),
                                                        itemCount: //controller.collectionGroup.isNotEmpty
                                                            // ?
                                                            controller
                                                                    .collectionGroup
                                                                    .length +
                                                                1
                                                        // : 0
                                                        ,
                                                        itemBuilder:
                                                            (context, index) {
                                                          Future.delayed(
                                                              Duration.zero,
                                                              () async {
                                                            if (controller
                                                                .collectionGroup
                                                                .isNotEmpty) {
                                                              controller
                                                                  .isCollection
                                                                  .value = true;
                                                            } else {
                                                              controller
                                                                  .isCollection
                                                                  .value = false;
                                                            }
                                                          });
                                                          return index <
                                                                  controller
                                                                      .collectionGroup
                                                                      .length
                                                              ? GestureDetector(
                                                                  onTap:
                                                                      () async {
                                                                    controller
                                                                        .collectionName
                                                                        .value = controller
                                                                            .collectionGroup[index]
                                                                        [
                                                                        'Collections'];
                                                                    Get.toNamed(
                                                                        RoutesConstants
                                                                            .subCollectionScreen);
                                                                    await controller
                                                                        .getCollectionData();
                                                                  },
                                                                  child:
                                                                      collectionCard(
                                                                    collectionName:
                                                                        controller.collectionGroup[index]
                                                                            [
                                                                            'Collections'],
                                                                    onDeleteTap:
                                                                        () async {
                                                                      await deleteCollectionPopUp(
                                                                          context:
                                                                              context,
                                                                          collectionName:controller.collectionGroup[index]
                                                                          [
                                                                          'Collections'],
                                                                          onDeleteTap:
                                                                              () {
                                                                            controller.collectionNameDB.deleteCollection(controller.collectionGroup[index]['id']);
                                                                            controller.getData();
                                                                            Get.back();
                                                                          });
                                                                    },
                                                                  ))
                                                              : Container(
                                                                  height: displayHeight(
                                                                          context) *
                                                                      .0923,
                                                                );
                                                        }),
                                                  )))
                                        ])
                                  : Container())
                        ]),
                  ),
                ),

                /// Recent And Collections Are Empty
                Padding(
                  padding: EdgeInsets.only(top: displayHeight(context) * .2709),
                  child: Obx(
                    () => Column(
                      children: controller.isRecent.value == false &&
                              controller.isCollection.value == false
                          ? [
                              Image.asset(ImageConstants.emptyCollection,
                                  height: displayHeight(context) * .1477,
                                  width: displayWidth(context) * .32),
                              Text(AppConstants.oops.tr,
                                  style: TextStylePoppinsSemiBold18(
                                      color: ColorConstants.white)),
                              Text(AppConstants.createCollection.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStylePoppinsMedium12(
                                      color: ColorConstants.white
                                          .withOpacity(.4))),
                              GestureDetector(
                                onTap: () async {
                                  await createCollectionPopUp(
                                      context: context,
                                      textController:
                                          controller.collectionNameController);
                                },
                                child: Container(
                                  height: displayHeight(context) * .0469,
                                  width: displayWidth(context) * .488,
                                  margin: EdgeInsets.only(
                                      top: displayHeight(context) * .0381),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: LinearGradient(
                                          colors: ColorConstants
                                              .linearGradientButton)),
                                  alignment: Alignment.center,
                                  child: Text(AppConstants.createCollection.tr,
                                      style: TextStylePoppinsMedium14()),
                                ),
                              ),
                            ]
                          : [],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
