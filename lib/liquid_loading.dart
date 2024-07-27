import 'dart:math' as math;

import 'package:flutter/material.dart';

class LiquidLoading extends StatefulWidget {
  final double? value;
  final Color color;
  final Axis direction;
  final double stopAtValue;

  const LiquidLoading({
    Key? key,
    required this.value,
    required this.color,
    required this.direction,
    this.stopAtValue = 1,
  }) : super(key: key);

  @override
  _LiquidLoadingState createState() => _LiquidLoadingState();
}

class _LiquidLoadingState extends State<LiquidLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
      builder: (context, child) {
        if (widget.stopAtValue == widget.value) {
          _animationController.stop();
        }
        return ClipPath(
          child: Container(
            color: widget.color,
          ),
          clipper: _WaveClipper(
            animationValue: _animationController.value,
            value: widget.value,
            stopValue: widget.stopAtValue,
            direction: widget.direction,
          ),
        );
      },
    );
  }
}

class _WaveClipper extends CustomClipper<Path> {
  final double animationValue;
  final double? value;
  final double stopValue;
  final Axis direction;

  _WaveClipper({
    required this.animationValue,
    required this.value,
    required this.stopValue,
    required this.direction,
  });

  @override
  Path getClip(Size size) {
    if (stopValue == value) {
      Path path = Path();
      path.lineTo(0.0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0.0);
      path.close();
      return path;
    }
    if (direction == Axis.horizontal) {
      Path path = Path()
        ..addPolygon(_generateHorizontalWavePath(size), false)
        ..lineTo(0.0, size.height)
        ..lineTo(0.0, 0.0)
        ..close();
      return path;
    }
    Path path = Path()
      ..addPolygon(_generateVerticalWavePath(size), false)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  List<Offset> _generateHorizontalWavePath(Size size) {
    final waveList = <Offset>[];
    for (int i = -2; i <= size.height.toInt() + 2; i++) {
      final waveHeight = (size.width / 20);
      final dx = math.sin((animationValue * 360 - i) % 360 * (math.pi / 180)) *
              waveHeight +
          (size.width * value!);
      waveList.add(Offset(dx, i.toDouble()));
    }
    return waveList;
  }

  List<Offset> _generateVerticalWavePath(Size size) {
    final waveList = <Offset>[];
    for (int i = -2; i <= size.width.toInt() + 2; i++) {
      final waveHeight = (size.height / 25);
      final dy = math.sin((animationValue * 360 - i) % 360 * (math.pi / 180)) *
              waveHeight +
          (size.height - (size.height * value!));
      waveList.add(Offset(i.toDouble(), dy));
    }
    return waveList;
  }

  @override
  bool shouldReclip(_WaveClipper oldClipper) => value != oldClipper.value;
}
