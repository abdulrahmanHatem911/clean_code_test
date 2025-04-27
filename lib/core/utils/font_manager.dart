import 'package:clean_code_test/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class FontManager {
  static String getFontFamily(
    BuildContext context, {
    FontWeight? fontWeight,
    bool isBold = false,
  }) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';

    if (isArabic) {
      if (fontWeight != null) {
        switch (fontWeight) {
          case FontWeight.w100:
          case FontWeight.w200:
          case FontWeight.w300:
            return AppStrings.cairoRegular;
          case FontWeight.w400:
            return AppStrings.cairoRegular;
          case FontWeight.w500:
            return AppStrings.cairoMedium;
          case FontWeight.w600:
            return AppStrings.cairoSemiBold;
          case FontWeight.w700:
          case FontWeight.w800:
          case FontWeight.w900:
            return AppStrings.cairoBold;
          default:
            return AppStrings.cairoRegular;
        }
      }
      return isBold ? AppStrings.cairoBold : AppStrings.cairoRegular;
    } else {
      if (fontWeight != null) {
        switch (fontWeight) {
          case FontWeight.w100:
          case FontWeight.w200:
          case FontWeight.w300:
            return AppStrings.poppinsRegular;
          case FontWeight.w400:
            return AppStrings.poppinsRegular;
          case FontWeight.w500:
            return AppStrings.poppinsMedium;
          case FontWeight.w600:
            return AppStrings.poppinsSemiBold;
          case FontWeight.w700:
          case FontWeight.w800:
          case FontWeight.w900:
            return AppStrings.poppinsBold;
          default:
            return AppStrings.poppinsRegular;
        }
      }
      return isBold ? AppStrings.poppinsBold : AppStrings.poppinsRegular;
    }
  }

  static TextStyle getTextStyle(
    BuildContext context, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    bool isBold = false,
    TextDecoration? decoration,
    double? letterSpacing,
    double? wordSpacing,
    bool useThemeColor = true,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return TextStyle(
      fontFamily: getFontFamily(
        context,
        fontWeight: fontWeight,
        isBold: isBold,
      ),
      fontSize: fontSize,
      fontWeight: fontWeight,
      color:
          useThemeColor
              ? (color ?? (isDark ? Colors.white : Colors.black))
              : color,
      decoration: decoration,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
    );
  }

  // Theme-aware text styles
  static TextStyle getTitleStyle(
    BuildContext context, {
    double? fontSize,
    Color? color,
    bool isBold = true,
    bool useThemeColor = true,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return getTextStyle(
      context,
      fontSize: fontSize ?? 20,
      fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
      color:
          useThemeColor
              ? (color ?? (isDark ? Colors.white : Colors.black))
              : color,
    );
  }

  static TextStyle getBodyStyle(
    BuildContext context, {
    double? fontSize,
    Color? color,
    bool isBold = false,
    bool useThemeColor = true,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return getTextStyle(
      context,
      fontSize: fontSize ?? 16,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color:
          useThemeColor
              ? (color ?? (isDark ? Colors.white : Colors.black))
              : color,
    );
  }

  static TextStyle getCaptionStyle(
    BuildContext context, {
    double? fontSize,
    Color? color,
    bool isBold = false,
    bool useThemeColor = true,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return getTextStyle(
      context,
      fontSize: fontSize ?? 14,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color:
          useThemeColor
              ? (color ?? (isDark ? Colors.white70 : Colors.black54))
              : color,
    );
  }

  // Special theme styles
  static TextStyle getPrimaryStyle(
    BuildContext context, {
    double? fontSize,
    bool isBold = false,
  }) {
    final theme = Theme.of(context);
    return getTextStyle(
      context,
      fontSize: fontSize ?? 16,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: theme.primaryColor,
      useThemeColor: false,
    );
  }

  static TextStyle getSecondaryStyle(
    BuildContext context, {
    double? fontSize,
    bool isBold = false,
  }) {
    final theme = Theme.of(context);
    return getTextStyle(
      context,
      fontSize: fontSize ?? 16,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: theme.colorScheme.secondary,
      useThemeColor: false,
    );
  }

  static TextStyle getErrorStyle(
    BuildContext context, {
    double? fontSize,
    bool isBold = false,
  }) {
    final theme = Theme.of(context);
    return getTextStyle(
      context,
      fontSize: fontSize ?? 16,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: theme.colorScheme.error,
      useThemeColor: false,
    );
  }
}
