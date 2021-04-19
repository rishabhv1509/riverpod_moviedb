import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_moviedb/models/movie.dart';
import 'package:riverpod_moviedb/service/api_service.dart';
import 'package:riverpod_moviedb/services/hive_service.dart';
import 'package:riverpod_moviedb/utils/constants.dart';

class HomeScreenProvider extends StateNotifier<AsyncValue<List<Movie>>> {
  HomeScreenProvider() : super(AsyncData([])) {
    _init();
  }
  _init() async {
    // try {
    AsyncLoading();
    await fetchRecents();
    AsyncData(recentsList);
    // } catch (e) {
    //   print('IN INIT OF HOME SCREEN PROVIDER');
    // }
  }

  List<Movie> recentsList = [];
  fetchRecents() async {
    // HiveService().initHive();
    AsyncLoading();
    // try {
    var dbList = await HiveService()
        .readData(Contants.RECENTS_BOX, Contants.RECENTS_KEY);

    if (dbList == null) {
      recentsList = [];
    } else {
      // dbList.forEach((element) {
      //   recentsList.add(element);
      // });
      recentsList = List.from(dbList);
    }
    // recentsList.forEach((element) => print);
    AsyncData(recentsList);
    // } catch (e) {
    //   print('ERROR in fetching llist');
    // }
  }

  setRecents(Movie movie) async {
    try {
      fetchRecents();
      if (recentsList.length < 10) {
        recentsList.add(movie);
      } else {
        recentsList.removeAt(0);
        recentsList.add(movie);
      }

      await HiveService()
          .writeData(Contants.RECENTS_BOX, Contants.RECENTS_KEY, recentsList);
      fetchRecents();
    } catch (e) {
      print('ERROR in getting movie provider');
    }
  }

  getMovieData(String movieName) async {
    var response = await ApiService().getMovieData(movieName);
    if (response['Response'] == 'True') {
      Movie movie = Movie.fromJson(response);
      setRecents(movie);
    }
  }
}
