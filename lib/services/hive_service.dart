import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:riverpod_moviedb/models/movie.dart';

class HiveService {
  initHive() async {
    Directory downloadDirectory;
    if (Platform.isIOS) {
      downloadDirectory =
          await path_provider.getApplicationDocumentsDirectory();
    } else {
      downloadDirectory = await path_provider.getExternalStorageDirectory();
    }
    Hive.init(downloadDirectory.path);
    // Hive.initFlutter();
  }

  writeData(String boxName, key, value) async {
    var box = await Hive.openBox(boxName);
    await box.put(key, value);
    // await box.close();
  }

  Future<List> readData(String boxName, key) async {
    List tempList = [];
    var box = await Hive.openBox(boxName);
    var data = await box.get(key);

    data?.forEach((element) {
      tempList.add(element);
    });

    // await box.close();
    return data;
  }
}
