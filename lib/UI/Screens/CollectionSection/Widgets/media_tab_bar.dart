import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';

class MediaTabBar extends StatefulWidget {
  const MediaTabBar({Key? key,required this.selectedTab, this.reelTap, this.storyTap, this.postTap}) : super(key: key);
  final int selectedTab;
  final GestureTapCallback? reelTap;
  final GestureTapCallback? storyTap;
  final GestureTapCallback? postTap;
  @override
  State<MediaTabBar> createState() => _MediaTabBarState();
}

class _MediaTabBarState extends State<MediaTabBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * .0591,
      margin:  EdgeInsets.only(top: displayHeight(context) * .0123,bottom: displayHeight(context) * .0197,left: displayWidth(context) * .0533,right: displayWidth(context) * .0533),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorConstants.cardBackGroundColor,
            borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorConstants.borderColor),
      ),
      child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: widget.reelTap,
              child:  Container(
                  height: displayHeight(context) * .0394,
                  width: displayWidth(context) * .264,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: widget.selectedTab==0
                        ?
                    ColorConstants.linearGradientButton
                        :
                    [ColorConstants.transparent,ColorConstants.transparent],),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child:  Text(AppConstants.reels.tr,style: TextStylePoppinsMedium14(
                      color: widget.selectedTab==0
                          ?
                      ColorConstants.textColor
                          :
                      ColorConstants.white),),
                ),

            ),
            GestureDetector(
              onTap: widget.storyTap,
              child: Container(
                  height: displayHeight(context) * .0394,
                  width: displayWidth(context) * .264,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: widget.selectedTab==1
                        ?
                    ColorConstants.linearGradientButton
                        :
                    [ColorConstants.transparent,ColorConstants.transparent],),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child:  Text(AppConstants.story.tr,style: TextStylePoppinsMedium14(
                      color: widget.selectedTab==1
                          ?
                      ColorConstants.textColor
                          :
                      ColorConstants.white),),
                ),
            ),
            GestureDetector(
              onTap: widget.postTap,
              child: Container(
                  height: displayHeight(context) * .0394,
                  width: displayWidth(context) * .264,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: widget.selectedTab==2
                        ?
                    ColorConstants.linearGradientButton
                        :
                    [ColorConstants.transparent,ColorConstants.transparent],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child:  Text(AppConstants.post.tr,style: TextStylePoppinsMedium14(
                      color: widget.selectedTab==2
                          ?
                      ColorConstants.textColor
                          :
                      ColorConstants.white),),
                ),

            ),

          ],
        ),

    );
  }
}
