import 'dart:developer';
import 'dart:io';

import 'package:downloader/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class GetStatusesProvider extends ChangeNotifier {
  List<FileSystemEntity> _getImages = [];
  List<FileSystemEntity> _getVideos = [];
  bool isWhatsappAvailable = false;

  List<FileSystemEntity> get getImages {
    if (_getImages.isEmpty)
      print("Empty");
    else
      print("Not Empty");
    return _getImages;
  }

  List<FileSystemEntity> get getVideos {
    return _getVideos;
  }

  bool get iswhatsappAvilable => isWhatsappAvailable;

  void getStatus(String ext) async {
    final status = await Permission.storage.request(); //permission handler

    //Directory direc = await getExternalStorageDirectory(); //path Provider
    if (status.isDenied) {
      Permission.storage.request();
      log("Permission Denied");
      return;
    }
    if (status.isGranted) {
      //log(direc.path);
      final directory = Directory(AppConstants.whatsapp_path);
      if (directory.existsSync()) {
        final items = directory.listSync();
        print(ext);
        if (ext == '.mp4') {
          _getVideos = items
              .where(
                (element) => element.path.endsWith(ext),
              )
              .toList();
          notifyListeners();
        } else {
          print("else");
          _getImages = items
              .where(
                (element) => element.path.endsWith(ext),
              )
              .toList();
          print(_getImages);
          notifyListeners();
        }
        isWhatsappAvailable = true;
        notifyListeners();
        log(items.toString());
      } else {
        log(" No WhatsApp Found");
        isWhatsappAvailable = false;
        notifyListeners();
      }
    }
  }
}
