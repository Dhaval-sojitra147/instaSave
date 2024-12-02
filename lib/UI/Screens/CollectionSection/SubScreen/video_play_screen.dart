
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/Infrastructure/DataBase/collection_data.dart';
import 'package:instasave/UI/Screens/CollectionSection/Widgets/delete_collection_popup.dart';
import 'package:instasave/UI/Screens/CollectionSection/collection_controller.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/VideoPlayer/myVideoPlayer.dart';

class VideoPlayScreen extends GetView<CollectionController> {


  VideoPlayScreen({super.key});

  final CollectionDBHelper collectionDB = CollectionDBHelper();
  final String link = Get.arguments[0];
  final String dataBaseName = Get.arguments[2];
  final String dataType = Get.arguments[3];
  final List links=Get.arguments[1];
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.black,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () { Get.back(); },),
          title: Text(dataType),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () async{
                  await deleteCollectionPopUp(
                  context: context,
                  collectionName: dataType == 'Stories' ? 'Story' : 'Reel',
                  title: dataType,
                  onDeleteTap:
                      () async {
                     for(int i=0;i<links.length;i++){
                       if(link==links[i]){
                         links.removeAt(i);
                         await collectionDB.updateCollection(dataBaseName, 1, Reels: jsonEncode(links));
                       }
                     }
                     Get.back();
                     Get.back();
                      });
                },
                child: Container(
                  height: displayWidth(context) * .085,
                  width: displayWidth(context) * .085,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: ColorConstants.linearGradientDeleteButton),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:  Icon(Icons.delete,color: ColorConstants.white,size: displayWidth(context) * .04,),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(displayWidth(context) * .0533),
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
                          displayWidth(context) * .021),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorConstants.cardBackGroundColor,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: MyVideoPlayer(
                              isDownLoaded: true,
                              autoPlay: true,
                              videoUrl: link,
                              newKey: UniqueKey(),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )
          ,
        ),
      );
  }
}