import 'dart:convert';

import 'package:clean_code_test/core/network/api/logger.dart';
import 'package:dio/dio.dart';

class CustomApiInterceptor extends Interceptor {
  LoggerDebug log;
  CustomApiInterceptor(this.log);
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.red("\x1B[37m------ Current Error Response -----\x1B[0m");
    log.red("\x1B[31m${err.response?.data}\x1B[0m");
    log.red("\x1B[37m------ Current Error StatusCode -----\x1B[0m");
    log.red("\x1B[31m${err.response?.statusCode}\x1B[0m");
    return super.onError(err, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    log.green("------ Current Response ------");
    log.green(jsonEncode(response.data));
    log.blue("------ Current StatusCode ------", "Status Code");
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
