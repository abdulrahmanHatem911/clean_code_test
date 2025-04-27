import 'package:flutter/material.dart';

import 'config/style/theme.dart';
import 'features/posts/presentation/screens/all_posts_screen.dart';

class PostApp extends StatelessWidget {
  const PostApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.light,
      home: AllPostsScreen(),
    );
  }
}
