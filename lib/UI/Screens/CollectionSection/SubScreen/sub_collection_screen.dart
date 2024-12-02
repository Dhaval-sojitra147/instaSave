import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/UI/Screens/CollectionSection/SubScreen/post_screen.dart';
import 'package:instasave/UI/Screens/CollectionSection/SubScreen/reels_screen.dart';
import 'package:instasave/UI/Screens/CollectionSection/SubScreen/stories_screen.dart';
import 'package:instasave/UI/Screens/CollectionSection/Widgets/media_tab_bar.dart';
import 'package:instasave/UI/Screens/CollectionSection/collection_controller.dart';
import 'package:instasave/Widgets/app_bar.dart';

class SubCollectionScreen extends GetView<CollectionController> {
  CollectionController controller = Get.put(CollectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: instasaveAppBar(
          title: controller.collectionName.value,
          onBackTap: () {
            Get.back();
            controller.currentPage.value = 0;
          }),
      body: SizedBox(
        height: displayHeight(context),
        width: displayWidth(context),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: displayHeight(context) * .098522),
              child: PageView(
                onPageChanged: (value) => controller.currentPage.value = value,
                controller: controller.pageController,
                physics: BouncingScrollPhysics(),
                children: [
                  ReelPageWrapper(name: controller.collectionName.value),
                  StroiesPageWrapper(name: controller.collectionName.value),
                  PostPageWrapper(name: controller.collectionName.value),
                ],
              ),
            ),
            Obx(
              () => MediaTabBar(
                selectedTab: controller.currentPage.value,
                reelTap: () {
                  controller.animateToPage(0);
                },
                storyTap: () {
                  controller.animateToPage(1);
                },
                postTap: () {
                  controller.animateToPage(2);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReelPageWrapper extends StatefulWidget {
  const ReelPageWrapper({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  State<ReelPageWrapper> createState() => _ReelPageWrapperState();
}

class _ReelPageWrapperState extends State<ReelPageWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ReelsScreen(collectionName: widget.name);
  }
}

class StroiesPageWrapper extends StatefulWidget {
  const StroiesPageWrapper({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  State<StroiesPageWrapper> createState() => _StroiesPageWrapperState();
}

class _StroiesPageWrapperState extends State<StroiesPageWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StoriesScreen(collectionName: widget.name);
  }
}

class PostPageWrapper extends StatefulWidget {
  const PostPageWrapper({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  State<PostPageWrapper> createState() => _PostPageWrapperState();
}

class _PostPageWrapperState extends State<PostPageWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PostScreen(collectionName: widget.name);
  }
}
