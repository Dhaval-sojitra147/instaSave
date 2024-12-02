import 'package:flutter/material.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/VideoPlayer/VideoPlayerSrc/Helpers/adaptive_controls.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/VideoPlayer/VideoPlayerSrc/Notifiers/player_notifier.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/VideoPlayer/VideoPlayerSrc/video_player.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class PlayerWithControls extends StatelessWidget {
  const PlayerWithControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChewieController chewieController = ChewieController.of(context);

    double calculateAspectRatio(BuildContext context) {
      final size = MediaQuery.of(context).size;
      final width = size.width;
      final height = size.height;

      return width > height ? width / height : height / width;
    }

    Widget buildControls(
        BuildContext context,
        ChewieController chewieController,
        ) {
      return chewieController.showControls
          ? chewieController.customControls ?? const AdaptiveControls()
          : const SizedBox();
    }

    Widget buildPlayerWithControls(
        ChewieController chewieController,
        BuildContext context,
        ) {
      return Stack(
        children: <Widget>[
          if (chewieController.placeholder != null)
            chewieController.placeholder!,
          InteractiveViewer(
            transformationController: chewieController.transformationController,
            maxScale: chewieController.maxScale,
            panEnabled: chewieController.zoomAndPan,
            scaleEnabled: chewieController.zoomAndPan,
            child: Center(
              child: VideoPlayer(chewieController.videoPlayerController),
            ),
          ),
          if (chewieController.overlay != null) chewieController.overlay!,
          if (Theme.of(context).platform != TargetPlatform.iOS)
            Consumer<PlayerNotifier>(
              builder: (
                  BuildContext context,
                  PlayerNotifier notifier,
                  Widget? widget,
                  ) =>
                  Visibility(
                    visible: !notifier.hideStuff,
                    child: AnimatedOpacity(
                      opacity: notifier.hideStuff ? 0.0 : 0.8,
                      duration: const Duration(
                        milliseconds: 250,
                      ),
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black54),
                        child: SizedBox(),
                      ),
                    ),
                  ),
            ),
          if (!chewieController.isFullScreen)
            buildControls(context, chewieController)
          else
            SafeArea(
              bottom: false,
              child: buildControls(context, chewieController),
            ),
        ],
      );
    }

    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: AspectRatio(
          aspectRatio: calculateAspectRatio(context),
          child: buildPlayerWithControls(chewieController, context),
        ),
      ),
    );
  }
}
