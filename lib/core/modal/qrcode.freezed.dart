// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qrcode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QrCode _$QrCodeFromJson(Map<String, dynamic> json) {
  return _QrCode.fromJson(json);
}

/// @nodoc
mixin _$QrCode {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get upiId => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get amount => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QrCodeCopyWith<QrCode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrCodeCopyWith<$Res> {
  factory $QrCodeCopyWith(QrCode value, $Res Function(QrCode) then) =
      _$QrCodeCopyWithImpl<$Res, QrCode>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String upiId,
      @HiveField(2) String? name,
      @HiveField(3) String? amount,
      @HiveField(4) DateTime createdAt});
}

/// @nodoc
class _$QrCodeCopyWithImpl<$Res, $Val extends QrCode>
    implements $QrCodeCopyWith<$Res> {
  _$QrCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? upiId = null,
    Object? name = freezed,
    Object? amount = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      upiId: null == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrCodeImplCopyWith<$Res> implements $QrCodeCopyWith<$Res> {
  factory _$$QrCodeImplCopyWith(
          _$QrCodeImpl value, $Res Function(_$QrCodeImpl) then) =
      __$$QrCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String upiId,
      @HiveField(2) String? name,
      @HiveField(3) String? amount,
      @HiveField(4) DateTime createdAt});
}

/// @nodoc
class __$$QrCodeImplCopyWithImpl<$Res>
    extends _$QrCodeCopyWithImpl<$Res, _$QrCodeImpl>
    implements _$$QrCodeImplCopyWith<$Res> {
  __$$QrCodeImplCopyWithImpl(
      _$QrCodeImpl _value, $Res Function(_$QrCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? upiId = null,
    Object? name = freezed,
    Object? amount = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$QrCodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      upiId: null == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QrCodeImpl implements _QrCode {
  const _$QrCodeImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.upiId,
      @HiveField(2) this.name,
      @HiveField(3) this.amount,
      @HiveField(4) required this.createdAt});

  factory _$QrCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrCodeImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String upiId;
  @override
  @HiveField(2)
  final String? name;
  @override
  @HiveField(3)
  final String? amount;
  @override
  @HiveField(4)
  final DateTime createdAt;

  @override
  String toString() {
    return 'QrCode(id: $id, upiId: $upiId, name: $name, amount: $amount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrCodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.upiId, upiId) || other.upiId == upiId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, upiId, name, amount, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QrCodeImplCopyWith<_$QrCodeImpl> get copyWith =>
      __$$QrCodeImplCopyWithImpl<_$QrCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrCodeImplToJson(
      this,
    );
  }
}

abstract class _QrCode implements QrCode {
  const factory _QrCode(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String upiId,
      @HiveField(2) final String? name,
      @HiveField(3) final String? amount,
      @HiveField(4) required final DateTime createdAt}) = _$QrCodeImpl;

  factory _QrCode.fromJson(Map<String, dynamic> json) = _$QrCodeImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get upiId;
  @override
  @HiveField(2)
  String? get name;
  @override
  @HiveField(3)
  String? get amount;
  @override
  @HiveField(4)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$QrCodeImplCopyWith<_$QrCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
