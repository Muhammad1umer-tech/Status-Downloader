import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/getStatusesProvider.dart';
import '../images/imageViewPage.dart';

class ImageHomePage extends StatefulWidget {
  @override
  State<ImageHomePage> createState() => _ImageHomePageState();
}

class _ImageHomePageState extends State<ImageHomePage> {
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
          value.getStatus(".jpg");
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
                    child: Text("No Pics Found Right Now"),
                  )
                : Container(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      children: List.generate(value.getImages.length, (index) {
                        final data = value.getImages[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => imageViewClass()));
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
