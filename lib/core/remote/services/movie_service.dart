import 'package:dio/dio.dart';
import 'package:movie_demo/core/models/page_response.dart';
import 'package:movie_demo/utils/app_const.dart';
import 'package:retrofit/retrofit.dart';
part 'movie_service.g.dart';

@RestApi(baseUrl: AppConst.baseUrl)
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  @GET("/movie/top_rated")
  Future<PageResponse> getTopRatedList(
    @Query(AppConst.apiKeyQuery) String apiKey,
    @Query("page") int page,
  );
  @GET("/movie/now_playing")
  Future<PageResponse> getNowPlayingList(
    @Query(AppConst.apiKeyQuery) String apiKey,
    @Query("page") int page,
  );
  @GET("/movie/popular")
  Future<PageResponse> getPopularList(
    @Query(AppConst.apiKeyQuery) String apiKey,
    @Query("page") int page,
  );
  @GET("/movie/upcoming")
  Future<PageResponse> getUpcomingList(
    @Query(AppConst.apiKeyQuery) String apiKey,
    @Query("page") int page,
  );

  @GET("/search/movie")
  Future<PageResponse> searchMovie(
    @Query(AppConst.apiKeyQuery) String apiKey,
    @Query("query") String query,
    @Query("page") int page,
  );
}
