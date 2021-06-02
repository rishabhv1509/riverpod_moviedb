import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_moviedb/screens/home_screen.dart';
import 'package:riverpod_moviedb/models/recent_list.dart';
import 'models/movie.dart';
import 'models/ratings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory downloadDirectory;
  if (Platform.isIOS) {
    downloadDirectory = await path_provider.getApplicationDocumentsDirectory();
  } else {
    downloadDirectory = await path_provider.getExternalStorageDirectory();
  }
  Hive.init(downloadDirectory.path);
  Hive.registerAdapter(MovieAdapter());
  Hive.registerAdapter(RatingsAdapter());
  Hive.registerAdapter(RecentListAdapter());
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
