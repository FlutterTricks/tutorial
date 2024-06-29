// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryScreenState {
  HistoryScreenStateStatus get status => throw _privateConstructorUsedError;
  List<QrCode> get historyList => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryScreenStateCopyWith<HistoryScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryScreenStateCopyWith<$Res> {
  factory $HistoryScreenStateCopyWith(
          HistoryScreenState value, $Res Function(HistoryScreenState) then) =
      _$HistoryScreenStateCopyWithImpl<$Res, HistoryScreenState>;
  @useResult
  $Res call(
      {HistoryScreenStateStatus status,
      List<QrCode> historyList,
      String? errorMsg});
}

/// @nodoc
class _$HistoryScreenStateCopyWithImpl<$Res, $Val extends HistoryScreenState>
    implements $HistoryScreenStateCopyWith<$Res> {
  _$HistoryScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? historyList = null,
    Object? errorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HistoryScreenStateStatus,
      historyList: null == historyList
          ? _value.historyList
          : historyList // ignore: cast_nullable_to_non_nullable
              as List<QrCode>,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryScreenStateImplCopyWith<$Res>
    implements $HistoryScreenStateCopyWith<$Res> {
  factory _$$HistoryScreenStateImplCopyWith(_$HistoryScreenStateImpl value,
          $Res Function(_$HistoryScreenStateImpl) then) =
      __$$HistoryScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HistoryScreenStateStatus status,
      List<QrCode> historyList,
      String? errorMsg});
}

/// @nodoc
class __$$HistoryScreenStateImplCopyWithImpl<$Res>
    extends _$HistoryScreenStateCopyWithImpl<$Res, _$HistoryScreenStateImpl>
    implements _$$HistoryScreenStateImplCopyWith<$Res> {
  __$$HistoryScreenStateImplCopyWithImpl(_$HistoryScreenStateImpl _value,
      $Res Function(_$HistoryScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? historyList = null,
    Object? errorMsg = freezed,
  }) {
    return _then(_$HistoryScreenStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HistoryScreenStateStatus,
      historyList: null == historyList
          ? _value._historyList
          : historyList // ignore: cast_nullable_to_non_nullable
              as List<QrCode>,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HistoryScreenStateImpl implements _HistoryScreenState {
  const _$HistoryScreenStateImpl(
      {this.status = HistoryScreenStateStatus.initial,
      final List<QrCode> historyList = const [],
      this.errorMsg})
      : _historyList = historyList;

  @override
  @JsonKey()
  final HistoryScreenStateStatus status;
  final List<QrCode> _historyList;
  @override
  @JsonKey()
  List<QrCode> get historyList {
    if (_historyList is EqualUnmodifiableListView) return _historyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyList);
  }

  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'HistoryScreenState(status: $status, historyList: $historyList, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryScreenStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._historyList, _historyList) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_historyList), errorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryScreenStateImplCopyWith<_$HistoryScreenStateImpl> get copyWith =>
      __$$HistoryScreenStateImplCopyWithImpl<_$HistoryScreenStateImpl>(
          this, _$identity);
}

abstract class _HistoryScreenState implements HistoryScreenState {
  const factory _HistoryScreenState(
      {final HistoryScreenStateStatus status,
      final List<QrCode> historyList,
      final String? errorMsg}) = _$HistoryScreenStateImpl;

  @override
  HistoryScreenStateStatus get status;
  @override
  List<QrCode> get historyList;
  @override
  String? get errorMsg;
  @override
  @JsonKey(ignore: true)
  _$$HistoryScreenStateImplCopyWith<_$HistoryScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
