import 'package:clean_code_test/features/posts/domain/entities/posts_entity.dart';

class PostsModel extends Posts {
  const PostsModel({
    required super.id,
    required super.title,
    required super.body,
    required super.userId,
  });
  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body, 'userId': userId};
  }
}
