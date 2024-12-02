import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:instasave/UI/Screens/CollectionSection/collection_screen.dart';
import 'package:instasave/UI/Screens/HomeSection/home_controller.dart';
import 'package:instasave/UI/Screens/HomeSection/home_screen.dart';
import 'package:instasave/UI/Screens/MainSection/Widgets/BottomBar/bottom_navigation_bar.dart';
import 'package:instasave/UI/Screens/MainSection/main_controller.dart';
import 'package:instasave/UI/Screens/SettingSection/setting_screen.dart';

class MainScreen extends GetView<MainScreenController> {
  @override
  MainScreen({Key? key}) : super(key: key);

  HomeController homeController= Get.put(HomeController());
  getLink(BuildContext context) async {
    ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
    if(cdata!.text!.contains('https://www.instagram.com/')||cdata.text!.contains('https://instagram.com/')){
      homeController.link.value.value = TextEditingValue(text: '${cdata.text}');
      homeController.onFind(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    MainScreenController controller = Get.put(MainScreenController())..checkInternetConnection(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(() =>Stack(
        children: [
          PageView(
            onPageChanged: (value) async {
              if(value==1){
               await controller.collectionController.getRecentData();
               await controller.collectionController.getCollectionGroupData();
              }
              controller.currentPage.value = value;
            },
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children:  const [
              HomePageWrapper(),
              CollectionPageWrapper(),
              SettingPageWrapper(),
            ],
          ),
          SafeArea(
            bottom: false,
            child: BottomNavigationBarWidget(
              active: controller.currentPage.value,
              homeTap: () {
                controller.animateToPage(0);
              },
              collectionTap: () async {
               controller.animateToPage(1);
              },
              settingTap: () {
                controller.animateToPage(2);
              },
            ),
          ),
          Obx(
                () => Visibility(
              visible: controller.deeplinkLoading.value,
              child: Container(
                width: Get.width,
                height: Get.height,
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CupertinoActivityIndicator(radius: 20),
                ),
              ),
            ),
          ),
        ],
      )
      ),
    );
  }
}


class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageWrapper> createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return HomeScreen();
  }
}

class CollectionPageWrapper extends StatefulWidget {
   const CollectionPageWrapper({
    Key? key,
  }) : super(key: key);

  @override
  State<CollectionPageWrapper> createState() => _CollectionPageWrapperState();
}

class _CollectionPageWrapperState extends State<CollectionPageWrapper> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CollectionScreen();
  }
}

class SettingPageWrapper extends StatefulWidget {
  const SettingPageWrapper({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingPageWrapper> createState() => _SettingPageWrapperState();
}

class _SettingPageWrapperState extends State<SettingPageWrapper> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SettingScreen();
  }
}
