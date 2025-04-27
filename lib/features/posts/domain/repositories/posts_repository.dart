import 'package:clean_code_test/config/error/failure.dart';
import 'package:clean_code_test/features/posts/domain/entities/posts_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Posts>>> getAllPosts();
}
