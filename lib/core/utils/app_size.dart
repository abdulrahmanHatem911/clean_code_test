import 'package:flutter/material.dart';

class AppSize {
  // Design reference size (based on common design canvas)
  static const double _designWidth = 375.0;
  static const double _designHeight = 812.0;

  // Default scale factors
  static double _widthScaleFactor = 1.0;
  static double _heightScaleFactor = 1.0;

  // Initialize with screen dimensions
  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;

    _widthScaleFactor = width / _designWidth;
    _heightScaleFactor = height / _designHeight;
  }

  // Helper methods for responsive sizing
  static double w(double width) => width * _widthScaleFactor;
  static double h(double height) => height * _heightScaleFactor;

  // Horizontal spacing (responsive)
  static SizedBox horizontalSpace(double width) => SizedBox(width: w(width));
  static SizedBox verticalSpace(double height) => SizedBox(height: h(height));
  // Responsive versions to use after initialization
  static SizedBox get rsh_3 => horizontalSpace(3.0);
  static SizedBox get rsh_5 => horizontalSpace(5.0);
  static SizedBox get rsh_10 => horizontalSpace(10.0);
  static SizedBox get rsh_15 => horizontalSpace(15.0);
  static SizedBox get rsh_20 => horizontalSpace(20.0);
  static SizedBox get rsh_30 => horizontalSpace(30.0);
  static SizedBox get rsh_40 => horizontalSpace(40.0);
  static SizedBox get rsh_50 => horizontalSpace(50.0);
  static SizedBox get rsh_60 => horizontalSpace(60.0);
  static SizedBox get rsh_70 => horizontalSpace(70.0);
  static SizedBox get rsh_80 => horizontalSpace(80.0);

  // Responsive vertical spaces
  static SizedBox get rsv_3 => verticalSpace(3.0);
  static SizedBox get rsv_5 => verticalSpace(5.0);
  static SizedBox get rsv_10 => verticalSpace(10.0);
  static SizedBox get rsv_15 => verticalSpace(15.0);
  static SizedBox get rsv_20 => verticalSpace(20.0);
  static SizedBox get rsv_25 => verticalSpace(25.0);
  static SizedBox get rsv_30 => verticalSpace(30.0);
  static SizedBox get rsv_40 => verticalSpace(40.0);
  static SizedBox get rsv_50 => verticalSpace(50.0);
  static SizedBox get rsv_60 => verticalSpace(60.0);
  static SizedBox get rsv_70 => verticalSpace(70.0);
  static SizedBox get rsv_80 => verticalSpace(80.0);
}
