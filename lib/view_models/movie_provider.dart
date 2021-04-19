import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_moviedb/data/api_calls.dart';
import 'package:riverpod_moviedb/models/movie.dart';
import 'package:state_notifier/state_notifier.dart';

class MovieProvider extends StateNotifier<AsyncValue<Movie>> {
  MovieProvider() : super(AsyncData(null));
  fetchMovie(String movieName) async {
    try {
      state = AsyncLoading();
      var result = await ApiCall().getMovieData(movieName);

      Movie movie = Movie.fromJson((result));
      state = AsyncData(movie);
    } catch (e) {
      print('ERROR in fetching movie ');
    }
  }
}
