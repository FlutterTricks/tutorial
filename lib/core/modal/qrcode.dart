import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'qrcode.freezed.dart';
part 'qrcode.g.dart';

@freezed
@HiveType(typeId: 0)
class QrCode with _$QrCode {
  const factory QrCode({
    @HiveField(0) required String id,
    @HiveField(1) required String upiId,
    @HiveField(2) String? name,
    @HiveField(3) String? amount,
    @HiveField(4) required DateTime createdAt,
  }) = _QrCode;

  factory QrCode.fromJson(Map<String, Object?> json) => _$QrCodeFromJson(json);
}
