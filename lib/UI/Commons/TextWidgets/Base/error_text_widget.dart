import 'package:flutter/material.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/font_constants.dart';


class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    Key? key,
    this.title,
    this.titleColor,
    this.titleTextAlign = TextAlign.start,
    this.maxLine,
    this.fontWeight,
    this.textOverflow,
    this.fontSize,
    this.height,
    this.foreground,
    this.fontFamily,
    this.underline = false,
    this.letterSpacing,
  }) : super(key: key);

  final String? title;
  final Color? titleColor;
  final TextAlign? titleTextAlign;
  final int? maxLine;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final double? fontSize;
  final double? height;
  final Paint? foreground;
  final String? fontFamily;
  final bool underline;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: Theme
          .of(context)
          .textTheme
          .bodyLarge!
          .copyWith(
        color: ColorConstants.black,
        fontSize: fontSize,
        height: height,
        fontFamily: fontFamily ?? FontConstant.poppinsMedium,
        foreground: titleColor == null ? foreground : null,
        fontWeight: fontWeight ?? FontWeight.normal,
        decoration: underline ? TextDecoration.underline : null,
        letterSpacing: letterSpacing,
      ),
      textAlign: titleTextAlign,
      maxLines: maxLine,
      overflow: textOverflow,
      softWrap: true,
    );
  }
}
