import 'package:downloader/screen/BottomNaviPages/videos/videoViewPage.dart';
import 'package:flutter/material.dart';

class VideoHomePage extends StatefulWidget {
  @override
  State<VideoHomePage> createState() => _VideoHomePageState();
}

class _VideoHomePageState extends State<VideoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => videoViewClass()));
        },
        child: Container(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            children: List.generate(10, (index) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
