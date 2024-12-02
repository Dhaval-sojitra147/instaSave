// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps, avoid_function_literals_in_foreach_calls, prefer_const_constructors, list_remove_unrelated_type, unrelated_type_equality_checks, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Models/HashtagModel.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/EditHashtagScreen/edit_controller.dart';
import 'package:instasave/Widgets/app_bar.dart';

class EditHashTagScreen extends GetView {
  EditHashTagScreen({super.key});

  List<HashTagList> hash = [
    HashTagList(hashTagsData: 'Goodtimes'),
    HashTagList(hashTagsData: 'lifeforlikes'),
    HashTagList(hashTagsData: 'loveislove'),
    HashTagList(hashTagsData: 'pet'),
    HashTagList(hashTagsData: 'petlovers'),
    HashTagList(hashTagsData: 'please'),
    HashTagList(hashTagsData: 'poodle'),
    HashTagList(hashTagsData: 'share'),
    HashTagList(hashTagsData: 'tinypoodle'),
    HashTagList(hashTagsData: 'advanture'),
    HashTagList(hashTagsData: 'afterseries'),
    HashTagList(hashTagsData: 'baby'),
    HashTagList(hashTagsData: 'bessa'),
    HashTagList(hashTagsData: 'childhood'),
    HashTagList(hashTagsData: 'childrenmemories'),
    HashTagList(hashTagsData: 'daily'),
    HashTagList(hashTagsData: 'explorepage'),
    HashTagList(hashTagsData: 'fifaworlcup'),
    HashTagList(hashTagsData: 'falshback'),
    HashTagList(hashTagsData: 'funtimes'),
    HashTagList(hashTagsData: 'greate'),
    HashTagList(hashTagsData: 'hollywood'),
    HashTagList(hashTagsData: 'jan'),
    HashTagList(hashTagsData: 'kids'),
    HashTagList(hashTagsData: 'landscope'),
    HashTagList(hashTagsData: 'latepost'),
    HashTagList(hashTagsData: 'lovelife'),
    HashTagList(hashTagsData: 'loveyourself'),
    HashTagList(hashTagsData: 'mauratius'),
    HashTagList(hashTagsData: 'mom'),
  ];
  RxList<HashTagList> arg = RxList([]);

  //RxList<HashTagList> selectedHash = RxList([]);

  void getHashdata() {
    arg.value = Get.arguments;
    hash.forEach((element) {
      element.selected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    getHashdata();
    return GetBuilder<EditController>(
      init: EditController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorConstants.appBar,
          appBar: instasaveAppBar(
            title: AppConstants.editHashtag.tr,
            getBack: true,
          ),
          body: Container(
            height: displayHeight(context),
            width: displayWidth(context),
            padding:
                EdgeInsets.symmetric(horizontal: displayWidth(context) * .053),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.029,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                text: (arg.where((p0) => p0.selected).toList() +
                                        hash
                                            .where(
                                                (element) => element.selected)
                                            .toList())
                                    .map((e) => e.hashTagsData)
                                    .toList()
                                    .toString()
                                    .replaceAll(' ', ' #')
                                    .replaceFirst("[", "#")
                                    .split(']')
                                    .first));
                            Fluttertoast.showToast(
                                msg: AppConstants.copied.tr,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP_LEFT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: ColorConstants.primary,
                                textColor: Colors.black,
                                fontSize: 16.0);
                          },
                          child: Container(
                            height: displayHeight(context) * 0.032,
                            width: displayWidth(context) * 0.4,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 248, 167, 254),
                                  Color.fromARGB(255, 193, 122, 251)
                                ])),
                            child: Center(
                                child: Text(
                              AppConstants.copyClipboard.tr,
                              //textAlign: TextAlign.center,
                              style: TextStylePoppinsMedium12(
                                  color: ColorConstants.grey900),
                            )),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Obx(
                            () => Text(
                              "${arg.where((p0) => p0.selected == true).length + hash.where((element) => element.selected == true).length}/30 selected",
                              style: TextStylePoppinsRegular12(
                                  color: ColorConstants.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    top: 28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Center(
                              child: Text(
                            AppConstants.suggestedTags.tr,
                            textAlign: TextAlign.center,
                            style: TextStylePoppinsRegular10(
                                color: ColorConstants.grey500),
                          )),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              arg.forEach((element) {
                                element.selected = true;
                              });
                              getHashdata();
                              controller.update();
                            },
                            child: Text(
                              AppConstants.reset.tr,
                              textAlign: TextAlign.end,
                              style: TextStylePoppinsRegular12(
                                  color: ColorConstants.primary),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowIndicator();
                      return true;
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Obx(
                            () => ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: arg.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Container(
                                        child: StatefulBuilder(
                                          builder: (context, setState) {
                                            return Checkbox(
                                              checkColor: Colors.white,
                                              activeColor:
                                                  ColorConstants.checkBox,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6)),
                                              ),
                                              side: MaterialStateBorderSide
                                                  .resolveWith((states) =>
                                                      arg[index].selected
                                                          ? BorderSide(
                                                              width: 1.0,
                                                              color:
                                                                  ColorConstants
                                                                      .checkBox)
                                                          : BorderSide(
                                                              color:
                                                                  ColorConstants
                                                                      .white)),
                                              value: arg[index].selected,
                                              onChanged: (bool? value) {
                                                if ((arg
                                                                .where((p0) =>
                                                                    p0.selected ==
                                                                    true)
                                                                .length +
                                                            hash
                                                                .where((element) =>
                                                                    element
                                                                        .selected ==
                                                                    true)
                                                                .length) <
                                                        30 &&
                                                    value == true) {
                                                  arg[index].selected = value!;
                                                  controller.update();
                                                  setState(() {});
                                                } else {
                                                  arg[index].selected = false;
                                                  controller.update();
                                                  setState(() {});
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          arg[index].hashTagsData!,
                                          style: TextStylePoppinsRegular14(
                                              color: ColorConstants.white),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                              top: 36,
                            ),
                            child: Text(AppConstants.other.tr,
                                textAlign: TextAlign.start,
                                style: TextStylePoppinsRegular10(
                                    color: ColorConstants.grey500)),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: hash.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Container(
                                      child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return Checkbox(
                                            checkColor: Colors.white,
                                            activeColor:
                                                ColorConstants.checkBox,
                                            side: MaterialStateBorderSide
                                                .resolveWith((states) =>
                                                    hash[index]
                                                            .selected
                                                        ? BorderSide(
                                                            width: 1.0,
                                                            color:
                                                                ColorConstants
                                                                    .checkBox)
                                                        : BorderSide(
                                                            color:
                                                                ColorConstants
                                                                    .white)),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6)),
                                            ),
                                            value: hash[index].selected,
                                            onChanged: (bool? value) {
                                              if ((arg
                                                              .where((p0) =>
                                                                  p0.selected ==
                                                                  true)
                                                              .length +
                                                          hash
                                                              .where((element) =>
                                                                  element
                                                                      .selected ==
                                                                  true)
                                                              .length) <
                                                      30 &&
                                                  value == true) {
                                                hash[index].selected = value!;
                                                controller.update();
                                                setState(() {});
                                              } else {
                                                hash[index].selected = false;
                                                controller.update();
                                                setState(() {});
                                              }
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        hash[index].hashTagsData!,
                                        style: TextStylePoppinsRegular14(
                                            color: ColorConstants.white),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
