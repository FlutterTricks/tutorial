// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qrcode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QrCodeAdapter extends TypeAdapter<QrCode> {
  @override
  final int typeId = 0;

  @override
  QrCode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QrCode(
      id: fields[0] as String,
      upiId: fields[1] as String,
      name: fields[2] as String?,
      amount: fields[3] as String?,
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, QrCode obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.upiId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QrCodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrCodeImpl _$$QrCodeImplFromJson(Map<String, dynamic> json) => _$QrCodeImpl(
      id: json['id'] as String,
      upiId: json['upiId'] as String,
      name: json['name'] as String?,
      amount: json['amount'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$QrCodeImplToJson(_$QrCodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'upiId': instance.upiId,
      'name': instance.name,
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
