import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tricks/home_screen/bloc/home_screen_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          if (state is HomeScreenInitial) {
            return const Center(
              child: Text(
                'Please wait...',
              ),
            );
          } else if (state is HomeScreenLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeScreenLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(state.posts[index].title),
                    subtitle: Text(state.posts[index].body),
                  ),
                );
              },
            );
          } else if (state is HomeScreenError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
