// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocaleAdapter extends TypeAdapter<Locale> {
  @override
  final typeId = 1;

  @override
  Locale read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Locale(
      id: (fields[0] as num?)?.toInt(),
      name: fields[1] as String?,
      description: fields[2] as String?,
      locale: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Locale obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.locale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocaleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
