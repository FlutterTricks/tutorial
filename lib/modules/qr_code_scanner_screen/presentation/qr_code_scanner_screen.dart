import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:upi_quick_qr/core/extensions/extensions.dart';
import 'package:upi_quick_qr/modules/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:upi_quick_qr/modules/qr_code_scanner_screen/presentation/qr_code_overlay.dart';

class QrCodeScannerScreen extends StatefulWidget {
  const QrCodeScannerScreen({super.key});

  @override
  State<QrCodeScannerScreen> createState() => _QrCodeScannerScreenState();
}

class _QrCodeScannerScreenState extends State<QrCodeScannerScreen>
    with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
    returnImage: true,
  );

  ValueNotifier<Uint8List?> lastImage = ValueNotifier(null);

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      // await controller.stop();
      // await controller.dispose();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!controller.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        unawaited(controller.stop());
        return;
      case AppLifecycleState.resumed:
        unawaited(controller.start());
        return;
      case AppLifecycleState.inactive:
        unawaited(controller.stop());
        return;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    await controller.stop();
    await controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Permission.camera.request(),
          builder: (context, data) {
            if (data.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (data.data!.isDenied || data.data!.isPermanentlyDenied) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Lottie.asset(
                        'assets/lottie.json',
                        width: MediaQuery.sizeOf(context).width,
                        // height: MediaQuery.sizeOf(context).width * 0.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Camera permission denied',
                      style: context.titleMedium,
                    ),
                    // const SizedBox(height: 10),
                    Text(
                      'Camera permission is required to scan QR codes',
                      style: context.bodyLarge,
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () async {
                        if (await Permission.camera.isPermanentlyDenied) {
                          await openAppSettings().then(
                            (value) => setState(() {}),
                          );
                        } else {
                          Permission.camera
                              .request()
                              .then((value) => setState(() {}));
                        }
                      },
                      child: Text(
                        data.data!.isPermanentlyDenied
                            ? 'Open App Settings'
                            : 'Allow Camera Permission',
                      ),
                    ),
                  ],
                ),
              );
            }
            if (data.data!.isGranted) {
              return Stack(
                children: [
                  ValueListenableBuilder(
                    valueListenable: lastImage,
                    builder: (context, value, child) {
                      if (value != null) {
                        return Image.memory(value);
                      } else {
                        return Container();
                      }
                    },
                  ),
                  MobileScanner(
                    controller: controller,
                    onDetect: (barcodes) async {
                      if (barcodes.barcodes.isNotEmpty) {
                        lastImage.value = barcodes.image;
                        controller.stop();
                        await context
                            .read<HomeScreenCubit>()
                            .scanQr(context, barcodes.barcodes[0]);
                        await controller.start();
                      }
                    },
                    scanWindow: Rect.largest,
                    errorBuilder: (context, error, child) {
                      return Text(error.toString());
                    },
                    placeholderBuilder: (p0, p1) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    overlayBuilder: (context, constraints) {
                      return Container(
                        decoration: ShapeDecoration(
                          shape: QrScannerOverlayShape(
                            borderColor: context.primary,
                            borderRadius: 10,
                            borderLength: 30,
                            borderWidth: 10,
                            cutOutSize: MediaQuery.of(context).size.width * 0.8,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            } else {
              return const Placeholder();
            }
          }),
    );
  }
}




// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:upi_qr_code/core/extensions/color_extension.dart';
// import 'package:upi_qr_code/modules/home_screen/presentation/cubit/home_screen_cubit.dart';

// class QrCodeScannerScreen extends StatefulWidget {
//   const QrCodeScannerScreen({super.key});

//   @override
//   State<QrCodeScannerScreen> createState() => _QrCodeScannerScreenState();
// }

// class _QrCodeScannerScreenState extends State<QrCodeScannerScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? controller;

//   @override
//   void initState() {
//     super.initState();
//   }

//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller!.resumeCamera();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 8,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//               formatsAllowed: const [BarcodeFormat.qrcode],
//               overlay: QrScannerOverlayShape(
//                 borderColor: context.primary,
//                 borderRadius: 10,
//                 borderLength: 30,
//                 borderWidth: 10,
//                 cutOutSize: MediaQuery.of(context).size.width * 0.8,
//               ),
//             ),
//           ),
//           // Expanded(
//           //   flex: 1,
//           //   child: Center(
//           //     child: Container(),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) async {
//       controller.pauseCamera();
//       await context
//           .read<HomeScreenCubit>()
//           .scanQr(context, scanData, controller);
//       controller.resumeCamera();
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }