import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_moviedb/models/movie.dart';
import 'package:riverpod_moviedb/service/api_service.dart';
import 'package:state_notifier/state_notifier.dart';

class MovieProvider extends StateNotifier<AsyncValue<Movie>> {
  MovieProvider() : super(AsyncData(null));
  fetchMovie(String movieName) async {
    try {
      state = AsyncLoading();
      var result = await ApiService().getMovieData(movieName);

      Movie movie = Movie.fromJson((result));
      state = AsyncData(movie);
    } catch (e) {
      print('ERROR in fetching movie ');
    }
  }
}
