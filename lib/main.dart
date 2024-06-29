import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:upi_quick_qr/core/theme/colors.dart';
import 'package:upi_quick_qr/core/theme/theme.dart';
import 'package:upi_quick_qr/di/di.dart';
import 'package:upi_quick_qr/modules/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:upi_quick_qr/modules/home_screen/presentation/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MediaStore.ensureInitialized();
  MediaStore.appFolder = "MediaStorePlugin";

  await initDependencies();
  runApp(const MyApp());
  //dart run build_runner watch --delete-conflicting-outputs
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPI QR Code Generator',
      // theme: AppTheme.getTheme(
      //   context,
      //   MaterialTheme.lightScheme(),
      //   SystemUiOverlayStyle.dark,
      // ),
      // darkTheme: AppTheme.getTheme(
      //   context,
      //   MaterialTheme.darkMediumContrastScheme(),
      //   SystemUiOverlayStyle.light,
      // ),
      // themeMode: ThemeMode.light,
      home: BlocProvider<HomeScreenCubit>(
        create: (context) => HomeScreenCubit(),
        child: const HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
