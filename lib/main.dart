import 'package:bloc/bloc.dart';
import 'package:clean_code_test/config/style/app_color.dart';
import 'package:clean_code_test/core/network/remote/dio_helper.dart';
import 'package:clean_code_test/services/app_abserver.dart';
import 'package:clean_code_test/services/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'post_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Future.wait([CacheHelper.init(), DioHelper().init()]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColor.mainColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const PostApp());
}
