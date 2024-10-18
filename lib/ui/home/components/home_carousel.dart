import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_demo/core/models/movie.dart';
import 'package:movie_demo/ui/home/components/home_image_view.dart';
import 'package:movie_demo/ui/home/home_viewmodel.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/utils/app_const.dart';
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
            return Center(
              child: Text(
                "Empty",
                style: AppTextstyle().getMediumPoppinTextStyle(fontSize: 20),
              ),
            );
          }
          return CarouselSlider.builder(
            itemCount: movieList.length,
            itemBuilder: (context, index, realIndex) {
              Movie movie = movieList[index];
              String backDropPath = "${AppConst.rootImageurl}${movie.backdropPath}";
              return HomeImageView(
                imageUrl: backDropPath,
                titleOnImg: movie.title,
                textStyle: AppTextstyle().getSemiBoldPoppinTextStyle(fontSize: 18),
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
