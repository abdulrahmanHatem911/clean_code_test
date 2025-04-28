import 'package:clean_code_test/core/network/api/dio_helper.dart';
import 'package:clean_code_test/core/network/api/netowork_info.dart';
import 'package:clean_code_test/features/posts/data/datasources/post_local_data_source.dart';
import 'package:clean_code_test/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:clean_code_test/features/posts/data/repositories/post_repository_impl.dart';
import 'package:clean_code_test/features/posts/domain/repositories/posts_repository.dart';
import 'package:clean_code_test/features/posts/domain/usecases/get_all_posts.dart';
import 'package:clean_code_test/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

void initGetIt() async {
  // Register DioHelper as a singleton
  // Register NetworkHelper implementation
  getIt.registerLazySingleton<NetworkHelper>(() => DioHelper());

  // features
  // cubit
  getIt.registerFactory(() => PostsCubit(getAllPostsUseCase: getIt()));

  //Use case
  getIt.registerLazySingleton(() => GetAllPosts(postsRepository: getIt()));
  // repository
  getIt.registerLazySingleton<PostsRepository>(
    () => PostsRepositoryImpl(
      localDataSource: getIt(),
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );
  // data sources
  getIt.registerLazySingleton<PostsRemoteDataSource>(
    () => PostsRemoteDataSourceImpl(networkHelper: getIt()),
  );
  getIt.registerLazySingleton<PostsLocalDataSource>(
    () => PostsLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //core
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(internetConnectionChecker: getIt()),
  );
  getIt.registerLazySingleton(() => InternetConnectionChecker.createInstance());
  //external
  // getIt.registerLazySingleton<DioHelper>(() => DioHelper());
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
}
