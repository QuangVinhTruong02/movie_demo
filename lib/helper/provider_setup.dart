import 'package:movie_demo/core/remote/services/movie_service.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/core/retrofit.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...dependentRepositories,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Retrofit()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Retrofit, MovieService>(
    update: (context, retrofit, _) => MovieService(retrofit),
  )
];

List<SingleChildWidget> dependentRepositories = [
  ProxyProvider<MovieService, MovieRepository>(
    update: (context, movieService, _) => MovieRepository(movieService),
  )
];
