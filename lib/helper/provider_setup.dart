import 'package:movie_demo/core/remote/services/movie_service.dart';
import 'package:movie_demo/core/remote/services/youtube_service.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/core/repository/youtube_repository.dart';
import 'package:movie_demo/core/retrofit.dart';
import 'package:movie_demo/utils/app_shared.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...dependentRepositories,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: AppShared()),
  Provider.value(value: Retrofit()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Retrofit, MovieService>(
    update: (context, retrofit, _) => MovieService(retrofit),
  ),
  ProxyProvider<Retrofit, YoutubeService>(
    update: (context, retrofit, _) => YoutubeService(retrofit),
  )
];

List<SingleChildWidget> dependentRepositories = [
  ProxyProvider<MovieService, MovieRepository>(
    update: (context, movieService, _) => MovieRepository(movieService),
  ),
  ProxyProvider<YoutubeService, YoutubeRepository>(
    update: (context, youtubeServie, _) => YoutubeRepository(youtubeServie),
  )
];
