part of 'qr_code_screen_cubit.dart';

enum QrCodeScreenStateStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class QrCodeScreenState with _$QrCodeScreenState {
  factory QrCodeScreenState({
    String? data,
    String? errorMsg,
    String? successMsg,
    String? filePath,
    @Default(QrCodeScreenStateStatus.initial) QrCodeScreenStateStatus status,
  }) = _QrCodeScreenState;
}
