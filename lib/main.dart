import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upi_qr_code/modules/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:upi_qr_code/modules/home_screen/presentation/home_screen.dart';
import 'package:upi_qr_code/simple_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

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
      //   const ColorScheme.light(
      //     primary: Colors.green,
      //   ),
      //   SystemUiOverlayStyle.dark,
      // ),
      // darkTheme: AppTheme.getTheme(
      //   context,
      //   const ColorScheme.dark(
      //     primary: Colors.green,
      //   ),
      //   SystemUiOverlayStyle.light,
      // ),
      home: BlocProvider<HomeScreenCubit>(
        create: (context) => HomeScreenCubit(),
        child: const HomeScreen(),
      ),
    );
  }
}
