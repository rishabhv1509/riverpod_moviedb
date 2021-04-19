// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 0;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie(
      title: fields[0] as String,
      year: fields[1] as String,
      rated: fields[2] as String,
      released: fields[3] as String,
      runtime: fields[4] as String,
      genre: fields[5] as String,
      director: fields[6] as String,
      writer: fields[7] as String,
      actors: fields[8] as String,
      plot: fields[9] as String,
      language: fields[10] as String,
      country: fields[11] as String,
      poster: fields[12] as String,
      ratings: (fields[13] as List)?.cast<Ratings>(),
      imdbRating: fields[14] as String,
      type: fields[15] as String,
      response: fields[16] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.year)
      ..writeByte(2)
      ..write(obj.rated)
      ..writeByte(3)
      ..write(obj.released)
      ..writeByte(4)
      ..write(obj.runtime)
      ..writeByte(5)
      ..write(obj.genre)
      ..writeByte(6)
      ..write(obj.director)
      ..writeByte(7)
      ..write(obj.writer)
      ..writeByte(8)
      ..write(obj.actors)
      ..writeByte(9)
      ..write(obj.plot)
      ..writeByte(10)
      ..write(obj.language)
      ..writeByte(11)
      ..write(obj.country)
      ..writeByte(12)
      ..write(obj.poster)
      ..writeByte(13)
      ..write(obj.ratings)
      ..writeByte(14)
      ..write(obj.imdbRating)
      ..writeByte(15)
      ..write(obj.type)
      ..writeByte(16)
      ..write(obj.response);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
