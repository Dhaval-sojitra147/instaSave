import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/Infrastructure/DataBase/collection_data.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/CollectionSection/collection_controller.dart';

Future createCollectionPopUp(
    {BuildContext? context,
    TextEditingController? textController,
    GestureTapCallback? onCreateTap}) {
  CollectionController controller = Get.put(CollectionController());
  return showDialog(
      context: context!,
      barrierDismissible: true,
      barrierColor: ColorConstants.black.withOpacity(.7),
      builder: (BuildContext context) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.only(
                bottom: displayHeight(context) * .0344,
                left: displayWidth(context) * .0426,
                right: displayWidth(context) * .0426),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: [
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Get.back();
                  textController?.clear();
                },
                child: Container(
                  height: displayHeight(context) * .0467,
                  width: displayWidth(context) * .3066,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorConstants.orange,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: ColorConstants.transparent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    AppConstants.cancel.tr,
                    style:
                        TextStylePoppinsMedium14(color: ColorConstants.orange),
                  ),
                ),
              ),
              GestureDetector(
                onTap: onCreateTap ??
                    () async {
                  if(textController!.text.isNotEmpty){
                    FocusScope.of(context).unfocus();
                    Get.back();
                    CollectionDBNameHelper collectionNameDB =
                    CollectionDBNameHelper();
                    CollectionDBHelper collectionDB = CollectionDBHelper();
                    await collectionNameDB
                        .insertCollection(textController.text)
                        .then((value) async {
                      await collectionDB
                          .initCollectionDB(textController.text);
                    });
                    controller.isCollection.value = true;
                    textController.text = '';
                    print('isCollection.value>${controller.isCollection.value}');
                  }else
                  {
                    Fluttertoast.showToast(
                        msg: AppConstants.collectionToast.tr,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 2,
                        backgroundColor: ColorConstants.primary,
                        textColor: Colors.black,
                        fontSize: 16.0
                    );
                    }},
                child: Container(
                  height: displayHeight(context) * .0467,
                  width: displayWidth(context) * .3066,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // color: ColorConstants.transparent,
                    gradient: LinearGradient(
                        colors: ColorConstants.linearGradientButton),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    AppConstants.create.tr,
                    style: TextStylePoppinsMedium14(
                        color: ColorConstants.textColor),
                  ),
                ),
              ),
            ],
            backgroundColor: ColorConstants.cardBackGroundColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: ColorConstants.borderColor),
                borderRadius: BorderRadius.circular(16)),
            content: SizedBox(
              height: displayHeight(context) * .2463,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding:  EdgeInsets.all(displayWidth(context) * .04),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppConstants.createCollection.tr,
                            textAlign: TextAlign.center,
                            style: TextStylePoppinsBold18(
                                color: ColorConstants.white),
                          ),
                          SizedBox(
                            height: displayHeight(context) * .0295,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AppConstants.name.tr,
                              style: TextStylePoppinsMedium16(
                                  color: ColorConstants.white),
                            ),
                          ),
                          SizedBox(
                            height: displayHeight(context) * .0098,
                          ),
                          TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.name,
                            cursorColor: ColorConstants.primary,
                            style: TextStylePoppinsMedium14(
                                color: ColorConstants.white),
                            controller: textController,
                            maxLength: 20,
                            decoration: InputDecoration(
                              hintText: AppConstants.collectionHintText.tr,
                              counterText: '',
                              hintStyle: TextStylePoppinsMedium14(
                                  color: ColorConstants.white.withOpacity(.4)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: ColorConstants.bottomBarBorder,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: ColorConstants.bottomBarBorder,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: ColorConstants.bottomBarBorder,
                                  )),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: ColorConstants.bottomBarBorder,
                                  )),
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
              ),
            ),
          ));
}
