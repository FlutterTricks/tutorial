import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upi_quick_qr/core/extensions/color_extension.dart';
import 'package:upi_quick_qr/modules/history_screen/presentation/history_screen.dart';
import 'package:upi_quick_qr/modules/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:upi_quick_qr/modules/new_qr_code_screen/presentation/new_qr_screen.dart';
import 'package:upi_quick_qr/modules/qr_code_scanner_screen/presentation/qr_code_scanner_screen.dart';
import 'package:upi_quick_qr/modules/settings_screen/presentation/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  bool isAnimating = false;

  @override
  void initState() {
    pageController = PageController(
      initialPage: context.read<HomeScreenCubit>().state.index,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {
        isAnimating = true;
        pageController
            .animateToPage(state.index,
                duration: const Duration(milliseconds: 500), curve: Curves.ease)
            .then((value) {
          isAnimating = false;
        });
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colorScheme.primaryFixedDim,
          appBar: AppBar(
            toolbarHeight: kToolbarHeight + 100,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.secondaryContainer,
                    context.colorScheme.primaryFixedDim,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            centerTitle: true,
            title: const Text('UPI QR Code Generator'),
          ),
          extendBody: true,
          bottomNavigationBar: DotNavigationBar(
            currentIndex: state.index,
            onTap: (int index) {
              if (!isAnimating) {
                context.read<HomeScreenCubit>().setIndex(index);
              }
            },
            dotIndicatorColor: Colors.black,
            enableFloatingNavBar: true,
            marginR: const EdgeInsets.only(bottom: 0, right: 40, left: 40),
            paddingR: const EdgeInsets.only(bottom: 5, top: 5),
            backgroundColor: context.primaryContainer,
            splashColor: Colors.transparent,
            // itemPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            items: [
              DotNavigationBarItem(
                icon: const Icon(Icons.qr_code_scanner),
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.qr_code),
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.history),
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          body: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                if (!isAnimating) {
                  context.read<HomeScreenCubit>().setIndex(value);
                }
              },
              children: [
                const QrCodeScannerScreen(),
                NewQrScreen(
                  upiId: state.upiId,
                  name: state.name,
                  amount: state.amount,
                ),
                const HistoryScreen(),
                const SettingsScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
