import 'package:clean_code_test/core/network/remote/dio_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

void initGetIt() async {
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
}
