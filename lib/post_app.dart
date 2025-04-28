import 'package:clean_code_test/config/routes/app_routers.dart';
import 'package:flutter/material.dart';

import 'config/style/theme.dart';

class PostApp extends StatelessWidget {
  const PostApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.light,
      onGenerateRoute: RoutersGenerated.onGenerateRoute,
      initialRoute: Routers.INITIAL,
    );
  }
}
