
import 'package:flutter/material.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';

class collectionCard extends StatelessWidget {
  const collectionCard({
    super.key, required this.collectionName, required this.onDeleteTap,
  });

  final String collectionName;
  final GestureTapCallback onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * .1083,
      margin:  EdgeInsets.only(bottom: displayHeight(context) * .0197,),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Container(
              height: displayHeight(context) * .1083,
              padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * .064,),
              decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.borderColor),
                color: ColorConstants.caption,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(collectionName,
                  style: TextStylePoppinsSemiBold16(
                      color: ColorConstants.white),
                  overflow: TextOverflow.ellipsis,
                ),
                  GestureDetector(
                    onTap: onDeleteTap,
                    child: Container(
                      height: displayHeight(context) * .0394,
                      width: displayWidth(context) * .0853,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: ColorConstants.linearGradientDeleteButton),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:  Icon(Icons.delete,color: ColorConstants.white,size: displayWidth(context) * .04,),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(ImageConstants.collectionCardGlassmorphism,fit: BoxFit.fill,),
          ],
        ),
      ),
    );
  }
}