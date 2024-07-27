import 'package:flutter/material.dart';
import 'package:settings/watch_screen.dart';

void main() async {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WatchScreen();
  }
}
