
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';

class repostButton extends StatelessWidget {
  const repostButton({
    super.key,
    required this.title,
    required this.iconPath,
  });

  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: ColorConstants.caption,
                    borderRadius: BorderRadius.circular(14.4),
                    border:
                    Border.all(color: ColorConstants.borderColor, width: 1.8)),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  iconPath,
                  width: 20,
                  height: 20,
                ),
              ),
              SizedBox(
                height: 56,
                width: 56,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.4),
                  child: Image.asset(ImageConstants.repostButtonsGlassmorphism,
                    width: 20,
                    height: 20,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

            ],
          ),
          Text(
            title,
            style: TextStylePoppinsMedium12(color: ColorConstants.white),
          ),
        ],
      ),
    );
  }
}