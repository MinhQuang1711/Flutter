// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PayModelAdapter extends TypeAdapter<PayModel> {
  @override
  final int typeId = 3;

  @override
  PayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PayModel(
      listModel: (fields[1] as List).cast<CartModel>(),
      total: fields[2] as double?,
      id: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PayModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.listModel)
      ..writeByte(2)
      ..write(obj.total)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
