// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_code_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QrCodeScreenState {
  String? get data => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;
  String? get successMsg => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;
  QrCodeScreenStateStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QrCodeScreenStateCopyWith<QrCodeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrCodeScreenStateCopyWith<$Res> {
  factory $QrCodeScreenStateCopyWith(
          QrCodeScreenState value, $Res Function(QrCodeScreenState) then) =
      _$QrCodeScreenStateCopyWithImpl<$Res, QrCodeScreenState>;
  @useResult
  $Res call(
      {String? data,
      String? errorMsg,
      String? successMsg,
      String? filePath,
      QrCodeScreenStateStatus status});
}

/// @nodoc
class _$QrCodeScreenStateCopyWithImpl<$Res, $Val extends QrCodeScreenState>
    implements $QrCodeScreenStateCopyWith<$Res> {
  _$QrCodeScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? errorMsg = freezed,
    Object? successMsg = freezed,
    Object? filePath = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      successMsg: freezed == successMsg
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as QrCodeScreenStateStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrCodeScreenStateImplCopyWith<$Res>
    implements $QrCodeScreenStateCopyWith<$Res> {
  factory _$$QrCodeScreenStateImplCopyWith(_$QrCodeScreenStateImpl value,
          $Res Function(_$QrCodeScreenStateImpl) then) =
      __$$QrCodeScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? data,
      String? errorMsg,
      String? successMsg,
      String? filePath,
      QrCodeScreenStateStatus status});
}

/// @nodoc
class __$$QrCodeScreenStateImplCopyWithImpl<$Res>
    extends _$QrCodeScreenStateCopyWithImpl<$Res, _$QrCodeScreenStateImpl>
    implements _$$QrCodeScreenStateImplCopyWith<$Res> {
  __$$QrCodeScreenStateImplCopyWithImpl(_$QrCodeScreenStateImpl _value,
      $Res Function(_$QrCodeScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? errorMsg = freezed,
    Object? successMsg = freezed,
    Object? filePath = freezed,
    Object? status = null,
  }) {
    return _then(_$QrCodeScreenStateImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      successMsg: freezed == successMsg
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as QrCodeScreenStateStatus,
    ));
  }
}

/// @nodoc

class _$QrCodeScreenStateImpl
    with DiagnosticableTreeMixin
    implements _QrCodeScreenState {
  _$QrCodeScreenStateImpl(
      {this.data,
      this.errorMsg,
      this.successMsg,
      this.filePath,
      this.status = QrCodeScreenStateStatus.initial});

  @override
  final String? data;
  @override
  final String? errorMsg;
  @override
  final String? successMsg;
  @override
  final String? filePath;
  @override
  @JsonKey()
  final QrCodeScreenStateStatus status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QrCodeScreenState(data: $data, errorMsg: $errorMsg, successMsg: $successMsg, filePath: $filePath, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QrCodeScreenState'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('errorMsg', errorMsg))
      ..add(DiagnosticsProperty('successMsg', successMsg))
      ..add(DiagnosticsProperty('filePath', filePath))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrCodeScreenStateImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.successMsg, successMsg) ||
                other.successMsg == successMsg) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, data, errorMsg, successMsg, filePath, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QrCodeScreenStateImplCopyWith<_$QrCodeScreenStateImpl> get copyWith =>
      __$$QrCodeScreenStateImplCopyWithImpl<_$QrCodeScreenStateImpl>(
          this, _$identity);
}

abstract class _QrCodeScreenState implements QrCodeScreenState {
  factory _QrCodeScreenState(
      {final String? data,
      final String? errorMsg,
      final String? successMsg,
      final String? filePath,
      final QrCodeScreenStateStatus status}) = _$QrCodeScreenStateImpl;

  @override
  String? get data;
  @override
  String? get errorMsg;
  @override
  String? get successMsg;
  @override
  String? get filePath;
  @override
  QrCodeScreenStateStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$QrCodeScreenStateImplCopyWith<_$QrCodeScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
