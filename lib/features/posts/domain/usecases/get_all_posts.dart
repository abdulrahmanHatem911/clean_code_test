import 'package:clean_code_test/core/usecases/usecase.dart';
import 'package:clean_code_test/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../config/error/failure.dart';
import '../entities/posts_entity.dart';

class GetAllPosts extends UseCase<List<Posts>, NoParams> {
  final PostsRepository postsRepository;
  GetAllPosts({required this.postsRepository});
  @override
  Future<Either<Failure, List<Posts>>> call(NoParams params) {
    return postsRepository.getAllPosts();
  }
}
