import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/DataBase/collection_data.dart';
import 'package:instasave/Infrastructure/DataBase/recent_data.dart';

class CollectionController extends GetxController {

  RxBool isRecent=false.obs;
  RxBool isCollection=false.obs;

  TextEditingController collectionNameController = TextEditingController();
  CollectionDBNameHelper collectionNameDB = CollectionDBNameHelper();
  RecentDBHelper recentDB = RecentDBHelper();
  CollectionDBHelper collectionDB = CollectionDBHelper();

  RxString collectionName = ''.obs;

  RxInt currentPage = 0.obs;
  final PageController pageController = PageController();
  RxBool deeplinkLoading = false.obs;

   Stream<List<Map<String, dynamic>>>? collectionData;
   RxList recentData=[].obs;
   RxList collectionGroup=[].obs;

  RxString videoUrl = ''.obs;
  RxInt reelsId = 0.obs;

  @override
  onInit()async{
    await getRecentData();
    await getCollectionGroupData();
    super.onInit();
  }
  getCollectionData() {
    collectionData = collectionDB.readCollectionData(collectionName: collectionName.value).asStream();
   }

  getData() async {
              await getRecentData();
              await getCollectionGroupData();
  }
   Future<RxList> getRecentData() async {

      recentData = (await recentDB.readRecentData()).obs;
      if(recentData.isNotEmpty)
        {
          isRecent.value=true;
          //print( isRecent.value);
        }
      //  print( isRecent.value);
     update();
     return recentData;
   }
   getCollectionGroupData() async {
     collectionGroup = (await collectionNameDB.readCollectionData()).obs;
     return collectionGroup;
   }

  animateToPage(int page, {withAnimation = false}) {
    if (page == pageController.page) {
      // scrollPageToTop(page);
    } else {
      pageController.animateToPage(
        page,
        duration: Duration(milliseconds: withAnimation ? 250 : 1),
        curve: Curves.easeIn,
      );
    }
  }

  onCollectionCreate() async {
    await collectionNameDB.insertCollection(collectionNameController.text).then((value) async {
      await collectionDB.initCollectionDB(collectionNameController.text);
    });

  }

}
