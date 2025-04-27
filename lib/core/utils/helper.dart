import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get topPadding => mediaQuery.padding.top;
  double get bottomPadding => mediaQuery.padding.bottom;
  double get leftPadding => mediaQuery.padding.left;
  double get rightPadding => mediaQuery.padding.right;
  double get textScaleFactor => mediaQuery.textScaleFactor;
  double get devicePixelRatio => mediaQuery.devicePixelRatio;
  Orientation get orientation => mediaQuery.orientation;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;
  bool get alwaysUse24HourFormat => mediaQuery.alwaysUse24HourFormat;
  Brightness get platformBrightness => mediaQuery.platformBrightness;
  bool get accessibleNavigation => mediaQuery.accessibleNavigation;
}

extension NavigatorHelper on BuildContext {
  Future<T?> push<T>(Widget page) async {
    return await Navigator.of(
      this,
    ).push<T>(CupertinoPageRoute(builder: (context) => page));
  }

  Future<T?> pushReplacement<T>(Widget page) async {
    return await Navigator.of(
      this,
    ).pushReplacement<T, T>(CupertinoPageRoute(builder: (context) => page));
  }

  Future<T?> pushAndRemoveUntil<T>(Widget page) async {
    return await Navigator.of(this).pushAndRemoveUntil<T>(
      CupertinoPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) async {
    return await Navigator.of(
      this,
    ).pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T>(
    String routeName, {
    Object? arguments,
  }) async {
    return await Navigator.of(
      this,
    ).pushReplacementNamed<T, T>(routeName, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName,
    routers, {
    Object? arguments,
  }) async {
    return await Navigator.of(this).pushNamedAndRemoveUntil<T>(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  void pop<T>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  void popUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  void popUntilPredicate(RoutePredicate predicate) {
    Navigator.of(this).popUntil(predicate);
  }

  void popAndPushNamed<T>(String routeName, {Object? arguments}) {
    Navigator.of(this).popAndPushNamed<T, T>(routeName, arguments: arguments);
  }
}

extension ThemeHelper on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primaryColor => Theme.of(this).primaryColor;
}

extension NumEx on int {
  Duration get hours => Duration(hours: this);
  Duration get day => Duration(days: this);
  Duration get minutes => Duration(minutes: this);
  Duration get seconds => Duration(seconds: this);
  Duration get milliseconds => Duration(milliseconds: this);
}

class MyObject {
  static BuildContext? _context;
  static void setContext(BuildContext context) {
    _context = context;
  }

  static BuildContext getContext() {
    return _context!;
  }
}

class Helper {
  // استخدام طريقة التفويض لترحيل الوظائف تدريجياً

  static String getLang(BuildContext context) {
    return Localizations.localeOf(context).languageCode;
  }

  // دوال واجهة المستخدم
  static bool isArabic(BuildContext context) {
    return Localizations.localeOf(context).languageCode == 'ar';
  }

  static Image imageFromBase64(String base64String) {
    final String cleanedBase64 = base64String.split(',').last;
    Uint8List bytes = base64Decode(cleanedBase64);
    return Image.memory(bytes, fit: BoxFit.cover);
  }

  static Color hexToColor(String hexCode) {
    hexCode = hexCode.replaceAll('#', '');
    if (hexCode.length == 6) {
      hexCode = 'FF$hexCode';
    }
    return Color(int.parse(hexCode, radix: 16));
  }
}
