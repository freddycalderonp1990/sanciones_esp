import 'dart:io';


import 'package:flutter/cupertino.dart';
import '../../../app/core/utils/device_info.dart';
import '../../../app/core/utils/utilidadesUtil.dart';
import 'package:path_provider/path_provider.dart';

class MyFile{


  static Future<File> getFile(String name) async {
    final path = await DeviceInfo.getLocalPath;
    String file='$path/'+name+'.txt';
    return File(file);
  }

  static Future<File> writeFile({String name='File',required String palabra}) async {
    final file = await getFile(name);
    // Escribir el archivo
    return file.writeAsString('$palabra');
  }


}