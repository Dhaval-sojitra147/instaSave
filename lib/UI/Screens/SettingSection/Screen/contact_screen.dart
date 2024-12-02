import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/SettingSection/setting_controller.dart';
import 'package:instasave/Widgets/app_bar.dart';

class ContactScreen extends GetView<SettingController> {
  @override
  SettingController controller = Get.put(SettingController());

  ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: instasaveAppBar(
          title: AppConstants.contactUS.tr,
          getBack: true,
          onBackTap: controller.clear()),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: displayHeight(context) * 0.172,
                width: displayWidth(context) * 0.373,
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.007,
                    left: displayWidth(context) * 0.314,
                    right: displayWidth(context) * 0.312),
                child: Image.asset(ImageConstants.contactUs),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.019,
                    left: displayWidth(context) * 0.05),
                child: Text(
                  AppConstants.questions.tr,
                  style:
                      TextStylePoppinsSemiBold16(color: ColorConstants.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayWidth(context) * 0.009,
                    left: displayWidth(context) * 0.05),
                child: Text(
                  AppConstants.detail.tr,
                  textAlign: TextAlign.start,
                  style: TextStylePoppinsRegular14(
                    color: ColorConstants.grey400,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.029,
                    left: displayWidth(context) * 0.07,
                    right: displayWidth(context) * 0.07,
                    bottom: displayHeight(context) * 0.009),
                child: Text(
                  AppConstants.name.tr,
                  textAlign: TextAlign.start,
                  style: TextStylePoppinsMedium16(
                    color: ColorConstants.white,
                  ),
                ),
              ),
              buildContactDataField(
                  context: context,
                  hintText: AppConstants.mail.tr,
                  textEditingController: controller.nameController),
              Container(
                margin: EdgeInsets.only(
                    left: displayWidth(context) * 0.07,
                    right: displayWidth(context) * 0.07,
                    bottom: displayHeight(context) * 0.009),
                child: Text(
                  AppConstants.subject.tr,
                  textAlign: TextAlign.start,
                  style: TextStylePoppinsMedium16(
                    color: ColorConstants.white,
                  ),
                ),
              ),
              buildContactDataField(
                  context: context,
                  hintText: AppConstants.enterSubject.tr,
                  textEditingController: controller.subjectsController),
              buildContactDataField(
                  context: context,
                  hintText: AppConstants.writeMessage.tr,
                  textEditingController: controller.messageController,
                  textInputAction: TextInputAction.next,
                  onSaved: () => controller.sendEmail(),
                  maxLine: 4),
              GestureDetector(
                onTap: () async {
                  /** Message Send code **/
                  controller.sendEmail();
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.02,
                    left: displayWidth(context) * 0.05,
                    right: displayWidth(context) * 0.05,
                  ),
                  height: displayHeight(context) * 0.059,
                  width: displayWidth(context) * .893,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: ColorConstants.linearGradientButton),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: ColorConstants.borderColor),
                  ),
                  child: Center(
                    child: Text(
                      AppConstants.send.tr,
                      textAlign: TextAlign.center,
                      style: TextStylePoppinsMedium16(
                          color: ColorConstants.grey900),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContactDataField(
      {required String hintText,
      required context,
      required TextEditingController textEditingController,
        int? maxLine,
        TextInputAction? textInputAction,
        void Function()? onSaved}) {
    return Container(
      margin: EdgeInsets.only(
          bottom: displayHeight(context) * 0.009,
          left: displayWidth(context) * 0.05,
          right: displayWidth(context) * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.1),
        border: Border.all(color: ColorConstants.borderColor),
      ),
      child: TextFormField(
        cursorColor: ColorConstants.white,
        style: TextStylePoppinsMedium14(
          color: ColorConstants.white,
        ),
        controller: textEditingController,
        maxLines: maxLine ?? 1,
        onEditingComplete: onSaved,
        //validator: (value) => ,
        textInputAction: textInputAction ?? TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 19, 22, 32),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hintText,
          hintStyle: TextStylePoppinsMedium14(
            color: ColorConstants.grey400,
          ),
        ),
      ),
    );
  }
}
