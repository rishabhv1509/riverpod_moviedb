import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_moviedb/providers/providers.dart';
import 'package:riverpod_moviedb/screens/movie_details/movie_details.dart';
import 'package:riverpod_moviedb/size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController movieController = TextEditingController();
  @override
  void dispose() {
    movieController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    SizeConfig().calculateScaleRatios(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                            child:
                                Text('Please search for a movie or try again'),
                          )
                        : Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                    color: Colors.black,
                                    height: 700,
                                    child: MovieDetails(movie: movie)),
                              )
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
