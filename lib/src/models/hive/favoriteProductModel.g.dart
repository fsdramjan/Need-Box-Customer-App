// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favoriteProductModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteProductModelAdapter extends TypeAdapter<FavoriteProductModel> {
  @override
  final int typeId = 0;

  @override
  FavoriteProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteProductModel(
      id: fields[0] as int?,
      productname: fields[1] as String?,
      image: fields[2] as String?,
      proDisPrice: fields[5] as int?,
      proPrice: fields[4] as int?,
      productColor: fields[3] as String?,
      discount: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteProductModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productname)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.productColor)
      ..writeByte(4)
      ..write(obj.proPrice)
      ..writeByte(5)
      ..write(obj.proDisPrice)
      ..writeByte(6)
      ..write(obj.discount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
