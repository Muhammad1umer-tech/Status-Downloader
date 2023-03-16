import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_api/flutter_native_api.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class imageViewClass extends StatefulWidget {
  final String image;
  imageViewClass(this.image);
  static const routename = '/imageVieClass';

  @override
  State<imageViewClass> createState() => _imageViewClassState();
}

class _imageViewClassState extends State<imageViewClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: FileImage(File(widget.image))),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () async {
                print(widget.image);
                final p = await ImageGallerySaver.saveFile(widget.image).then(
                  (value) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Image Showd")));
                  },
                );
                print("object");
              },
              icon: Icon(Icons.download)),
          IconButton(
              onPressed: () async {
                FlutterNativeApi.shareImage(widget.image);
              },
              icon: Icon(Icons.share)),
        ],
      ),
    );
  }
}
