import 'package:flutter/material.dart';

class INteractiveExample extends StatelessWidget {
  const INteractiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  height: 300,
                  width: 300,
                  child: InteractiveViewer(
                    child: const FlutterLogo(
                      size: 200,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  height: 300,
                  width: 300,
                  child: InteractiveViewer(
                    child: Image.network(
                        "https://images.unsplash.com/photo-1566008885218-90abf9200ddb?auto=format&fit=crop&q=80&w=1932&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  ),
                )
              ],
            ),
            const Text("Interactive Viewer"),
          ],
        ),
      )),
    );
  }
}

void test() {
  Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            height: 300,
            width: 300,
            child: InteractiveViewer(
              child: const FlutterLogo(
                size: 200,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            height: 300,
            width: 300,
            child: InteractiveViewer(
              child: Image.network(
                  "https://unsplash.com/photos/black-coupe-on-road-surrounded-with-trees-50cIn5ELxLo"),
            ),
          )
        ],
      ),
      const Text("Interactive Viewer"),
    ],
  );
}
