import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:movie_demo/utils/app_const.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class Retrofit extends DioForNative {
  Retrofit({
    String? baseUrl,
    BaseOptions? options,
  }) : super(options) {
    interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequestInterceptor,
        onError: _onErrorInterceptor,
      ),
    );
    if (baseUrl == AppConst.baseUrl) {
      final CacheOptions cacheOptions = CacheOptions(
        store: MemCacheStore(),
        policy: CachePolicy.request,
        hitCacheOnErrorExcept: [401, 403],
        maxStale: const Duration(days: 30),
        priority: CachePriority.high,
      );
      interceptors.add(DioCacheInterceptor(options: cacheOptions));
    }
  }

  void _onRequestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
    options.connectTimeout = const Duration(minutes: 1);
    options.receiveTimeout = const Duration(minutes: 1);
    handler.next(options);
  }

  void _onErrorInterceptor(DioException error, ErrorInterceptorHandler handler) async {
    return handler.next(error);
  }
}
