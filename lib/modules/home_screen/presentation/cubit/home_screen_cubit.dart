import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:upi_qr_code/core/extensions/build_context_extension.dart';
import 'package:vibration/vibration.dart';

part 'home_screen_state.dart';

part 'home_screen_cubit.freezed.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState(index: 1));

  Future<void> scanQr(BuildContext context, Barcode scanData,
      QRViewController controller) async {
    final uri = Uri.tryParse(scanData.code!);

    if (uri?.scheme == 'upi') {
      final upiId = uri!.queryParameters['pa'];

      if (upiId == null) {
        context.showErrorSnackBar(
          const Text('Invalid UPI ID'),
          behavior: SnackBarBehavior.floating,
        );
        await errorVibrate();

        await Future.delayed(Durations.extralong1);
      } else {
        await sucessVibrate();
        emit(state.copyWith(
          upiId: upiId,
          name: uri.queryParameters['pn'],
          amount: double.tryParse(uri.queryParameters['am'] ?? "") ?? 0,
          index: 1,
        ));
      }
    } else {
      context.showErrorSnackBar(
        scanData.code!.contains('upi://')
            ? const Text('Please Scan valid QR Code')
            : const Text('Please Scan UPI QR Code'),
        behavior: SnackBarBehavior.floating,
      );
      await errorVibrate();
      await Future.delayed(Durations.extralong1);
    }
  }

  Future<void> errorVibrate() async {
    await Vibration.vibrate(pattern: [0, 200, 100, 200], amplitude: 255);
  }

  Future<void> sucessVibrate() async {
    await Vibration.vibrate(pattern: [
      0,
      200,
    ], amplitude: 255);
  }

  void setIndex(int value) {
    emit(state.copyWith(index: value));
  }
}
