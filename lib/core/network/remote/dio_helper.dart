import 'dart:convert';

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
          return handler.next(options);
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

    // معترض تسجيل الطلبات والاستجابات
    //🚨
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

class CustomApiInterceptor extends Interceptor {
  LoggerDebug log;
  CustomApiInterceptor(this.log);
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.red("\x1B[37m------ Current Error Response -----\x1B[0m");
    log.red("\x1B[31m${err.response?.data}\x1B[0m");
    log.red("\x1B[37m------ Current Error StatusCode -----\x1B[0m");
    log.red("\x1B[31m${err.response?.statusCode}\x1B[0m");

    // push(NamedRoutes.i.sign_in);
    // showErrorDialogue("not find");
    return super.onError(err, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    log.green("------ Current Response ------");
    log.green(jsonEncode(response.data));
    log.green("------ Current StatusCode ------");
    log.green(jsonEncode(response.statusCode));
    return super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.cyan("------ Current Request Parameters Data -----");
    log.cyan("${options.queryParameters}");
    log.yellow("------ Current Request Headers -----");
    log.yellow("${options.headers}");
    log.green("------ Current Request Path -----");
    log.green(
      "${options.path} ${LogColors.red}API METHOD : (${options.method})${LogColors.reset}",
    );
    return super.onRequest(options, handler);
  }
}
