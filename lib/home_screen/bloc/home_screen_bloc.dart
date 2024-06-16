import 'package:bloc/bloc.dart';
import 'package:flutter_tricks/home_screen/model/post.dart';
import 'package:flutter_tricks/home_screen/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final PostRepository _repository;
  HomeScreenBloc(this._repository) : super(HomeScreenInitial()) {
    on<FetchPosts>((event, emit) async {
      try {
        emit(HomeScreenLoading());
        List<Post> data = await _repository.fetchPosts();
        emit(HomeScreenLoaded(posts: data));
        // emit(HomeScreenError(message: "Something Went Wrong..."));
      } catch (e) {
        print(e);
        emit(HomeScreenError(message: "Something Went Wrong..."));
      }
    });
  }
}
