// import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
// import 'package:home_widget/home_widget.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(const HomePage());
}

const String url = "https://api.quotable.io/random";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String author = "";
  String quote = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _fetchQuote();
          },
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(title: const Text("Quotes")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  quote,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("- $author"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _fetchQuote() async {
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> data = jsonDecode(response.body);
    setState(() {
      quote = data["content"];
      author = data["author"];
    });
    updateAndroidWidget(quote, author);
  }

  void updateAndroidWidget(String quote, String author) {
    HomeWidget.saveWidgetData("quote", quote);
    HomeWidget.saveWidgetData("author", author);
    HomeWidget.updateWidget(
      androidName: "QuoteWidget",
    );
  }
}
