// ignore_for_file: unused_element

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/VideoPlayer/VideoPlayerSrc/Notifiers/player_notifier.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/VideoPlayer/VideoPlayerSrc/animated_play_pause.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/VideoPlayer/VideoPlayerSrc/center_play_button.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/VideoPlayer/VideoPlayerSrc/video_player.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class CupertinoControls extends StatefulWidget {
  const CupertinoControls({
    required this.backgroundColor,
    required this.iconColor,
    this.showPlayButton = true,
    Key? key,
  }) : super(key: key);

  final Color backgroundColor;
  final Color iconColor;
  final bool showPlayButton;

  @override
  State<StatefulWidget> createState() {
    return _CupertinoControlsState();
  }
}

class _CupertinoControlsState extends State<CupertinoControls>
    with SingleTickerProviderStateMixin {
  late PlayerNotifier notifier;
  late VideoPlayerValue _latestValue;
  Timer? _hideTimer;
  final marginSize = 5.0;
  Timer? _expandCollapseTimer;
  Timer? _initTimer;
  bool _dragging = false;
  Timer? _bufferingDisplayTimer;
  bool _displayBufferingIndicator = false;

  late VideoPlayerController videoPlayerController;

  // We know that _chewieController is set in didChangeDependencies
  ChewieController get chewieController => _chewieController!;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    notifier = Provider.of<PlayerNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    if (_latestValue.hasError) {
      return chewieController.errorBuilder != null
          ? chewieController.errorBuilder!(
              context,
              chewieController.videoPlayerController.value.errorDescription!,
            )
          : const Center(
              child: Icon(
                CupertinoIcons.exclamationmark_circle,
                color: Colors.white,
                size: 42,
              ),
            );
    }

    return MouseRegion(
      onHover: (_) => _cancelAndRestartTimer(),
      child: GestureDetector(
        onTap: () => _cancelAndRestartTimer(),
        child: AbsorbPointer(
          absorbing: notifier.hideStuff,
          child: Stack(
            children: [
              if (_displayBufferingIndicator)
                const Center(
                  child: CircularProgressIndicator(
                    color: ColorConstants.primary,
                  ),
                )
              else
                _buildHitArea(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _dispose() {
    videoPlayerController.removeListener(_updateState);
    _hideTimer?.cancel();
    _expandCollapseTimer?.cancel();
    _initTimer?.cancel();
  }

  @override
  void didChangeDependencies() {
    final oldController = _chewieController;
    _chewieController = ChewieController.of(context);
    videoPlayerController = chewieController.videoPlayerController;

    if (oldController != chewieController) {
    //  _dispose();
      _initialize();
    }

    super.didChangeDependencies();
  }

  Widget _buildHitArea() {
    final bool isFinished = _latestValue.position >= _latestValue.duration;
    final bool isBuffer=_latestValue.position==Duration.zero?true:false;

    final bool showPlayButton =
        widget.showPlayButton && !_latestValue.isPlaying && !_dragging;

    return GestureDetector(
      onTap: _latestValue.isPlaying
          ? _cancelAndRestartTimer
          : () {
              _hideTimer?.cancel();

              setState(() {
                notifier.hideStuff = false;
              });
            },
      child: CenterPlayButton(
        backgroundColor: widget.backgroundColor,
        iconColor: widget.iconColor,
        isFinished: isFinished,
        isPlaying: videoPlayerController.value.isPlaying,
        show: showPlayButton,
        onPressed: _playPause,
        isBuffer: isBuffer,
      ),
    );
  }

  Widget _buildPlayPause(
    VideoPlayerController controller,
    Color iconColor,
    double barHeight,
  ) {
    if(!chewieController.allowPlay) {
      controller.pause();
    }
    return chewieController.allowPlay?GestureDetector(
      onTap: _playPause,
      child: Container(
        //height: barHeight,
        height: 32,
        width: 32,
        //color: Colors.transparent,
        decoration: BoxDecoration(
          color: ColorConstants.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          left: 0.0,
          right: 0.0,
        ),
        child: AnimatedPlayPause(
          color: widget.iconColor,
          playing: controller.value.isPlaying,
        ),
      ),
    ):Container();
  }

  void _cancelAndRestartTimer() {
    _hideTimer?.cancel();

    setState(() {
      notifier.hideStuff = false;

      _startHideTimer();
    });
  }
  Future<void> _initialize() async {
    videoPlayerController.addListener(_updateState);

    _updateState();

    if (videoPlayerController.value.isPlaying || chewieController.autoPlay) {
      _startHideTimer();
    }

    if (chewieController.showControlsOnInitialize) {
      _initTimer = Timer(const Duration(milliseconds: 200), () {
        setState(() {
          notifier.hideStuff = false;
        });
      });
    }
  }

  void _playPause() {
    final isFinished = _latestValue.position >= _latestValue.duration;

    setState(() {
      if (videoPlayerController.value.isPlaying) {
        notifier.hideStuff = false;
        _hideTimer?.cancel();
        videoPlayerController.pause();
      } else {
        _cancelAndRestartTimer();

        if (!videoPlayerController.value.isInitialized) {
          videoPlayerController.initialize().then((_) {
            videoPlayerController.play();
          });
        } else {
          if (isFinished) {
            videoPlayerController.seekTo(Duration.zero);
          }
          videoPlayerController.play();
        }
      }
    });
  }

  void _startHideTimer() {
    final hideControlsTimer = chewieController.hideControlsTimer.isNegative
        ? ChewieController.defaultHideControlsTimer
        : chewieController.hideControlsTimer;
    _hideTimer = Timer(hideControlsTimer, () {
      setState(() {
        notifier.hideStuff = true;
      });
    });
  }

  void _bufferingTimerTimeout() {
    _displayBufferingIndicator = true;
    if (mounted) {
      setState(() {});
    }
  }

  void _updateState() {
    if (!mounted) return;

    // display the progress bar indicator only after the buffering delay if it has been set
    if (chewieController.progressIndicatorDelay != null) {
      if (videoPlayerController.value.isBuffering) {
        _bufferingDisplayTimer ??= Timer(
          chewieController.progressIndicatorDelay!,
          _bufferingTimerTimeout,
        );
      } else {
        _bufferingDisplayTimer?.cancel();
        _bufferingDisplayTimer = null;
        _displayBufferingIndicator = false;
      }
    } else {
      _displayBufferingIndicator = videoPlayerController.value.isBuffering;
    }

    setState(() {
      _latestValue = videoPlayerController.value;
    });
  }
}