import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:upi_quick_qr/core/constants/constants.dart';
import 'package:upi_quick_qr/core/modal/qrcode.dart';

part 'history_screen_state.dart';
part 'history_screen_cubit.freezed.dart';

class HistoryScreenCubit extends Cubit<HistoryScreenState> {
  HistoryScreenCubit() : super(const HistoryScreenState());

  Future<List<QrCode>> getHistory() async {
    emit(state.copyWith(status: HistoryScreenStateStatus.loading));
    List<QrCode> historyList = Hive.box<QrCode>(S.boxKey).values.toList();

    historyList.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    emit(state.copyWith(
      status: HistoryScreenStateStatus.loaded,
      historyList: historyList,
    ));
    return historyList;
  }

  Future<void> delete(String id) async {
    emit(state.copyWith(status: HistoryScreenStateStatus.loading));
    Box<QrCode> box = Hive.box<QrCode>(S.boxKey);
    await box.delete(id);

    List<QrCode> historyList = Hive.box<QrCode>(S.boxKey).values.toList();

    historyList.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    emit(state.copyWith(
      status: HistoryScreenStateStatus.loaded,
      historyList: historyList,
    ));
  }
}
