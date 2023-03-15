import 'package:downloader/screen/BottomNaviPages/videos/videoViewPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:io';

import '../../../provider/getStatusesProvider.dart';

class VideoHomePage extends StatefulWidget {
  @override
  State<VideoHomePage> createState() => _VideoHomePageState();
}

class _VideoHomePageState extends State<VideoHomePage> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<GetStatusesProvider>(context, listen: false).getStatus();
  // }
  bool _isFetched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GetStatusesProvider>(builder: (context, value, child) {
        if (_isFetched == false) {
          value.getStatus(".mp4");
          Future.delayed(const Duration(microseconds: 1));

          // print("value.getImages");
          //print(value.getImages);
          _isFetched = true; //may use future
        }
        return value.isWhatsappAvailable == false
            ? const Center(
                child: Text("No WhatsApp Available"),
              )
            : value.getImages.isEmpty
                ? const Center(
                    child: Text("No video Found Right Now"),
                  )
                : Container(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      children: List.generate(0, (index) {
                        final data = value.getVideos[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => videoViewClass()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(File(data.path))),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
      }),
    );
  }
}
