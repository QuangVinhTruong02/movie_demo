import 'package:flutter/material.dart';
import 'package:movie_demo/core/models/movie.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/core/resource.dart';
import 'package:movie_demo/core/resource_type.dart';
import 'package:movie_demo/core/type/movie_type.dart';
import 'package:movie_demo/ui/base/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel {
  final MovieRepository movieRepository;
  HomeViewModel({required this.movieRepository});

  List<MovieType> movieTypeList = MovieType.values;
  List<Movie> topFiveRatedMovieList = [];
  List<Movie> movieList = [];
  int page = 1;
  MovieType _movieType = MovieType.nowPlaying;

  late TabController tabController;
  ScrollController scrollController = ScrollController();

  final BehaviorSubject<bool> _loadMoreSubject = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get loadMoreStream => _loadMoreSubject.stream;

  Future<void> onInit({required TabController controller}) async {
    tabController = controller;
    scrollController.addListener(_scrollListerner);
    await onTapMovieTypeChannge(0);
  }

  Future<void> onTapMovieTypeChannge(int index) async {
    movieList.clear();
    page = 1;
    setLoading(true);
    _movieType = MovieType.values.elementAt(index);
    await fetchMovieList(movieType: _movieType);
    setLoading(false);
  }

  Future<void> fetchTopFiveRated() async {
    await movieRepository.getTopRatedList(page).then(
      (response) {
        if (response.code == ResourceType.requestSuccess) {
          topFiveRatedMovieList = response.data?.take(5).toList() ?? [];
        }
      },
    ).catchError((error) {});
  }

  Future<void> fetchMovieList({required MovieType movieType, bool isLoadMore = false}) async {
    Resource<List<Movie>>? response;
    switch (movieType) {
      case MovieType.upcomming:
        response = await movieRepository.getUpcomingList(page);
        break;
      case MovieType.topRated:
        response = await movieRepository.getTopRatedList(page);
        break;
      case MovieType.popular:
        response = await movieRepository.getPopularList(page);
        break;
      case MovieType.nowPlaying:
        response = await movieRepository.getNowPlayingList(page);
        break;
    }
    if (response.code == ResourceType.requestSuccess) {
      if (isLoadMore) {
        movieList.addAll(response.data ?? []);
        _stopLoadMore(movieList.length);
      } else {
        movieList = response.data ?? [];
      }
    }
  }

  void _stopLoadMore(int dataLength) {
    if (dataLength < 20) {
      _loadMoreSubject.add(false);
      scrollController.removeListener(_scrollListerner);
    }
  }

  void _scrollListerner() async {
    if (loadingSubject.value) return;
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      _loadMoreSubject.add(true);
      page++;
      await fetchMovieList(movieType: _movieType, isLoadMore: true);
      _loadMoreSubject.add(false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    scrollController.dispose();
    _loadMoreSubject.close();
  }
}
