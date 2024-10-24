import 'package:flutter/material.dart';
import 'package:movie_demo/core/models/movie.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/core/resource.dart';
import 'package:movie_demo/core/resource_type.dart';
import 'package:movie_demo/helper/routers.dart';
import 'package:movie_demo/ui/base/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class SearchViewmodel extends BaseViewModel {
  MovieRepository movieRepository;
  SearchViewmodel({required this.movieRepository});

  TextEditingController searchEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<Movie> movieList = [];
  int page = 1;
  bool hasSearchFromUser = false;

  final BehaviorSubject<bool> _loadMoreSubject = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get loadMoreStream => _loadMoreSubject.stream;

  Future<void> onInit() async {
    setLoading(true);
    await fetchPopularMovie();
    scrollController.addListener(_scrollListerner);
    setLoading(false);
  }

  Future<void> fetchPopularMovie() async {
    await movieRepository.getPopularList(1).then((Resource<List<Movie>> response) {
      if (response.code == ResourceType.requestSuccess) {
        movieList = response.data ?? [];
      } else {
        throw response.message;
      }
    }).catchError((error) {
      showDialogErorCustom(messsage: error);
    });
  }

  Future<void> fetchMovieFromResult() async {
    if (_loadMoreSubject.value) return;
    _loadMoreSubject.add(true);
    String query = searchEditingController.text.trim();
    await movieRepository.searchMovie(query, page).then(((Resource<List<Movie>> response) {
      if (response.code == ResourceType.requestSuccess) {
        if (page == 1) {
          movieList = response.data ?? [];
          return;
        }
        movieList.addAll(response.data ?? []);
        _stopLoadMore(response.data?.length ?? 0);
      } else {
        throw response.message;
      }
    })).catchError((error) {
      showDialogErorCustom(messsage: error);
    }).whenComplete(
      () {
        _loadMoreSubject.add(false);
      },
    );
  }

  void onPressedNavigateDetailMoviePage(int movieId) {
    Navigator.pushNamed(context, Routers.detailMovie, arguments: movieId);
  }

  Future<void> onSearchPressed() async {
    setLoading(true);
    page = 1;
    hasSearchFromUser = true;
    if (!scrollController.hasListeners) {
      scrollController.addListener(_scrollListerner);
    }
    await fetchMovieFromResult();
    setLoading(false);
  }

  void _scrollListerner() {
    if (loadingSubject.value || hasSearchFromUser == false) return;
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      page++;
      fetchMovieFromResult();
    }
  }

  void _stopLoadMore(int dataLength) {
    if (dataLength < 20) {
      if (scrollController.hasListeners) {
        scrollController.removeListener(_scrollListerner);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _loadMoreSubject.close();
    searchEditingController.dispose();
    scrollController.dispose();
  }
}
