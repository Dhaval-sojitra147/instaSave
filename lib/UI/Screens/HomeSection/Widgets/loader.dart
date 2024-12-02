import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {


  List text = [
    'Finding video.',
    'Finding video. .',
    'Finding video. . .',
    'Finding Caption.',
    'Finding Caption. .',
    'Finding Caption. . .',
    'Finding Hashtag.',
    'Finding Hashtag. .',
    'Finding Hashtag. . .',
  ];
  var timerData;
  RxInt textIndex=0.obs;
  void timer(){
     timerData = Timer.periodic(const Duration(milliseconds: 750), (timer) {
     if(textIndex.value==8){
       textIndex.value=0;
     }
      textIndex.value++;
    });
  }
  @override
  void dispose() {
    //timerData.cancle();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    timer();
    return SizedBox(
      height: displayHeight(context)*.2561,
      width: displayWidth(context)*.5546,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Container(
              height: displayHeight(context)*.2561,
              width: displayWidth(context)*.5546,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: ColorConstants.cardBackGroundColor,
                  border: Border.all(color: ColorConstants.borderColor)),
              padding:  EdgeInsets.symmetric(vertical: displayHeight(context)*.0566),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: ColorConstants.primary,
                  ),
                   SizedBox(
                    height: displayHeight(context)*.0147,
                  ),
                  Obx(
                    ()=> Text(
                        text[textIndex.value],
                      //"Finding video.",
                      style:
                          TextStylePoppinsMedium16(color: ColorConstants.white),
                    ),
                  ),
                   SizedBox(
                    height: displayHeight(context)*.0073,
                  ),
               //   const threeAnimatedDots(
               //       color: ColorConstants.white, size: 15),
                ],
              ),
            ),
            Image.asset(
              ImageConstants.loaderGlassmorphism,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}