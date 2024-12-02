
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/Infrastructure/DataBase/collection_data.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/CollectionSection/Widgets/create_collection_popup.dart';
import 'package:instasave/UI/Screens/CollectionSection/collection_controller.dart';

Future saveToCollectionBottomSheet({
  BuildContext? context,
  String? imgPath,
  String? mediaType,
}) async {
  CollectionDBHelper collectionDB = CollectionDBHelper();

  CollectionController controller =Get.put(CollectionController());

  RxList<Map<String, dynamic>> data = (await controller.collectionNameDB.readCollectionData()).obs;

  RxList reels = [].obs;
  RxList stories = [].obs;
  RxList posts = [].obs;
  TextEditingController collectionNameController=TextEditingController();

  Future<void> getGata() async {
    data.value=await controller.collectionNameDB.readCollectionData();
    data.refresh();
  }

  return showModalBottomSheet(
    backgroundColor: ColorConstants.appBar,
      context: context!,
      isScrollControlled: true,
      builder: (context)
  {
    return GetBuilder<CollectionController>(
      builder: (controller){
        controller.getCollectionGroupData();
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),),
              margin:  EdgeInsets.all(displayWidth(context) * .0426,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SizedBox(
                    height: displayHeight(context) * .0295,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        vertical: displayHeight(context) * .0376),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppConstants.collection.tr,
                          style:
                          TextStylePoppinsRegular18(
                              color: ColorConstants
                                  .white),
                        ),
                        GestureDetector(
                          onTap: () async {
                              await createCollectionPopUp(
                                context: context,
                                textController: collectionNameController,
                                // controller: controller
                              ).then((value) async {
                                await getGata();
                                collectionNameController=TextEditingController(text: '');
                              });
                              },
                          child: Container(
                            height: displayHeight(context) * .0492,
                            width: displayWidth(context) * .1066,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: ColorConstants
                                      .linearGradientDeleteButton),
                              borderRadius:
                              BorderRadius.circular(
                                  12),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: ColorConstants.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: displayHeight(context) * .0295,
                  ),
                  /// collections
                  Center(
                    child: SizedBox(
                      height: displayHeight(context)-displayHeight(context) * .2339,
                      child:   ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.collectionGroup.length,//data.length,
                            itemBuilder: (context,index){
                              return GestureDetector(
                                onTap:  () async {

                                  var collectionData =await collectionDB.readCollectionData(collectionName: controller.collectionGroup[index]['Collections']);
                                  stories.clear();
                                  posts.clear();
                                  reels.clear();
                                  if(mediaType=='Reels')
                                  {
                                    if(collectionData.isNotEmpty){
                                      if (collectionData
                                          .first['Reels'] !=
                                          null) {
                                        reels.addAll(jsonDecode(collectionData.first['Reels']));
                                        List reelToAdd = reels + [imgPath];
                                        await collectionDB.updateCollection(controller.collectionGroup[index]['Collections'], index, Reels: jsonEncode(reelToAdd));
                                        print("Data Is Inserted");
                                      } else {
                                        reels.add(imgPath);
                                        List reelToAdd = reels;
                                        await collectionDB
                                            .updateCollection(
                                            controller.collectionGroup[index]['Collections'],1, Reels: jsonEncode(reelToAdd));
                                        print("Data Is Inserted");
                                      }
                                    }else{
                                      reels.add(imgPath);
                                      List reelToAdd = reels;
                                      await collectionDB
                                          .insertCollection(
                                          controller.collectionGroup[index]
                                          ['Collections'],
                                          Reels: jsonEncode(
                                              reelToAdd));
                                      print("Data Is Inserted");}
                                  }
                                  else if(mediaType=='Stories'){
                                    if(collectionData.isNotEmpty){
                                      if (collectionData.first['Stories'] != null) {
                                        stories.addAll(jsonDecode(collectionData.first['Stories']));
                                        List storyToAdd = stories + [imgPath];
                                        await collectionDB
                                            .updateCollection(controller.collectionGroup[index]['Collections'],
                                            index, Stories: jsonEncode(storyToAdd));
                                        print("Data Is Inserted");
                                      } else {
                                        stories.add(imgPath);
                                        List storyToAdd = stories;
                                        await collectionDB
                                            .updateCollection(
                                            controller.collectionGroup[index]['Collections'],1, Stories: jsonEncode(storyToAdd));
                                        print("Data Is Inserted");
                                      }
                                    }else{
                                      stories.add(imgPath);
                                      List storyToAdd = stories;
                                      await collectionDB
                                          .insertCollection(
                                          controller.collectionGroup[index]
                                          ['Collections'],
                                          Stories: jsonEncode(
                                              storyToAdd));
                                      print("Data Is Inserted");}
                                  }
                                  else if(mediaType=='Post'){
                                    if(collectionData.isNotEmpty){
                                      if (collectionData
                                          .first['Posts'] !=
                                          null) {
                                        posts.addAll(jsonDecode(
                                            collectionData
                                                .first['Posts']));
                                        List postToAdd =
                                            posts + [imgPath];
                                        await collectionDB
                                            .updateCollection(
                                            controller.collectionGroup[index]
                                            ['Collections'],
                                            index,
                                            Posts: jsonEncode(
                                                postToAdd));
                                      } else {
                                        posts.add(imgPath);
                                        List postToAdd = posts;
                                        await collectionDB
                                            .updateCollection(
                                            controller.collectionGroup[index]
                                            ['Collections'],1,
                                            Posts: jsonEncode(
                                                postToAdd));
                                      }
                                    }
                                    else{
                                      posts.add(imgPath);
                                      List postToAdd = posts;
                                      await collectionDB
                                          .insertCollection(controller.collectionGroup[index]['Collections'],
                                          Posts: jsonEncode(postToAdd));
                                    }
                                  }
                                  Get.back();
                                  await completedSavingDialog(context,mediaType: mediaType,collectionName: controller.collectionGroup[index]['Collections'] );
                                  collectionData =await collectionDB.readCollectionData(collectionName: controller.collectionGroup[index]['Collections']);
                                  print('---------------------->>$collectionData');
                                },
                                child: Container(
                                  height: displayHeight(context) * .1083,
                                  margin:  EdgeInsets.only(bottom: displayHeight(context) * .0197),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: displayHeight(context) * .1083,
                                          padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * .064),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: ColorConstants.borderColor),
                                            color: ColorConstants.caption,//.withOpacity(.25),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(controller.collectionGroup[index]['Collections'], style: TextStylePoppinsSemiBold16(color: ColorConstants.white),),

                                              Container(
                                                height: displayHeight(context) * .0394,
                                                width: displayWidth(context) * .0853,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: ColorConstants.linearGradientDeleteButton),
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                child:  Icon(Icons.arrow_forward_ios_sharp,color: ColorConstants.white,size: displayHeight(context) * .0184),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Image.asset(ImageConstants.collectionCardGlassmorphism,fit: BoxFit.fill,),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),

                    ),
                  ),
                ],
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: Image.asset(
                ImageConstants.loaderGlassmorphism,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      );}
    );
  });

}

 completedSavingDialog(context,{String? collectionName,String? mediaType}){
return showDialog(
    context: context!,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      actionsPadding:  EdgeInsets.only(bottom: 28,left: displayWidth(context) * .0426,right: displayWidth(context) * .0426),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        GestureDetector(
          onTap: () =>Get.back(),
          child: Container(
            height: displayHeight(context) * .0467,
            width: displayWidth(context) * .2666,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // color: ColorConstants.transparent,
              gradient: LinearGradient(
                  colors: ColorConstants.linearGradientButton),
            ),
            alignment: Alignment.center,
            child: Text(
              "Okay",
              style: TextStylePoppinsRegular14(
                  color: ColorConstants.textColor),
            ),
          ),
        ),
      ],
      backgroundColor: ColorConstants.cardBackGroundColor,
      shape: RoundedRectangleBorder(side: BorderSide(color: ColorConstants.borderColor), borderRadius: BorderRadius.circular(16)),
      content:SizedBox(
        height: displayHeight(context) * .1884,
        width: displayWidth(context) * .6613,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),),
                padding:  EdgeInsets.all(displayHeight(context) * .0246),
                child: Text(
                  "$mediaType added to\n$collectionName!",
                  textAlign: TextAlign.center,
                  style: TextStylePoppinsBold18(color: ColorConstants.white),
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Image.asset(
                  ImageConstants.loaderGlassmorphism,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
}


