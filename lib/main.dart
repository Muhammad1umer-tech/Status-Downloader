import 'package:downloader/provider/Bottom_nav_Provider.dart';
import 'package:downloader/screen/mainActivity.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import './screen/BottomNaviPages/images/imageViewPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Bottom_Navigation_Bar()),
      ],
      child: MaterialApp(
        home: mainActivity(),
        // routes: {
        //   imageViewClass.routename: (context) => imageViewClass(),
        // },
      ),
    );
  }
}
