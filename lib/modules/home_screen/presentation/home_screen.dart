import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upi_qr_code/core/extensions/color_extension.dart';
import 'package:upi_qr_code/modules/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:upi_qr_code/modules/new_qr_code_screen/presentation/new_qr_screen.dart';
import 'package:upi_qr_code/modules/qr_code_scanner_screen/presentation/qr_code_scanner_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: context.read<HomeScreenCubit>().state.index,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {
        // pageController.animateToPage(state.index,
        //     duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: kToolbarHeight + 100,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  context.primaryContainer,
                  context.primary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
            ),
            centerTitle: true,
            title: const Text('UPI QR Code Generator'),
          ),
          drawer: const Drawer(),
          extendBody: true,
          bottomNavigationBar: DotNavigationBar(
            currentIndex: state.index,
            onTap: (int index) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
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
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                context.read<HomeScreenCubit>().setIndex(value);
              },
              children: [
                const QrCodeScannerScreen(),
                NewQrScreen(
                  upiId: state.upiId,
                  name: state.name,
                  amount: state.amount,
                ),
                const Placeholder(),
                Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
