import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_moviedb/providers/providers.dart';
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
  // HiveService().initHive();
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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController movieController = TextEditingController();
  @override
  void dispose() {
    movieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod OMDB'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              width: 300,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: TextField(
                  controller: movieController,
                  decoration: InputDecoration.collapsed(hintText: 'hintText'),
                ),
              ),
            ),
            Consumer(builder: (context, watch, _) {
              return watch(movieProvider).when(
                  data: (movie) {
                    return movie == null
                        ? Center(
                            child: Text('Please search for a movie'),
                          )
                        : Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: Image.network(
                                  (movie == null) ? "" : "${movie.poster}",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text((movie == null)
                                    ? ""
                                    : "Title: ${movie.title}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text((movie == null)
                                    ? ""
                                    : "Director: ${movie.director}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text((movie == null)
                                    ? ""
                                    : "Released: ${movie.released}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text((movie == null)
                                    ? ""
                                    : "Plot: ${movie.plot}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text((movie == null)
                                    ? ""
                                    : "Rated: ${movie.rated}"),
                              ),
                            ],
                          );
                  },
                  loading: () {
                    return CircularProgressIndicator();
                  },
                  error: (error, r) => AlertDialog(
                        content: Text('Something went wrong'),
                        actions: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ok')),
                            ],
                          )
                        ],
                      ));
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(movieProvider.notifier).fetchMovie(movieController.text);
        },
        tooltip: 'Increment',
        child: Icon(Icons.search),
      ),
    );
  }
}
