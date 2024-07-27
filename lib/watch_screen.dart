import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings/liquid_loading.dart';
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart' as v1;
import 'package:wear_plus/wear_plus.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth > 400 || constrains.maxHeight > 400) {
        return const ActiveWatchFace();
      }
      return WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
          return AmbientMode(
            builder: (context, mode, child) {
              return mode == WearMode.ambient
                  ? const AmbientWatchFace()
                  : const ActiveWatchFace();
            },
          );
        },
      );
    });
  }
}

class AmbientWatchFace extends StatelessWidget {
  const AmbientWatchFace({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            height: 200,
            width: 180,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class ActiveWatchFace extends StatefulWidget {
  const ActiveWatchFace({super.key});

  @override
  State<ActiveWatchFace> createState() => _ActiveWatchFaceState();
}

class _ActiveWatchFaceState extends State<ActiveWatchFace>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  Size size = const Size(190, 190);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: FutureBuilder<List<Path>>(
                future: svgToPath(
                  size,
                ),
                builder: (context, data) {
                  if (!data.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return ClipPath(
                    clipper: FlutterLogoClipper(data.data!),
                    // clipBehavior: Clip.none,
                    child: CustomPaint(
                      foregroundPainter: FlutterLogoBorder(data.data!),
                      child: AnimatedBuilder(
                          animation: _animationController!,
                          builder: (context, widget) {
                            return LiquidLoading(
                              value: _animationController!.value,
                              // value: 0,
                              color: Colors.blue,
                              direction: Axis.vertical,
                            );
                          }),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class FlutterLogoBorder extends CustomPainter {
  List<Path> paths;
  FlutterLogoBorder(this.paths);
  @override
  Future<void> paint(Canvas canvas, Size size) async {
    final logoPath = (paths).fold<Path>(Path(), (Path acc, Path path) {
      return acc..addPath(path, Offset.zero);
    });
    canvas.drawPath(
        logoPath,
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class FlutterLogoClipper extends CustomClipper<Path> {
  List<Path> paths;
  FlutterLogoClipper(this.paths);
  @override
  Path getClip(Size size) {
    // Draw the basic shape.

    return paths.fold<Path>(Path(), (Path acc, Path path) {
      return acc..addPath(path, Offset.zero);
    });

    // final Path topBeam = Path()
    //   ..moveTo(37.7, 128.9)
    //   ..lineTo(9.8, 101.0)
    //   ..lineTo(100.4, 10.4)
    //   ..lineTo(156.2, 10.4)
    //   ..lineTo(37.7, 128.9);
    // final Path middleBeam = Path()
    //   ..moveTo(156.2, 94.0)
    //   ..lineTo(100.4, 94.0)
    //   // ..lineTo(78.5, 115.9)
    //   ..lineTo(53.5, 140.9)
    //   ..lineTo(79.5, 170.7)
    //   ..moveTo(107.3, 143.2)
    //   ..lineTo(156.2, 94.0);

    // final Path bottomBeam = Path()
    //   ..moveTo(79.5, 170.7)
    //   ..lineTo(100.4, 191.6)
    //   ..lineTo(156.2, 191.6)
    //   ..lineTo(107.4, 142.8);
    // // ..lineTo(79.5 + 1, 170.7 + 1);

    // final Path triangle = Path()
    //   ..moveTo(78.5, 115.9)
    //   ..lineTo(37.7 + 12, 128.9 + 12)
    //   ..lineTo(79.5, 170.7)
    //   ..lineTo(107.4, 142.8);
    // return topBeam
    //   ..addPath(middleBeam, Offset.zero)
    //   ..addPath(bottomBeam, Offset.zero);
    // ..addPath(triangle, Offset.zero);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

Future<List<Path>> svgToPath(Size size) async {
  String svg = await rootBundle.loadString('assets/flutter.svg');
  v1.VectorInstructions inst = v1.parse(svg,
      enableClippingOptimizer: false,
      enableMaskingOptimizer: false,
      enableOverdrawOptimizer: false);

  double multiplier = (size.width / 272).toDouble();
  // multiplier = 1;
  double xTransform = 0;
  double yTransform = 0;

  List<Path> paths = [];
  for (var e in inst.paths) {
    Path path = Path();
    for (var p in e.commands) {
      if (p is v1.MoveToCommand) {
        path.moveTo(transformx(p.x, multiplier, xTransform),
            transformy(p.y, multiplier, yTransform));
      }
      if (p is v1.LineToCommand) {
        path.lineTo(transformx(p.x, multiplier, xTransform),
            transformy(p.y, multiplier, yTransform));
      }
      if (p is v1.CubicToCommand) {
        path.cubicTo(
          transformx(p.x1, multiplier, xTransform),
          transformy(p.y1, multiplier, yTransform),
          transformx(p.x2, multiplier, xTransform),
          transformy(p.y2, multiplier, yTransform),
          transformx(p.x3, multiplier, xTransform),
          transformy(p.y3, multiplier, yTransform),
        );
      }
      if (p is v1.CloseCommand) {
        path.close();
      }
    }
    paths.add(path);
  }
  return paths;
}

double transformx(double x, double multiplier, double xTransform) {
  return x * multiplier + xTransform;
}

double transformy(double y, double multiplier, double yTransform) {
  return y * multiplier + yTransform;
}
