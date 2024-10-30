import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_demo/core/models/movie.dart';
import 'package:movie_demo/helper/root_image.dart';
import 'package:movie_demo/ui/home/components/home_image_view.dart';
import 'package:movie_demo/ui/home/home_viewmodel.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/utils/app_colors.dart';
import 'package:movie_demo/utils/app_languages.dart';
import 'package:provider/provider.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return FutureBuilder<void>(
        future: viewModel.fetchTopFiveRated(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Movie> movieList = viewModel.topFiveRatedMovieList;
          if (movieList.isEmpty) {
            return Column(
              children: [
                const SizedBox(height: 4),
                Text(
                  AppLanguages.somethingWentWrong.tr(),
                  style: AppTextstyle().getMediumPoppinTextStyle(context: context, fontSize: 20),
                ),
              ],
            );
          }
          return CarouselSlider.builder(
            itemCount: movieList.length,
            itemBuilder: (context, index, realIndex) {
              Movie movie = movieList[index];
              return HomeImageView(
                imageUrl: movie.backdropPath.isNotEmpty
                    ? RootImage().getBackDropPath(movie.backdropPath)
                    : movie.backdropPath,
                titleOnImg: movie.title,
                textStyle: AppTextstyle().getSemiBoldPoppinTextStyle(
                  context: context,
                  fontSize: 18,
                  color: AppColors.white,
                ),
                onTap: () => viewModel.onPressedNavigateDetailMoviePage(movie.id),
              );
            },
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 1.5,
              reverse: false,
              autoPlayInterval: const Duration(seconds: 3),
            ),
          );
        });
  }
}
