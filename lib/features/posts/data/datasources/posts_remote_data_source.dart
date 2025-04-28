import 'package:clean_code_test/config/error/exceptions.dart';
import 'package:clean_code_test/core/network/api/api_constant.dart';
import 'package:clean_code_test/core/network/api/dio_helper.dart';
import 'package:clean_code_test/features/posts/data/models/posts_model.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostsModel>> getAllPosts();
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final NetworkHelper networkHelper;
  PostsRemoteDataSourceImpl({required this.networkHelper});
  @override
  Future<List<PostsModel>> getAllPosts() {
    return networkHelper
        .fetchData(url: ApiConstant.posts)
        .then((response) {
          if (response.statusCode == 200) {
            final List<dynamic> postsJson = response.data;
            return postsJson
                .map((post) => PostsModel.fromJson(post))
                .toList()
                .cast<PostsModel>();
          } else {
            throw ServerException(
              'Failed to load posts: ${response.statusCode}',
            );
          }
        })
        .catchError((error) {
          throw ServerException('Failed to load posts: ${error.toString()}');
        });
  }
}
