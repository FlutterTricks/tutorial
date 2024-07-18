import 'dart:math';
import 'package:flutter/material.dart';

class LiquidLoading extends StatefulWidget {
  final Duration loadDuration;
  final Duration waveDuration;
  final Color waveColor;
  final double loadUntil;

  const LiquidLoading({
    Key? key,
    this.loadDuration = const Duration(seconds: 6),
    this.waveDuration = const Duration(seconds: 2),
    this.waveColor = Colors.blueAccent,
    this.loadUntil = 1.0,
  })  : assert(loadUntil >= 0 && loadUntil <= 1.0),
        super(key: key);

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
      begin: 0,
      end: widget.loadUntil,
    ).animate(_loadController);

    _loadValue.addStatusListener((status) {
      if (AnimationStatus.completed == status && _loadValue.value == 1) {
        _waveController.stop();
      }
      if (AnimationStatus.forward == status) {
        _waveController.repeat();
      }
    });

    _loadController.forward();
  }

  @override
  void didUpdateWidget(covariant LiquidLoading oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.loadUntil != widget.loadUntil) {
      _loadValue = Tween<double>(
        begin: _loadValue.value,
        end: widget.loadUntil,
      ).animate(_loadController);
      _loadController.reset();
      _loadController.forward();
    }
  }

  @override
  void dispose() {
    _waveController.dispose();
    _loadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: AnimatedBuilder(
        animation: Listenable.merge([_loadController, _waveController]),
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              SizedBox.expand(
                child: CustomPaint(
                  painter: _WavePainter(
                    waveValue: _waveController.value,
                    loadValue: _loadValue.value,
                    waveColor: widget.waveColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${(_loadValue.value * 100).toStringAsFixed(0)}%",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
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
    final width = size.width; //width of canvas
    final height = size.height; // height of canvas
    double baseHeight = height * loadValue; // height of progress
    final path = Path();

    path.moveTo(0.0, height);
    if (loadValue != 1) {
      for (var i = 0.0; i <= width; i++) {
        path.lineTo(
            i, height - baseHeight + sin(_pi2 * (i / width + waveValue)) * 8);
      }
    }

    path.lineTo(width, height);
    if (loadValue == 1) {
      path.lineTo(width, 0);
      path.lineTo(0, 0);
    }

    path.close();
    final wavePaint = Paint()..color = waveColor;
    canvas.drawPath(path, wavePaint);
  }

  @override
  bool shouldRepaint(_WavePainter oldDelegate) {
    return oldDelegate.waveValue != waveValue ||
        oldDelegate.loadValue != loadValue;
  }
}
