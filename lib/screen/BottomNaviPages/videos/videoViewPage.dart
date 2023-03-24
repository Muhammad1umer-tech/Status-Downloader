import 'dart:io';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_native_api/flutter_native_api.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:video_player/video_player.dart';

class videoViewClass extends StatefulWidget {
  final videoPath;

  videoViewClass({this.videoPath});

  static const routename = '/imageVieClass';

  @override
  State<videoViewClass> createState() => _videoViewClassState();
}

class _videoViewClassState extends State<videoViewClass> {
  ChewieController controller;
  final videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
  @override
  void initState() {
    super.initState();
    final chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.file(File(widget.videoPath)),
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.pause();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chewie(controller: controller),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () async {
                final p =
                    await ImageGallerySaver.saveFile(widget.videoPath).then(
                  (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Image Showd")));
                  },
                );
              },
              icon: Icon(Icons.download)),
          IconButton(
              onPressed: () {
                FlutterNativeApi.shareImage(widget.videoPath);
              },
              icon: Icon(Icons.share)),
        ],
      ),
    );
  }
}
