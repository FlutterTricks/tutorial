import 'package:flutter/material.dart';
import 'package:settings/liquid_loading.dart';

void main() async {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: LiquidLoading(),
        ),
      ),
    );
  }
}
