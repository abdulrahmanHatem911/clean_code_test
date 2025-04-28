import 'package:clean_code_test/config/error/exceptions.dart';
import 'package:clean_code_test/config/error/failure.dart';
import 'package:clean_code_test/core/network/api/netowork_info.dart';
import 'package:clean_code_test/features/posts/data/datasources/post_local_data_source.dart';
import 'package:clean_code_test/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:clean_code_test/features/posts/domain/entities/posts_entity.dart';
import 'package:clean_code_test/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDataSource remoteDataSource;
  final PostsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Posts>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getAllPosts();
        return Right(localPosts);
      } on CacheException {
        return Left(
          CacheFailure(
            message: 'No internet connection and no cached data available',
          ),
        );
      }
    }
  }
}
