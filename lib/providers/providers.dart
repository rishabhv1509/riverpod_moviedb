import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_moviedb/models/movie.dart';
import 'package:riverpod_moviedb/view_models/movie_provider.dart';

final movieProvider = StateNotifierProvider<MovieProvider, AsyncValue<Movie>>(
    (ref) => MovieProvider());
