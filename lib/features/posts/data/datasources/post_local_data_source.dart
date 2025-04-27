import 'dart:convert';

import 'package:clean_code_test/core/utils/app_strings.dart';
import 'package:clean_code_test/features/posts/data/models/posts_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostsLocalDataSource {
  Future<List<PostsModel>> getAllPosts();
  Future<PostsModel> getPostById(int id);

  Future<void> cachePosts(List<PostsModel> posts);
}

class PostsLocalDataSourceImpl implements PostsLocalDataSource {
  final SharedPreferences sharedPreferences;
  PostsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<List<PostsModel>> getAllPosts() {
    final List<dynamic>? postsToJson = sharedPreferences.getStringList(
      AppStrings.cachedPosts,
    );
    if (postsToJson != null) {
      return Future.value(
        postsToJson
            .map((item) => PostsModel.fromJson(json.decode(item)))
            .toList(),
      );
    } else {
      throw Exception('No cached posts found');
    }
  }

  @override
  Future<PostsModel> getPostById(int id) {
    final List<dynamic>? postsToJson = sharedPreferences.getStringList(
      AppStrings.cachedPosts,
    );
    if (postsToJson != null) {
      final post = postsToJson
          .map((item) => PostsModel.fromJson(json.decode(item)))
          .firstWhere((post) => post.id == id);
      return Future.value(post);
    } else {
      throw Exception('No cached posts found');
    }
  }

  @override
  Future<void> cachePosts(List<PostsModel> posts) {
    final List<String> postsToJson =
        posts.map((post) => json.encode(post.toJson())).toList();
    sharedPreferences.setStringList(AppStrings.cachedPosts, postsToJson);
    return Future.value();
  }
}
