import 'dart:convert';

import 'package:clean_code_test/core/network/api/dio_intercepter.dart';
import 'package:clean_code_test/core/utils/error_handler.dart';
import 'package:clean_code_test/core/utils/logger.dart';
import 'package:dio/dio.dart';

import 'api_constant.dart';

abstract class NetworkHelper {
  Future<Response> fetchData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  });

  Future<Response> postData({
    required String url,
    Map<String, dynamic> data,
    String? token,
    bool isList = false,
    List<dynamic>? dataList,
  });

  Future<Response> updateData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  });

  Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
    bool isList = false,
    List<dynamic>? dataList,
  });
}

class DioHelper implements NetworkHelper {
  static Dio? dio;
  static final LoggerDebug log = LoggerDebug(
    headColor: LogColors.red,
    constTitle: "Server Gate Logger",
  );

  DioHelper() {
    if (dio == null) {
      init();
    }
  }
  Future<void> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
        contentType: 'application/json',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );
    _addInterceptors(); // Enable interceptors for proper token handling
  }

  // أضف المعترضات للمعالجة العالمية للطلبات والاستجابات والأخطاء
  void _addInterceptors() {
    dio?.interceptors.clear(); // تنظيف أي معترضات سابقة

    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(
            options.copyWith(
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
              },
            ),
          );
        },
        onError: (error, handler) {
          // التعامل مع أخطاء المصادقة (401)
          if (error.response?.statusCode == 401) {
            // يمكن إضافة منطق لتحديث التوكن أو تسجيل الخروج
            ErrorHandler.logError(
              'DioHelper',
              'Unauthorized access: ${error.message}',
            );
          }
          return handler.next(error);
        },
      ),
    );
    dio?.interceptors.add(CustomApiInterceptor(log));
  }

  @override
  Future<Response> fetchData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    final options =
        token != null
            ? Options(headers: {'Authorization': 'Bearer $token'})
            : null;

    try {
      return await dio!.get(url, queryParameters: query, options: options);
    } catch (error) {
      ErrorHandler.logError('DioHelper.fetchData', error);
      rethrow;
    }
  }

  @override
  Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
    bool isList = false,
    List<dynamic>? dataList,
  }) async {
    log.white("🚀Request body: ${jsonEncode(data ?? dataList ?? {})}");
    final options =
        token != null
            ? Options(headers: {'Authorization': 'Bearer $token'})
            : null;

    try {
      return await dio!.post(
        url,
        data: isList == true ? dataList : data,
        options: options,
      );
    } catch (error) {
      ErrorHandler.logError('DioHelper.postData', error);
      rethrow;
    }
  }

  @override
  Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
    bool isList = false,
    List<dynamic>? dataList,
  }) async {
    final options =
        token != null
            ? Options(headers: {'Authorization': 'Bearer $token'})
            : null;

    try {
      return await dio!.delete(
        url,
        data: isList ? dataList : data,
        options: options,
      );
    } catch (error) {
      ErrorHandler.logError('DioHelper.deleteData', error);
      rethrow;
    }
  }

  @override
  Future<Response> updateData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) {
    final options =
        token != null
            ? Options(headers: {'Authorization': 'Bearer $token'})
            : null;

    try {
      return dio!.put(url, data: data, options: options);
    } catch (error) {
      ErrorHandler.logError('DioHelper.updateData', error);
      rethrow;
    }
  }
}
