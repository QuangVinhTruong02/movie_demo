import 'package:flutter/material.dart';
import 'package:movie_demo/core/models/movie.dart';
import 'package:movie_demo/core/remote/response/search_youtube_response.dart';
import 'package:movie_demo/core/remote/response/video_trailer_youtube_response.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/core/repository/youtube_repository.dart';
import 'package:movie_demo/core/resource.dart';
import 'package:movie_demo/core/resource_type.dart';
import 'package:movie_demo/helper/routers.dart';
import 'package:movie_demo/ui/base/base_viewmodel.dart';
import 'package:movie_demo/utils/app_const.dart';

class DetailMovieViewModel extends BaseViewModel {
  final int movieId;
  final MovieRepository movieRepository;
  final YoutubeRepository youtubeRepository;

  DetailMovieViewModel({
    required this.movieId,
    required this.movieRepository,
    required this.youtubeRepository,
  });

  void onBackPressed() {
    Navigator.pop(context);
  }

  Future<Movie?> getDetailMovie() async {
    return await movieRepository.getDetailMovie(movieId).then(
      (Resource<Movie> response) {
        if (response.code == ResourceType.requestSuccess) {
          return response.data;
        } else {
          throw response.message;
        }
      },
    ).catchError((error) {
      showDialogErorCustom(messsage: error);
      return null;
    });
  }

  Future<void> onPressedNavigateWatchTrailerPage() async {
    showDialogLoadingCustom();
    Movie? movie = await getDetailMovie();
    if (movie == null) return;

    await youtubeRepository.searchYoutube(query: "${movie.title} ${AppConst.trailer}").then(
      (Resource<SearchYoutubeResponse> response) {
        if (response.code == ResourceType.requestSuccess) {
          List<VideoTrailerYoutubeResponse>? videoTrailerYoutubeList =
              response.data?.videoTrailerYoutube;
          TrailerResponse? trailer = videoTrailerYoutubeList?.first.trailers;
          String? videoId = trailer?.videoId;
          if (videoId == null) {
            throw "Video Id is not exist";
          }
          dismissDialog();
          Navigator.pushNamed(context, Routers.watchTrailer, arguments: videoId);
        } else {
          throw response.message;
        }
      },
    ).catchError((error) {
      showDialogErorCustom(messsage: error);
    });
  }
}
