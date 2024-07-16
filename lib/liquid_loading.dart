import 'dart:math';
import 'package:flutter/material.dart';

class LiquidLoading extends StatefulWidget {
  final Duration loadDuration;
  final Duration waveDuration;
  final double boxHeight;
  final double boxWidth;
  final Color boxBackgroundColor;
  final Color waveColor;

  /// Specifies the load limit: (0, 1.0].  This may be used to limit the liquid
  /// fill effect to less than 100%.
  ///
  /// By default, the animation will load to 1.0 (100%).
  final double loadUntil;

  const LiquidLoading({
    Key? key,
    this.loadDuration = const Duration(seconds: 6),
    this.waveDuration = const Duration(seconds: 2),
    this.boxHeight = 250,
    this.boxWidth = 400,
    this.boxBackgroundColor = Colors.black,
    this.waveColor = Colors.blueAccent,
    this.loadUntil = 1.0,
  })  : assert(loadUntil > 0 && loadUntil <= 1.0),
        super(key: key);

  /// Creates the mutable state for this widget. See [StatefulWidget.createState].
  @override
  _LiquidLoadingState createState() => _LiquidLoadingState();
}

class _LiquidLoadingState extends State<LiquidLoading>
    with TickerProviderStateMixin {
  late AnimationController _waveController, _loadController;

  late Animation<double> _loadValue;

  @override
  void initState() {
    super.initState();

    _waveController = AnimationController(
      vsync: this,
      duration: widget.waveDuration,
    );

    _loadController = AnimationController(
      vsync: this,
      duration: widget.loadDuration,
    );
    _loadValue = Tween<double>(
      begin: 0.0,
      end: 10,
    ).animate(_loadController);
    if (1.0 == widget.loadUntil) {
      _loadValue.addStatusListener((status) {
        if (AnimationStatus.completed == status) {
          // Stop the repeating wave when the load has completed to 100%
          _waveController.stop();
        }
      });
    }

    _waveController.repeat();
    _loadController.forward();
  }

  @override
  void dispose() {
    _waveController.dispose();
    _loadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.boxHeight,
      width: widget.boxWidth,
      child: AnimatedBuilder(
        animation: _waveController,
        builder: (BuildContext context, Widget? child) {
          return CustomPaint(
            painter: _WavePainter(
              waveValue: _waveController.value,
              loadValue: _loadValue.value,
              waveColor: widget.waveColor,
            ),
          );
        },
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  static const _pi2 = 2 * pi;
  final double waveValue;
  final double loadValue;
  final Color waveColor;

  _WavePainter({
    required this.waveValue,
    required this.loadValue,
    required this.waveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double baseHeight = -10 * loadValue;
    final width = size.width;
    final height = size.height;
    final path = Path();
    path.moveTo(0.0, 0);
    for (var i = 0.0; i < width; i++) {
      path.lineTo(i, baseHeight + sin(_pi2 * (i / width + waveValue)) * 8);
    }

    path.lineTo(width, height);
    path.lineTo(0.0, height);
    path.close();
    final wavePaint = Paint()..color = waveColor;
    canvas.drawPath(path, wavePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
