import 'package:movie_demo/core/network_bound_resource.dart';
import 'package:movie_demo/core/remote/response/search_youtube_response.dart';
import 'package:movie_demo/core/remote/services/youtube_service.dart';
import 'package:movie_demo/core/resource.dart';
import 'package:movie_demo/utils/app_const.dart';

class YoutubeRepository {
  final YoutubeService youtubeService;
  YoutubeRepository(this.youtubeService);

  Future<Resource<SearchYoutubeResponse>> searchYoutube({required String query}) async {
    return await NetworkBoundResource<SearchYoutubeResponse, SearchYoutubeResponse>(
      createSerializedCall: () => youtubeService.searchYoutube(
        AppConst.apiSearchYoutubeKey,
        query,
        AppConst.typeParam,
        AppConst.partParam,
      ),
    ).getAsFuture();
  }
}
