import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wear_plus/wear_plus.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wear OS App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const WatchFace(),
    );
  }
}

class WatchFace extends StatefulWidget {
  const WatchFace({super.key});

  @override
  _WatchFaceState createState() => _WatchFaceState();
}

class _WatchFaceState extends State<WatchFace> {
  String _timeString = "00:00:00";

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AmbientMode(
        builder: (context, mode, child) {
          if (mode == WearMode.ambient) {
            return const Center(
              child: FlutterLogo(
                size: 200.0,
              ),
            );
          } else {
            return Center(
              child: Text(
                _timeString,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
