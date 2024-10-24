import 'package:flutter/material.dart';
import 'package:movie_demo/core/models/movie.dart';
import 'package:movie_demo/ui/detail_movie/components/detail_movie_backdrop_title.dart';
import 'package:movie_demo/ui/detail_movie/components/detail_movie_piece.dart';
import 'package:movie_demo/ui/detail_movie/components/detail_movie_poster.dart';
import 'package:movie_demo/ui/detail_movie/detail_movie_viewmodel.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/utils/app_colors.dart';
import 'package:movie_demo/utils/app_languages.dart';
import 'package:movie_demo/utils/date_time_util.dart';
import 'package:provider/provider.dart';

class DetailMovieBody extends StatelessWidget {
  const DetailMovieBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewModel = context.read<DetailMovieViewModel>();
    return FutureBuilder<Movie?>(
      future: viewModel.getDetailMovie(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        Movie? movie = snapshot.data;
        if (movie == null) {
          return Center(
            child: Text(
              AppLanguages.somethingWentWrong,
              style: AppTextstyle().getSemiBoldPoppinTextStyle(
                fontSize: 18,
                color: AppColors.red,
              ),
            ),
          );
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.4,
                width: size.width,
                child: Stack(
                  children: [
                    DetailMoviePoster(posterPath: movie.posterPath),
                    DetailMovieBackdropTitle(
                      backDropPath: movie.backdropPath,
                      titleMovie: movie.title,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              DetailMoviePiece(
                title: AppLanguages.genres,
                subTitle:
                    movie.genresList?.map((item) => item.name).join(", ") ?? AppLanguages.unknown,
              ),
              const SizedBox(height: 4),
              DetailMoviePiece(
                title: AppLanguages.runTime,
                subTitle: movie.runtime?.toString() ?? AppLanguages.unknown,
              ),
              const SizedBox(height: 4),
              DetailMoviePiece(
                title: AppLanguages.releaseDate,
                subTitle: movie.releaseDate != null
                    ? DateTimeUtil().convertDateTimeToString(dateTime: movie.releaseDate!)
                    : AppLanguages.unknown,
              ),
              const SizedBox(height: 4),
              DetailMoviePiece(
                title: AppLanguages.aboutMovie,
                subTitle: movie.overview ?? AppLanguages.unknown,
              ),
            ],
          ),
        );
      },
    );
  }
}
