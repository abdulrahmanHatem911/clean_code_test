import 'package:equatable/equatable.dart';

class Posts extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String body;

  const Posts({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  @override
  List<Object?> get props => [id, title, body, userId];
}
