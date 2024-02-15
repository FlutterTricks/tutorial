import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double dx = 0;
  List<Widget> cards = [];
  bool isStart = false;

  final double initialHeight = 0.2;
  final double dragHeight = 0.6;
  final double initialWidth = 0.02;
  final double dragWidth = 0.04;

  List<double> right = List.generate(10, (index) => -400);
  List<double> top = List.generate(10, (index) => -250);
  List<Color> colors = List.generate(
      10,
      (index) => Color.fromARGB(255, Random().nextInt(255),
          Random().nextInt(255), Random().nextInt(255)));
  int currentIndex = 0;
  Timer? ticker;
  @override
  initState() {
    super.initState();
    // cards = [
    //   AnimatedPositioned(
    //     duration: const Duration(milliseconds: 200),
    //     top: top[0],
    //     right: right[0],
    //     child: MyCard(
    //       // right: -250 + dx * 5,
    //       // top: MediaQuery.of(context).size.height * 0.30,
    //       right: right[0],
    //       top: top[0],
    //     ),
    //   )
    // ];
  }

  @override
  Widget build(BuildContext context) {
    cards = List.generate(
        10,
        (index) => AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
              top: top[index] +
                  (currentIndex != index ? dx / 200 : 0) +
                  (currentIndex == index
                      ? 0
                      : (currentIndex - index) > 0
                          ? (currentIndex - index) * 5
                          : 0),
              right: right[index] +
                  ((index != currentIndex) ? dx / 50 : 0) +
                  (((currentIndex - index) > 0)
                      ? ((currentIndex - index) * 30 - 200)
                      : 0),
              child: AnimatedRotation(
                turns: (currentIndex - index) > 0
                    ? ((index - currentIndex) / 200 -
                        (currentIndex == index ? 0 : (dx / 100000)))
                    : 0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                child: MyCard(
                  color: colors[index],
                ),
              ),
            ));
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanUpdate: (details) {
          setState(() {
            dx = size.width - details.localPosition.dx;
            // print(dx);
            right[currentIndex] += (dx / 100);
          });
        },
        onPanEnd: (details) {
          setState(() {
            dx = 0;
            // isStart = false;
            ticker = Timer(const Duration(seconds: 1), () {
              setState(() {
                isStart = false;
              });
            });
            right[currentIndex] = MediaQuery.of(context).size.width * 0.4;
            // cards.add(const MyCard());
            currentIndex++;
          });
        },
        onPanStart: (details) {
          setState(() {
            isStart = true;
            ticker?.cancel();

            top[currentIndex] = MediaQuery.of(context).size.height * 0.25;

            // cards.add(const MyCard());
          });
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              // top: MediaQuery.of(context).size.height * 0.4,
              // right: MediaQuery.of(context).size.width * 0.03 + 4,
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width *
                            (isStart ? dragWidth : initialWidth) +
                        3),
                child: AnimatedContainer(
                  margin: const EdgeInsets.all(0),
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(isStart ? 30 : 20),
                        bottomLeft: Radius.circular(isStart ? 30 : 20)),
                    border: Border.all(width: 0),
                    color: Colors.black,
                  ),
                  height: (MediaQuery.of(context).size.height *
                      (isStart ? dragHeight : initialHeight)),
                  width: (MediaQuery.of(context).size.width *
                      (isStart ? dragWidth : initialWidth)),
                ),
              ),
            ),
            // MyCard(
            //   right: -250 + dx * 5,
            //   top: MediaQuery.of(context).size.height * 0.30,
            // ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: cards,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: AnimatedContainer(
                    margin: const EdgeInsets.all(0),
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(isStart ? 30 : 20),
                          bottomRight: Radius.circular(isStart ? 30 : 20)),
                      border: Border.all(width: 0),
                      color: Colors.black,
                    ),
                    height: (MediaQuery.of(context).size.height *
                        (isStart ? dragHeight : initialHeight)),
                    width: (MediaQuery.of(context).size.width *
                        (isStart ? dragWidth : initialWidth)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: 350,
      child: Card(
        color: color,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
