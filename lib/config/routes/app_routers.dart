// ignore_for_file: constant_identifier_names

import 'package:clean_code_test/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:clean_code_test/features/posts/presentation/screens/all_posts_screen.dart';
import 'package:clean_code_test/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routers {
  static const String INITIAL = '/';
}

class RoutersGenerated {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.INITIAL:
        return _buildPageRouteRight(
          child: BlocProvider(
            create: (context) => getIt<PostsCubit>(),
            child: AllPostsScreen(),
          ),
          settings: settings,
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('الصفحة غير موجودة')),
          body: const Center(child: Text('الصفحة غير موجودة')),
        );
      },
    );
  }

  static Route _buildPageRouteRight({
    required Widget child,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) => child,
      transitionDuration: const Duration(
        milliseconds: 500,
      ), // Slower transition
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.decelerate, // Smoother curve
            ),
          ),
          child: child,
        );
      },
    );
  }

  static Route _buildPageRouteLeft({
    required Widget child,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) => child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInCubic),
          ),
          child: child,
        );
      },
    );
  }

  static Route _buildPageRouteUp({
    required Widget child,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) => child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInToLinear),
          ),
          child: child,
        );
      },
    );
  }
}
