import 'package:flutter/material.dart';
import 'package:movie_demo/core/models/movie.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/core/resource.dart';
import 'package:movie_demo/core/resource_type.dart';
import 'package:movie_demo/core/type/state_rerender_type.dart';
import 'package:movie_demo/ui/base/base_viewmodel.dart';
import 'package:movie_demo/ui/widgets/state_rerender_popup.dart';

class DetailMovieViewModel extends BaseViewModel {
  final int movieId;
  final MovieRepository movieRepository;

  DetailMovieViewModel({required this.movieId, required this.movieRepository});

  void onBackPressed() {
    Navigator.pop(context);
  }

  Future<Movie?> getDetailMovie() async {
    return await movieRepository.getDetailMovie(movieId).then(
      (Resource<Movie> response) {
        if (response.code == ResourceType.requestSuccess) {
          return response.data;
        } else {
          throw Exception(response.message);
        }
      },
    ).catchError((error) {
      showDialogCustom(
        child: StateRerenderPopup(
          stateRerenderType: StateRerenderType.errorState,
          message: error,
        ),
      );
      return null;
    });
  }
}
