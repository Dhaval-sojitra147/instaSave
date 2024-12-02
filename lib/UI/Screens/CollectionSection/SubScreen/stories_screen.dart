import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/Infrastructure/DataBase/collection_data.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/CollectionSection/collection_controller.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/VideoPlayer/myVideoPlayer.dart';
import 'package:instasave/Widgets/blur.dart';

class StoriesScreen extends GetView<CollectionController> {
  String? collectionName;

  StoriesScreen({this.collectionName});

  CollectionDBHelper collectionDB = CollectionDBHelper();
  @override
  CollectionController controller = CollectionController();

  RxInt i = 0.obs;
  List? data;

  Future<void> getData() async {
    data =
        await collectionDB.readCollectionData(collectionName: collectionName);
    if (data!.isNotEmpty) {
      if (data!.first['Stories'] != null) {
        i.value = jsonDecode(data!.first['Stories']).length;
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
            //    border: Border(top: BorderSide(color: ColorConstants.borderColor)),
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
                            margin: EdgeInsets.all(
                                displayWidth(context) * .016),
                            height: displayHeight(context) * .2155,
                            width: displayWidth(context) * .4666,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorConstants.cardBackGroundColor,
                            ),
                            child: jsonDecode(
                                data!.first['Stories'])[index]
                                .toString()
                                .contains('jpg')
                                ? ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child:  Image.file(
                                File(jsonDecode(
                                    data!.first['Stories'])[index]),
                                fit: BoxFit.scaleDown,
                              )
                            )   : ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: MyVideoPlayer(
                                allowPlay: false,
                                isDownLoaded: true,
                                autoPlay: true,
                                videoUrl:
                                jsonDecode(data!.first['Stories'])[index],
                                newKey: UniqueKey(),
                              ),
                            ),
                          ),
                        ),
                        jsonDecode(
                            data!.first['Stories'])[index]
                            .toString()
                            .contains('jpg')
                            ? const Center() : InkWell(
                          onTap: (){
                            controller.videoUrl.value = jsonDecode(data!.first['Stories'])[index];
                            String? dataBaseName=collectionName;
                            String? dataType='Stories';
                            List dev=[controller.videoUrl.value,jsonDecode(data!.first['Stories']),dataBaseName,dataType];
                            Get.toNamed(RoutesConstants.videoPlayScreen,arguments: dev);
                          },
                              child: Center(
                          child: Blur(
                                borderRadius: BorderRadius.circular(12),
                                alignment: Alignment.center,
                                child: Container(height: 40,width: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),border: Border.all(color: Colors.white,width: 1.33)),
                                    child: const Icon(Icons.play_circle,color: ColorConstants.white,))
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
        );},
      ),
    );
  }
}
