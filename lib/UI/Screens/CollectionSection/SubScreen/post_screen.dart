import 'dart:convert';
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/Infrastructure/DataBase/collection_data.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/CollectionSection/collection_controller.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/VideoPlayer/myVideoPlayer.dart';

class PostScreen extends GetView<CollectionController> {
  CollectionDBHelper collectionDB = CollectionDBHelper();
  @override
  CollectionController controller = CollectionController();

  List? data;
  String? posts;
  String? collectionName;

  PostScreen({super.key, this.collectionName});

  RxInt i = 0.obs;

  Future<void> getData() async {
    data =
        await collectionDB.readCollectionData(collectionName: collectionName);
    if (data!.isNotEmpty) {
      if (data!.first['Posts'] != null) {
        i.value = jsonDecode(data!.first['Posts']).length;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CollectionController>(
        init: CollectionController(),
        builder: (controller) {
        getData();
         return Container(
          height: displayHeight(context),
          width: displayWidth(context),
          decoration: const BoxDecoration(
            color: ColorConstants.appBar,
          ),
          child: i.value != 0
              ? GridView.builder(
                  itemCount: i.value,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    // bool exists = io.File(jsonDecode(data!.first['Posts'])[index]).exists();
                    return Container(
                      margin: EdgeInsets.all(displayWidth(context) * .021),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ColorConstants.caption,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            IgnorePointer(
                                ignoring: true,
                                child: Image.asset(
                                    ImageConstants.captionFieldGlassmorphism)),
                            Center(
                              child: Container(
                                margin: EdgeInsets.all(displayWidth(context) * .016),
                                height: displayHeight(context) * .2155,
                                width: displayWidth(context) * .4666,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: ColorConstants.cardBackGroundColor,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: jsonDecode(data!.first['Posts'])[index]
                                          .toString()
                                          .contains('jpg')
                                      ? Image.file(
                                          io.File(jsonDecode(
                                              data!.first['Posts'])[index]),
                                          fit: BoxFit.fill,
                                        )
                                      : MyVideoPlayer(
                                          videoUrl: jsonDecode(
                                              data!.first['Stories'])[index],
                                          newKey: UniqueKey(),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConstants.emptyCollection,
                      height: displayHeight(context) * .1477,
                      width: displayWidth(context) * .32,
                    ),
                    Text(
                      AppConstants.oops.tr,
                      style: TextStylePoppinsSemiBold18(
                          color: ColorConstants.white),
                    ),
                    Text(
                      AppConstants.emptyCollection.tr,
                      textAlign: TextAlign.center,
                      style: TextStylePoppinsMedium12(
                          color: ColorConstants.white.withOpacity(.4)),
                    ),
                  ],
                ),
        );}, //
      ),
    );
  }
}
