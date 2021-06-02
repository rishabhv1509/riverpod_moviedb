import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_moviedb/models/movie.dart';
import 'package:riverpod_moviedb/service/api_service.dart';
import 'package:state_notifier/state_notifier.dart';

class MovieProvider extends StateNotifier<AsyncValue<Movie>> {
  MovieProvider() : super(AsyncData(null));
  Movie movie;

  fetchMovie(String movieName) async {
    try {
      state = AsyncLoading();
      var result = await ApiService().getMovieData(movieName);

      if (result['Response'] == 'True') {
        movie = Movie.fromJson(result);
      } else {
        movie = null;
      }
      state = AsyncData(movie);
    } catch (e) {
      print('ERROR in fetching movie ');
    }
  }
}
