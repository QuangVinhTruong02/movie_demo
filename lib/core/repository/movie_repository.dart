import 'package:movie_demo/core/models/movie.dart';
import 'package:movie_demo/core/network_bound_resource.dart';
import 'package:movie_demo/core/remote/services/movie_service.dart';
import 'package:movie_demo/core/resource.dart';
import 'package:movie_demo/utils/app_const.dart';

class MovieRepository {
  final MovieService movieService;
  MovieRepository(this.movieService);

  Future<Resource<List<Movie>>> getTopRatedList(int page) async {
    return await NetworkBoundResource<List<Movie>, List<Movie>>(
      createSerializedCall: () async {
        return await movieService
            .getTopRatedList(AppConst.apiKey, page)
            .then((value) => value.items);
      },
    ).getAsFuture();
  }

  Future<Resource<List<Movie>>> getNowPlayingList(int page) async {
    return await NetworkBoundResource<List<Movie>, List<Movie>>(
      createSerializedCall: () async {
        return await movieService
            .getNowPlayingList(AppConst.apiKey, page)
            .then((value) => value.items);
      },
    ).getAsFuture();
  }

  Future<Resource<List<Movie>>> getPopularList(int page) async {
    return await NetworkBoundResource<List<Movie>, List<Movie>>(
      createSerializedCall: () async {
        return await movieService
            .getPopularList(AppConst.apiKey, page)
            .then((value) => value.items);
      },
    ).getAsFuture();
  }

  Future<Resource<List<Movie>>> getUpcomingList(int page) async {
    return await NetworkBoundResource<List<Movie>, List<Movie>>(
      createSerializedCall: () async {
        return await movieService
            .getUpcomingList(AppConst.apiKey, page)
            .then((value) => value.items);
      },
    ).getAsFuture();
  }
}
