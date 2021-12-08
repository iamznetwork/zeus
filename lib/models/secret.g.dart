// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SecretAdapter extends TypeAdapter<Secret> {
  @override
  final int typeId = 0;

  @override
  Secret read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Secret(
      title: fields[0] as String?,
      description: fields[1] as String?,
      url: fields[2] as String?,
      username: fields[3] as String?,
      secret: fields[4] as String?,
      notes: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Secret obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.secret)
      ..writeByte(5)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SecretAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
