import 'package:flutter/material.dart';
import 'dart:math' as math;

class WheelOfFortune extends StatelessWidget {
  const WheelOfFortune({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          child: Container(
            width: 300,
            child: const Arc(),
            decoration: const BoxDecoration(
              color: Colors.red,
              // shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class Arc extends StatelessWidget {
  const Arc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: ArcPainter(300));
  }
}

class ArcPainter extends CustomPainter {
  final int radius;

  ArcPainter(this.radius);
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = const Color(0xff63aa65)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;
    //draw arc
    // canvas.drawLine(const Offset(0, 0), Offset(0, radius.toDouble()), paint1);
    // canvas.drawLine(const Offset(0, 0), Offset(80, radius.toDouble()), paint1);

    Rect rect =
        Rect.fromCircle(center: const Offset(0, 0), radius: radius.toDouble());

    canvas.drawArc(rect, 0, math.pi, true, paint1);
    canvas.drawArc(rect, math.pi, math.pi, true, paint1..color = (Colors.red));

    // canvas.drawArc(
    //     Rect.fromCircle(center: Offset(0, 0), radius: radius.toDouble()),
    //     0, //radians
    //     2, //radians
    //     true,
    //     paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

class QuarterCirclePainter extends CustomPainter {
  const QuarterCirclePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final radius = 300.0;
    final offset = Offset(.0, .0);

    canvas.drawCircle(offset, radius, Paint()..color = Colors.green);
  }

  @override
  bool shouldRepaint(QuarterCirclePainter oldDelegate) {
    return true;
  }
}
