import 'package:flutter/material.dart';
import 'package:settings/sizes.dart';

class Box extends StatelessWidget {
  const Box({Key? key, required this.center}) : super(key: key);

  final Offset center;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      height: Sizes.boxSize,
      width: Sizes.boxSize,
      left: center.dx,
      top: center.dy,
      child: Container(
        color: Colors.white,
      ),
      duration: const Duration(seconds: 1),
    );
  }
}
