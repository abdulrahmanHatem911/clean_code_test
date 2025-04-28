import 'dart:io';

import 'package:dio/dio.dart';

/// فئة لإدارة الأخطاء والاستثناءات في التطبيق
class ErrorHandler {
  /// معالجة الأخطاء العامة وإرجاع رسالة خطأ مناسبة
  static String handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else if (error is SocketException) {
      return 'فشل الاتصال بالشبكة، يرجى التحقق من اتصال الإنترنت';
    } else if (error is FormatException) {
      return 'حدث خطأ في تنسيق البيانات';
    } else {
      return error.toString();
    }
  }

  /// معالجة أخطاء Dio عند الاتصال بالخادم
  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'انتهت مهلة الاتصال بالخادم';
      case DioExceptionType.sendTimeout:
        return 'انتهت مهلة إرسال البيانات';
      case DioExceptionType.receiveTimeout:
        return 'انتهت مهلة استقبال البيانات';
      case DioExceptionType.badResponse:
        return _handleDioResponseError(error);
      case DioExceptionType.cancel:
        return 'تم إلغاء الطلب';
      case DioExceptionType.connectionError:
        return 'فشل الاتصال، يرجى التحقق من اتصال الإنترنت';
      default:
        return 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى';
    }
  }

  /// معالجة أخطاء استجابة الخادم بناءً على رمز الحالة
  static String _handleDioResponseError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    if (data != null && data is Map && data.containsKey('Message')) {
      return data['Message'] as String;
    }

    switch (statusCode) {
      case 400:
        return 'طلب غير صالح';
      case 401:
        return 'غير مصرح بالوصول، يرجى تسجيل الدخول';
      case 403:
        return 'محظور الوصول إلى هذا المورد';
      case 404:
        return 'المورد المطلوب غير موجود';
      case 500:
        return 'خطأ في الخادم، يرجى المحاولة لاحقًا';
      default:
        return 'حدث خطأ (${statusCode ?? "Unknown"})';
    }
  }

  /// تسجيل الأخطاء للتحليل لاحقًا
  static void logError(String tag, dynamic error, [StackTrace? stackTrace]) {
    // هنا يمكن تسجيل الخطأ في خدمة تحليل الأخطاء مثل Firebase Crashlytics
    print('🚨 ERROR [$tag]: $error');
    if (stackTrace != null) {
      print('Stack trace: $stackTrace');
    }
  }
}
