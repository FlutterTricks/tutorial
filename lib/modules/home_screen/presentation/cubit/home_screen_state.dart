part of 'home_screen_cubit.dart';

@immutable
@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default(0) int index,
    String? upiId,
    String? name,
    double? amount,
  }) = _HomeScreenState;

  
}
