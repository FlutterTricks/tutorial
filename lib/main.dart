import 'package:flutter/material.dart';
import 'package:settings/liquid_loading.dart';

void main() async {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double loadValue = 0;

  @override
  void initState() {
    // Progress dummy with Future.delayed
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        loadValue = 0.3;
      });
      Future.delayed(const Duration(seconds: 4), () {
        setState(() {
          loadValue = 0.8;
        });
      });
      Future.delayed(const Duration(seconds: 7), () {
        setState(() {
          loadValue = 1;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: LiquidLoading(
            loadDuration: const Duration(seconds: 2),
            loadUntil: loadValue,
          ),
        ),
      ),
    );
  }
}
