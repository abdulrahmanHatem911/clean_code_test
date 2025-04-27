class ApiConstant {
  //https://jsonplaceholder.typicode.com/posts
  ApiConstant._();
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
  static const String posts = "/posts";
  static const String comments = "/comments";
  static const String albums = "/albums";
  static const String photos = "/photos";
  static const String todos = "/todos";
  static const String users = "/users";
  static const String postsComments = "/posts/{postId}/comments";
  static const String postsAlbums = "/posts/{postId}/albums";
  static const String postsPhotos = "/posts/{postId}/photos";
}
