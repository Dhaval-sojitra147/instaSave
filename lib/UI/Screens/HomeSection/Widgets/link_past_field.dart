
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/HomeSection/home_controller.dart';

class LinkPastField extends StatefulWidget {
  const LinkPastField({Key? key, required this.controller, required this.context,
  }) : super(key: key);

  final HomeController controller;
  final BuildContext context;
  @override
  State<LinkPastField> createState() => _LinkPastFieldState();
}

class _LinkPastFieldState extends State<LinkPastField> {

  HomeController controller= Get.put(HomeController());
  @override
  void initState() {
     controller=widget.controller;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(top: displayHeight(context)*.0295),
      padding:
       EdgeInsets.only(
          left: displayWidth(context)*.043,
          top: displayHeight(context)*.0147,
          right: displayWidth(context)*.043,
          bottom: displayHeight(context)*.0147,),
      height: displayHeight(context)*.0665,
      width: displayWidth(context)*.8933,
      decoration: BoxDecoration(
        color: ColorConstants.cardBackGroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorConstants.borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: displayWidth(context)*.596,
            child: Obx(
                  ()=>TextFormField(
                enabled: false,
                controller: controller.link.value,
                showCursor: false,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                style: TextStylePoppinsMedium14(color: ColorConstants.white),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  icon: Transform.rotate(
                      angle: pi / -4,
                      child: Icon(
                        Icons.insert_link,
                        color: Colors.white,
                        size: displayWidth(context) * .053,
                      )),
                ),
              ),
            ),
          ),
          Container(
            height: displayHeight(context)*.037,
            width: displayWidth(context)*.181,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(colors: ColorConstants.linearGradientButton),
            ),
            alignment: Alignment.center,
            child: GestureDetector(
                onTap: () async {
                  controller.link.value.value = const TextEditingValue(text: '');
                    ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);

                  if(cdata!.text!.contains('https://www.instagram.com/')||cdata.text!.contains('https://instagram.com/')){
                    Fluttertoast.showToast(
                        msg: AppConstants.pasteToast.tr,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: ColorConstants.primary,
                        textColor: Colors.black,
                        fontSize: 16.0
                    );
                    controller.link.value.value = TextEditingValue(text: '${cdata.text}');
                  }else{
                    if(Get.isSnackbarOpen)
                    {
                      Get.closeCurrentSnackbar;
                      print(Get.closeCurrentSnackbar);
                    }
                   // print(Get.closeCurrentSnackbar);
                  Get.snackbar('Warning', 'Link Is Invalid',
                    snackStyle: SnackStyle.FLOATING,
                    backgroundGradient:
                    LinearGradient(colors: ColorConstants.linearGradientButton),
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(seconds: 1),
                    colorText: ColorConstants.white,
                  );
                  }
                    //controller.link.value.value = TextEditingValue(text: '${cdata!.text}');
                },
                child: Text
                  (AppConstants.paste.tr,style: TextStylePoppinsMedium14(),),
            ),
          ),
        ],
      ),
    );
  }
}

