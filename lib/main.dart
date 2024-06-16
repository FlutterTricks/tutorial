import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tricks/home_screen/bloc/home_screen_bloc.dart';
import 'package:flutter_tricks/home_screen/home_screen.dart';
import 'package:flutter_tricks/home_screen/repository/post_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App!!',
      debugShowCheckedModeBanner: false,
      home: BlocProvider<HomeScreenBloc>(
        create: (context) => HomeScreenBloc(
          PostRepository(),
        )..add(
            FetchPosts(),
          ),
        child: const HomeScreen(),
      ),
    );
  }
}
