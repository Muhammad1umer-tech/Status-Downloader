import 'dart:io';

import 'package:flutter/material.dart';
import '../images/imageViewPage.dart';

class ImageHomePage extends StatefulWidget {
  @override
  State<ImageHomePage> createState() => _ImageHomePageState();
}

class _ImageHomePageState extends State<ImageHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          children: List.generate(10, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => imageViewClass()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
