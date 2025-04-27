import 'package:flutter/material.dart';

/// مدير مقاسات التطبيق المسؤول عن حساب الأبعاد المتوافقة مع مختلف الشاشات
/// تم تصميمه باستخدام نهج "النسبة والتناسب" مع مقاس تصميم أساسي
class ResponsiveManager {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;
  static late double textScaleFactor;

  // مقاسات التصميم الأساسي (الماكيت) بالبكسل
  static const double _designWidth = 390; // عرض التصميم الأساسي (iPhone 13 Pro)
  static const double _designHeight = 844; // ارتفاع التصميم الأساسي

  /// تهيئة مدير التوافقية مع الشاشات
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    textScaleFactor = _mediaQueryData.textScaleFactor;

    // حساب الحجم الافتراضي بناءً على الاتجاه
    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }

  /// تحويل قيمة العرض من التصميم إلى قيمة متوافقة مع جهاز المستخدم
  static double adaptiveWidth(double width) {
    double screenWidth = _mediaQueryData.size.width;
    // تحويل العرض بالتناسب مع عرض الشاشة الحالية
    return (width / _designWidth) * screenWidth;
  }

  /// تحويل قيمة الارتفاع من التصميم إلى قيمة متوافقة مع جهاز المستخدم
  static double adaptiveHeight(double height) {
    double screenHeight = _mediaQueryData.size.height;
    // تحويل الارتفاع بالتناسب مع ارتفاع الشاشة الحالية
    return (height / _designHeight) * screenHeight;
  }

  /// حساب حجم الخط المتوافق مع الشاشة
  static double adaptiveFontSize(double fontSize) {
    double scaleFactor = getScaleFactor();
    return fontSize * scaleFactor;
  }

  /// الحصول على عامل المقياس المناسب للجهاز
  static double getScaleFactor() {
    // اختيار أقل عامل مقياس بين العرض والارتفاع للحفاظ على النسب
    double widthScaleFactor = screenWidth / _designWidth;
    double heightScaleFactor = screenHeight / _designHeight;
    return widthScaleFactor < heightScaleFactor
        ? widthScaleFactor
        : heightScaleFactor;
  }

  /// تحديد التوافقية بناءً على نوع الجهاز
  static bool isMobile() => screenWidth < 600;
  static bool isTablet() => screenWidth >= 600 && screenWidth < 900;
  static bool isDesktop() => screenWidth >= 900;

  /// تحديد البادنج المناسب حسب نوع الجهاز
  static EdgeInsets getDevicePadding() {
    if (isMobile()) {
      return EdgeInsets.symmetric(horizontal: adaptiveWidth(16));
    } else if (isTablet()) {
      return EdgeInsets.symmetric(horizontal: adaptiveWidth(24));
    } else {
      return EdgeInsets.symmetric(horizontal: adaptiveWidth(32));
    }
  }
}
