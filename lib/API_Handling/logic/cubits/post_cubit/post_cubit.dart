import 'package:bloc_mastered/API_Handling/data/models/post_model.dart';
import 'package:bloc_mastered/API_Handling/data/repositories/post_repositories.dart';
import 'package:bloc_mastered/API_Handling/logic/cubits/post_cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }
  PostRepository postRepository = PostRepository();

  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    } catch (exception) {
      emit(PostErrorState(exception.toString()));
    }
  }
}
