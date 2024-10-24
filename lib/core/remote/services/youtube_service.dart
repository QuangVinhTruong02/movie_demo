import 'package:dio/dio.dart';
import 'package:movie_demo/core/remote/response/search_youtube_response.dart';
import 'package:movie_demo/utils/app_const.dart';
import 'package:retrofit/retrofit.dart';
part 'youtube_service.g.dart';

@RestApi(baseUrl: AppConst.baseSearchYoutubeUrl)
abstract class YoutubeService {
  factory YoutubeService(Dio dio, {String baseUrl}) = _YoutubeService;

  @GET("/search")
  Future<SearchYoutubeResponse> searchYoutube(
    @Query("key") String searchYoutubeKey,
    @Query("q") String query,
    @Query("type") String type,
    @Query("part") String part,
  );
}
