import 'package:clean_code_test/config/error/failure.dart';
import 'package:clean_code_test/core/usecases/usecase.dart';
import 'package:clean_code_test/features/posts/domain/entities/posts_entity.dart';
import 'package:clean_code_test/features/posts/domain/usecases/get_all_posts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetAllPosts getAllPostsUseCase;

  PostsCubit({required this.getAllPostsUseCase}) : super(PostsInitial());

  static PostsCubit get(context) => BlocProvider.of(context);

  Future<void> getAllPosts() async {
    emit(PostsLoading());
    final result = await getAllPostsUseCase(NoParams());
    result.fold(
      (failure) => emit(PostsError(error: _getErrorMessage(failure))),
      (posts) => emit(PostsLoaded(posts: posts)),
    );
  }
}

String _getErrorMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Server Failure: Could not connect to the server';
    case CacheFailure:
      return 'Cache Failure: Could not retrieve cached data';
    default:
      return 'Unexpected Error: Something went wrong';
  }
}
