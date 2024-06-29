import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:upi_quick_qr/core/constants/strings.dart';
import 'package:upi_quick_qr/core/modal/qrcode.dart';
import 'package:upi_quick_qr/simple_bloc_observer.dart';

Future<void> initDependencies() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(QrCodeAdapter());
  await Hive.openBox<QrCode>(S.boxKey);
}
