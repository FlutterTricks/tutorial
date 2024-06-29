import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:upi_quick_qr/core/constants/constants.dart';
import 'package:upi_quick_qr/core/modal/qrcode.dart';
import 'package:upi_quick_qr/modules/qr_code_screen/generate_image.dart';

part 'qr_code_screen_state.dart';
part 'qr_code_screen_cubit.freezed.dart';

class QrCodeScreenCubit extends Cubit<QrCodeScreenState> {
  QrCodeScreenCubit(this.util) : super(QrCodeScreenState());
  ImageUtil util;

  Future<void> saveInHistory(String upiId, String? name, String? amount) async {
    String data = "upi://pay?pa=$upiId&pn=$name&am=$amount&cu=INR";

    await Hive.box<QrCode>(S.boxKey).put(
      data,
      QrCode(
        id: data,
        upiId: upiId,
        name: name,
        amount: amount,
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<void> downloadImage(String upiId, String? name, String? amount) async {
    emit(state.copyWith(status: QrCodeScreenStateStatus.loading));

    try {
      // bool isGranted =
      // await Permission.manageExternalStorage.request().isGranted;

      // if (!isGranted) {
      //   emit(
      //     state.copyWith(
      //         status: QrCodeScreenStateStatus.error,
      //         errorMsg: "Permission denied"),
      //   );
      //   return;
      // }
      // await Permission.photos.request();
      String data = "upi://pay?pa=$upiId&pn=$name&am=$amount&cu=INR";

      String? path = await util.downloadImage(data, name, amount, upiId);

      if (path != null) {
        emit(
          state.copyWith(
            status: QrCodeScreenStateStatus.success,
            filePath: path,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(state.copyWith(status: QrCodeScreenStateStatus.error));
      rethrow;
    }
  }

  Future<void> shareImage(
      String data, String? name, String? amount, String upiId) async {
    emit(state.copyWith(status: QrCodeScreenStateStatus.loading));

    try {
      // bool isGranted = await Permission.manageExternalStorage.request().isGranted;
      String data = "upi://pay?pa=$upiId&pn=$name&am=$amount&cu=INR";

      Uint8List? image = await util.shareImage(data, name, amount, upiId);

      if (image != null) {
        Share.shareXFiles([
          XFile.fromData(
            image,
            mimeType: 'image/png',
          )
        ],
            text:
                "Check out this UPI QR code from UPI QR Code Generator\nUPI ID: $upiId\nName: ${name ?? ""}\nAmount: ${amount ?? ""}");
        emit(state.copyWith(status: QrCodeScreenStateStatus.initial));
      }
    } catch (e) {
      emit(state.copyWith(status: QrCodeScreenStateStatus.error));
    }
  }
}
