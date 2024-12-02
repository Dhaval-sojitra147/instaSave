// ignore_for_file: use_full_hex_values_for_flutter_colors, sized_box_for_whitespace, must_be_immutable, empty_statements, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/Infrastructure/Models/HashtagModel.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/EditHashtagScreen/edit_hashtag_screen.dart';
import 'package:instasave/UI/Screens/HomeSection/Widgets/paint_class.dart';

class HashtagCard extends StatelessWidget {
  HashtagCard({Key? key, this.title = "", this.list = const [],})
      : super(key: key);
  final String title;
  List<HashTagList> list = [];

  @override
  Widget build(BuildContext context) {
    return title.isNotEmpty
        ? Container(
            height: displayHeight(context) * 0.25,
            width: displayWidth(context) * 0.893,
            margin: EdgeInsets.only(top: displayHeight(context) * 0.029),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: 21,
                  top: 0,
                  bottom: 0.58,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.textColor),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                     //color:  ColorConstants.caption,
                     image: const DecorationImage(image: AssetImage(ImageConstants.hashtagCardGlassMorphism),fit: BoxFit.fill),
                    ),
                    /** Hashtag Text **/
                    child: Center(
                      child: Container(
                        //color: Colors.orange,
                        margin: EdgeInsets.only(left: displayWidth(context) * 0.042, right: displayWidth(context) * 0.127,),
                        alignment: Alignment.centerLeft,
                        width: displayWidth(context) * 0.722,
                        //height: displayHeight(context) * 0.177,
                        child: title == ""
                            ? Container()
                            : Text(
                                title,
                                overflow: TextOverflow.fade,
                                style: TextStylePoppinsRegular12(
                                    color: ColorConstants.white),
                              ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPaint(
                        painter: HomePainter(),
                        child: Container(
                          height: displayHeight(context) * 0.049,
                          width: displayWidth(context) * 0.103,
                          margin: const EdgeInsets.only(),
                          child: Center(
                            child: Container(
                              height: displayHeight(context) * 0.0394,
                              width: displayWidth(context) * 0.0853,
                              margin: EdgeInsets.only(
                                  top: displayHeight(context) * 0.004, left: displayWidth(context) * 0.009, right: displayWidth(context) * 0.009, bottom: displayHeight(context) * 0.004),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: const LinearGradient(colors: [
                                  Color.fromARGB(255, 245, 109, 255),
                                  Color.fromARGB(255, 158, 36, 255)
                                ]),
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Image.asset(
                                    ImageConstants.copyCaption,
                                    height:displayHeight(context) *  0.019,
                                    width: displayWidth(context) * 0.042,
                                  ),
                                  onPressed: () {
                                    /** copy hashtags code **/
                                    Clipboard.setData(
                                      ClipboardData(
                                          text: (title),
                                      ),
                                    );
                                    Fluttertoast.showToast(
                                        msg: AppConstants.copied.tr,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER_RIGHT,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: ColorConstants.primary,
                                        textColor: Colors.black,
                                        fontSize: 16.0
                                    );
                                  },
                                  splashColor: ColorConstants.appBar,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: displayHeight(context) * 0.012),
                        child: CustomPaint(
                          painter: HomePainter(),
                          child: Container(
                            height: displayHeight(context) * 0.049,
                            width: displayWidth(context) * 0.103,
                            //margin: EdgeInsets.only(bottom: 20),
                            child: Center(
                              child: Container(
                                height: displayHeight(context) * 0.0394,
                                width: displayWidth(context) * 0.0853,
                                margin: EdgeInsets.only(
                                    top: displayHeight(context) * 0.004, left: displayWidth(context) * 0.009, right: displayWidth(context) * 0.009, bottom: displayHeight(context) * 0.004),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(255, 245, 109, 255),
                                    Color.fromARGB(255, 158, 36, 255)
                                  ]),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    child: Image.asset(
                                      ImageConstants.editCaption,
                                      height:displayHeight(context) *  0.019,
                                      width: displayWidth(context) * 0.042,
                                    ),
                                    onTap: () {
                                      /** edit caption code **/
                                      Get.to(EditHashTagScreen(),
                                          arguments: list);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
