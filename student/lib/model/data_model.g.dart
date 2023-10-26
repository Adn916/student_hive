// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class studentModelAdapter extends TypeAdapter<studentModel> {
  @override
  final int typeId = 1;

  @override
  studentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return studentModel(
      name: fields[1] as String,
      age: fields[2] as String,
      cls: fields[3] as String,
      address: fields[4] as String,
      index: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, studentModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.cls)
      ..writeByte(4)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is studentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
