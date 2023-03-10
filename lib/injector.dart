import 'package:clean_arc/core/api/dio_service.dart';
import 'package:clean_arc/core/object_box.dart';
import 'package:clean_arc/utils/constant.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_objectbox_store/dio_cache_interceptor_objectbox_store.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

import 'core/api/endpoints.dart';

final locator = GetIt.instance;
Future<void> init() async {
  // /**
  //  * ! Features
  //  */
  // // Use Case
  // locator.registerLazySingleton(() => GetTopHeadlinesNews(newsRepository: locator()));
  // locator.registerLazySingleton(() => SearchTopHeadlinesNews(newsRepository: locator()));


  // // Repository
  // locator.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(newsRemoteDataSource: locator(), networkInfo: locator()));

  // // Data Source
  // locator.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourceImpl(dio: locator(), constantConfig: locator()));
  /**
   * ! Core
   */
  final baseOptions = BaseOptions(
    baseUrl: Endpoints.baseUrl,
    connectTimeout: Duration(milliseconds: connectionTimeout),
    receiveTimeout: Duration(milliseconds: receiveTimeout),
  );

  final path = (await getApplicationDocumentsDirectory()).path;

  final cacheOptions = CacheOptions(
    store: ObjectBoxCacheStore(storePath:path),
    policy: CachePolicy.noCache, // Bcz we force cache on-demand in repositories
    maxStale: const Duration(days: 30), // No of days cache is valid
    keyBuilder: (options) => options.path,
  );

  locator.registerLazySingleton<DioService>((){
    return DioService(client: Dio(baseOptions),globalCacheOptions: cacheOptions, interceptors: [
      ApiInterceptor(),
      DioCacheInterceptor(options: cacheOptions),
      if(kDebugMode) LogInterceptor(),
    ], cookieJar: PersistCookieJar(ignoreExpires: true,storage:FileStorage("$path/.cookies/")));
  });



  locator.registerLazySingletonAsync<ObjectBox>(() => ObjectBox.init());
}
