// ignore_for_file: library_private_types_in_public_api, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/UI/Screens/HomeSection/Screens/PostScreen/Widget/VideoPlayer/VideoPlayerSrc/video_player.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final UniqueKey newKey;
  final bool? autoPlay;
  final bool? allowPlay;
  final bool? isDownLoaded;

  const MyVideoPlayer(
      {required this.videoUrl,
      required this.newKey,
      this.autoPlay,
      this.isDownLoaded = false,
      this.allowPlay=true})
      : super(
            key:
                newKey); // passing Unique key to dispose old class instance and create new with new data

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  VideoPlayerController? _controller;
  ChewieController? _chewie;

  @override
  void initState() {
    _initControllers(widget.videoUrl);
    super.initState();
  }

  void _initControllers(String url) {
    _controller = widget.isDownLoaded == false
        ? VideoPlayerController.network(url)
        : VideoPlayerController.file(File(url));
    _chewie = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: widget.autoPlay ?? false,
      allowPlay: widget.allowPlay!,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ],
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    _chewie!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.videoUrl == null
        ? const CircularProgressIndicator(
            color: ColorConstants.primary,
          )
        : Chewie(controller: _chewie!);
  }
}
