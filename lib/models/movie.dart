import 'package:hive/hive.dart';
import 'package:riverpod_moviedb/models/ratings.dart';
part 'movie.g.dart';

@HiveType(typeId: 0)
class Movie {
  @HiveField(0)
  String title;
  @HiveField(1)
  String year;
  @HiveField(2)
  String rated;
  @HiveField(3)
  String released;
  @HiveField(4)
  String runtime;
  @HiveField(5)
  String genre;
  @HiveField(6)
  String director;
  @HiveField(7)
  String writer;
  @HiveField(8)
  String actors;
  @HiveField(9)
  String plot;
  @HiveField(10)
  String language;
  @HiveField(11)
  String country;

  @HiveField(12)
  String poster;
  @HiveField(13)
  List<Ratings> ratings;

  @HiveField(14)
  String imdbRating;

  @HiveField(15)
  String type;
  @HiveField(16)
  String response;
// }
  Movie(
      {this.title,
      this.year,
      this.rated,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.country,
      this.poster,
      this.ratings,
      this.imdbRating,
      this.type,
      this.response});

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    rated = json['Rated'];
    released = json['Released'];
    runtime = json['Runtime'];
    genre = json['Genre'];
    director = json['Director'];
    writer = json['Writer'];
    actors = json['Actors'];
    plot = json['Plot'];
    language = json['Language'];
    country = json['Country'];

    poster = json['Poster'];
    if (json['Ratings'] != null) {
      ratings = <Ratings>[];
      json['Ratings'].forEach((v) {
        ratings.add(Ratings.fromJson(v));
      });
    }

    type = json['Type'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['Rated'] = this.rated;
    data['Released'] = this.released;
    data['Runtime'] = this.runtime;
    data['Genre'] = this.genre;
    data['Director'] = this.director;
    data['Writer'] = this.writer;
    data['Actors'] = this.actors;
    data['Plot'] = this.plot;
    data['Language'] = this.language;
    data['Country'] = this.country;

    data['Poster'] = this.poster;
    if (this.ratings != null) {
      data['Ratings'] = this.ratings.map((v) => v.toJson()).toList();
    }

    data['Type'] = this.type;
    data['Response'] = this.response;

    return data;
  }
}
