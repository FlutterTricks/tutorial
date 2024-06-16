part of 'home_screen_bloc.dart';

@immutable
class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final List<Post> posts;

  HomeScreenLoaded({
    required this.posts,
  });
}

class HomeScreenError extends HomeScreenState {
  final String message;
  HomeScreenError({
    required this.message,
  });
}
