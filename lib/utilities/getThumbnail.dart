import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

Future<String> getThumbnail(String path) async {
  String home = await VideoThumbnail.thumbnailFile(video: path);

  return home;
}
