// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentListAdapter extends TypeAdapter<RecentList> {
  @override
  final int typeId = 2;

  @override
  RecentList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentList(
      recentList: (fields[0] as List)?.cast<Movie>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecentList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.recentList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
