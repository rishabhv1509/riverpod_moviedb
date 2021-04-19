// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RatingsAdapter extends TypeAdapter<Ratings> {
  @override
  final int typeId = 1;

  @override
  Ratings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ratings(
      source: fields[0] as String,
      value: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Ratings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.source)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
