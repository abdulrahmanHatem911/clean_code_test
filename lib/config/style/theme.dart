import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: AppColor.mainColor,
      primaryColorLight: AppColor.mainColor,
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          return Colors.black;
        }),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: AppColor.white,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle:
            const TextTheme(
              titleLarge: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ).bodyMedium,
        titleTextStyle:
            const TextTheme(
              titleLarge: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ).titleLarge,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.mainColor.withOpacity(0.8),
        selectionHandleColor: AppColor.mainColor.withOpacity(0.8),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: AppColor.mainColor,
        ),
        suffixStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: AppColor.mainColor,
        ),
        prefixIconColor: Colors.black38,
        suffixIconColor: Colors.black38,
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[500]!),
        ),
        hintStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        labelStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      primaryColor: AppColor.mainColor,
      primaryColorLight: AppColor.mainColor,
      primaryColorDark: AppColor.secondaryColor,
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          return Colors.white;
        }),
      ),
      cardColor: Colors.grey[900],
      cardTheme: const CardTheme(color: Colors.grey),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black26,
        selectedItemColor: AppColor.mainColor,
        unselectedItemColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
        titleTextStyle:
            const TextTheme(
              titleMedium: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ).titleMedium,
        toolbarTextStyle:
            const TextTheme(
              titleMedium: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ).bodySmall,
      ),
      tooltipTheme: const TooltipThemeData(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColor.mainColor,
        selectionHandleColor: AppColor.mainColor,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColor.mainColor,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        colorScheme: const ColorScheme.dark(primary: AppColor.mainColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        suffixStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: AppColor.mainColor,
        ),
        prefixIconColor: Colors.amber.shade200,
        suffixIconColor: Colors.amber.shade200,
        fillColor: Colors.grey[900],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: Colors.white70,
        ),
        labelStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.mainColor,
        extendedTextStyle: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      textTheme: darkTextTheme,
    );
  }

  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade700,
    ),
    titleLarge: const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    titleMedium: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleSmall: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    displayLarge: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black45,
    ),
    displayMedium: const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      color: Colors.black45,
    ),
    displaySmall: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineLarge: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineMedium: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyMedium: const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade300,
    ),
    titleLarge: const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
    titleMedium: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleSmall: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displayLarge: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white70,
    ),
    displayMedium: const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      color: Colors.white70,
    ),
    displaySmall: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineLarge: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineMedium: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}
