import 'package:flutter/material.dart';

import 'package:settings/box.dart';
import 'package:settings/sizes.dart';

class Numbers extends StatelessWidget {
  const Numbers({Key? key, required this.number}) : super(key: key);

  final int number;

  List<Box> get boxes0 => [
        for (int i = 0; i <= 2; i++)
          Box(
            center: Offset(Sizes.boxSize * 2 + (i * Sizes.boxSize), 0),
          ),
        Box(center: Offset(Sizes.boxSize, Sizes.boxSize)),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 4 + (i * Sizes.boxSize),
              Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize * 2,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 4.8 + (i * Sizes.boxSize),
              Sizes.boxSize * 2,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize * 2 + (1 * Sizes.boxSize),
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 4.8 + (i * Sizes.boxSize),
              Sizes.boxSize * 2 + (1 * Sizes.boxSize),
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize * 2 + (2 * Sizes.boxSize),
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 4.8 + (i * Sizes.boxSize),
              Sizes.boxSize * 2 + (2 * Sizes.boxSize),
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              Sizes.boxSize * 5,
            ),
          ),
        Box(center: Offset(Sizes.boxSize * 4.8, Sizes.boxSize * 5)),
        for (int i = 0; i <= 2; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2 + (i * Sizes.boxSize),
              40 - Sizes.boxSize,
            ),
          ),
      ];

  List<Box> get boxes1 => [
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2.8 + (i * Sizes.boxSize),
              0,
            ),
          ),
        Box(center: Offset(Sizes.boxSize * 2, Sizes.boxSize)),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2.8 + (i * Sizes.boxSize),
              1 * Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2.8 + (i * Sizes.boxSize),
              2 * Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2.8 + (i * Sizes.boxSize),
              3 * Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2.8 + (i * Sizes.boxSize),
              4 * Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2.8 + (i * Sizes.boxSize),
              5 * Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 5; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              Sizes.digitSize - Sizes.boxSize,
            ),
          ),
      ];

  List<Box> get boxes2 => [
        for (int i = 0; i <= 4; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              0,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(center: Offset((i * Sizes.boxSize), Sizes.boxSize)),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.digitSize - (2 * Sizes.boxSize) + (i * Sizes.boxSize),
              Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 2; i++)
          Box(
            center: Offset(
              Sizes.digitSize - (3 * Sizes.boxSize) + (i * Sizes.boxSize),
              Sizes.boxSize * 2,
            ),
          ),
        for (int i = 0; i <= 3; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2 + (i * Sizes.boxSize),
              Sizes.boxSize * 3,
            ),
          ),
        for (int i = 0; i <= 3; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              Sizes.boxSize * 4,
            ),
          ),
        for (int i = 0; i <= 2; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize * 5,
            ),
          ),
        for (int i = 0; i <= 6; i++)
          Box(
            center: Offset(
              0 + (i * Sizes.boxSize),
              Sizes.digitSize - Sizes.boxSize,
            ),
          ),
      ];

  List<Box> get boxes3 => [
        for (int i = 0; i <= 5; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              0,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
              center: Offset(
                  Sizes.boxSize * 4 + (i * Sizes.boxSize), Sizes.boxSize)),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.digitSize - (4 * Sizes.boxSize) + (i * Sizes.boxSize),
              Sizes.boxSize * 2,
            ),
          ),
        for (int i = 0; i <= 3; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2 + (i * Sizes.boxSize),
              Sizes.boxSize * 3,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.digitSize - (2 * Sizes.boxSize) + (i * Sizes.boxSize),
              Sizes.boxSize * 4,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              0 + (i * Sizes.boxSize),
              Sizes.digitSize - (2 * Sizes.boxSize),
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.digitSize - (2 * Sizes.boxSize) + (i * Sizes.boxSize),
              Sizes.boxSize * 5,
            ),
          ),
        for (int i = 0; i <= 4; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              Sizes.digitSize - Sizes.boxSize,
            ),
          ),
      ];

  List<Box> get boxes4 => [
        for (int i = 0; i <= 2; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 3 + (i * Sizes.boxSize),
              0,
            ),
          ),
        for (int i = 0; i <= 3; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2 + (i * Sizes.boxSize),
              Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              Sizes.boxSize * 2,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 4 + (i * Sizes.boxSize),
              Sizes.boxSize * 2,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              0 + (i * Sizes.boxSize),
              Sizes.boxSize * 3,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 4 + (i * Sizes.boxSize),
              Sizes.boxSize * 3,
            ),
          ),
        for (int i = 0; i <= 6; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              (4 * Sizes.boxSize),
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 4 + (i * Sizes.boxSize),
              Sizes.boxSize * 5,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 4 + (i * Sizes.boxSize),
              Sizes.boxSize * 6,
            ),
          ),
      ];

  List<Box> get boxes5 => [
        for (int i = 0; i <= 5; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              0,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 5; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize * 2,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 5 + (i * Sizes.boxSize),
              Sizes.boxSize * 3,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 5 + (i * Sizes.boxSize),
              Sizes.boxSize * 4,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize * 5,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 5 + (i * Sizes.boxSize),
              Sizes.boxSize * 5,
            ),
          ),
        for (int i = 0; i <= 4; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              (6 * Sizes.boxSize),
            ),
          ),
      ];

  List<Box> get boxes6 => [
        for (int i = 0; i <= 3; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2 + (i * Sizes.boxSize),
              0,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize * 2,
            ),
          ),
        for (int i = 0; i <= 5; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize * 3,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize * 4,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 5 + (i * Sizes.boxSize),
              Sizes.boxSize * 4,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize * 5,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 5 + (i * Sizes.boxSize),
              Sizes.boxSize * 5,
            ),
          ),
        for (int i = 0; i <= 4; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              (6 * Sizes.boxSize),
            ),
          ),
      ];

  List<Box> get boxes7 => [
        for (int i = 0; i <= 6; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              0,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 5 + (i * Sizes.boxSize),
              Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 4 + (i * Sizes.boxSize),
              Sizes.boxSize * 2,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 3 + (i * Sizes.boxSize),
              Sizes.boxSize * 3,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2 + (i * Sizes.boxSize),
              Sizes.boxSize * 4,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2 + (i * Sizes.boxSize),
              Sizes.boxSize * 5,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 2 + (i * Sizes.boxSize),
              Sizes.boxSize * 6,
            ),
          ),
      ];

  List<Box> get boxes8 => [
        for (int i = 0; i <= 3; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              0,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize,
            ),
          ),
        Box(center: Offset(Sizes.boxSize * 5, Sizes.boxSize)),
        for (int i = 0; i <= 2; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize * 2,
            ),
          ),
        Box(center: Offset(Sizes.boxSize * 5, Sizes.boxSize * 2)),
        for (int i = 0; i <= 3; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              Sizes.boxSize * 3,
            ),
          ),
        Box(center: Offset(0, Sizes.boxSize * 4)),
        for (int i = 0; i <= 3; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 3 + (i * Sizes.boxSize),
              Sizes.boxSize * 4,
            ),
          ),
        Box(center: Offset(0, Sizes.boxSize * 5)),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 5 + (i * Sizes.boxSize),
              Sizes.boxSize * 5,
            ),
          ),
        for (int i = 0; i <= 4; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              Sizes.boxSize * 6,
            ),
          ),
      ];

  List<Box> get boxes9 => [
        for (int i = 0; i <= 4; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              0,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 5 + (i * Sizes.boxSize),
              Sizes.boxSize,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              (i * Sizes.boxSize),
              Sizes.boxSize * 2,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 5 + (i * Sizes.boxSize),
              Sizes.boxSize * 2,
            ),
          ),
        for (int i = 0; i <= 5; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              Sizes.boxSize * 3,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 5 + (i * Sizes.boxSize),
              Sizes.boxSize * 4,
            ),
          ),
        for (int i = 0; i <= 1; i++)
          Box(
            center: Offset(
              Sizes.boxSize * 4 + (i * Sizes.boxSize),
              Sizes.boxSize * 5,
            ),
          ),
        for (int i = 0; i <= 3; i++)
          Box(
            center: Offset(
              Sizes.boxSize + (i * Sizes.boxSize),
              Sizes.boxSize * 6,
            ),
          ),
      ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (number == 0) ...boxes0,
        if (number == 1) ...boxes1,
        if (number == 2) ...boxes2,
        if (number == 3) ...boxes3,
        if (number == 4) ...boxes4,
        if (number == 5) ...boxes5,
        if (number == 6) ...boxes6,
        if (number == 7) ...boxes7,
        if (number == 8) ...boxes8,
        if (number == 9) ...boxes9,
      ],
    );
  }
}
