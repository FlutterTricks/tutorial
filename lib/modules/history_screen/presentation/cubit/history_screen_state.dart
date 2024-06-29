part of 'history_screen_cubit.dart';

enum HistoryScreenStateStatus {
  initial,
  loading,
  loaded,
  error,
}

@freezed
class HistoryScreenState with _$HistoryScreenState {
  const factory HistoryScreenState({
    @Default(HistoryScreenStateStatus.initial) HistoryScreenStateStatus status,
    @Default([]) List<QrCode> historyList,
    String? errorMsg,
  }) = _HistoryScreenState;
}
