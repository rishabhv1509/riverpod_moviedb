import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_moviedb/models/movie.dart';
import 'package:riverpod_moviedb/view_models/home_screen_provider.dart';
import 'package:riverpod_moviedb/view_models/movie_provider.dart';

final movieProvider =
    StateNotifierProvider.autoDispose<MovieProvider, AsyncValue<Movie>>(
        (ref) => MovieProvider());

final homeScreenStateProvider =
    StateNotifierProvider<HomeScreenProvider, AsyncValue<List<Movie>>>(
        (ref) => HomeScreenProvider());

final homeScreenProvider =
    StateProvider<HomeScreenProvider>((ref) => HomeScreenProvider());
