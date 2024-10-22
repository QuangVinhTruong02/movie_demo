import 'package:flutter/material.dart';
import 'package:movie_demo/core/models/movie.dart';
import 'package:movie_demo/helper/root_image.dart';
import 'package:movie_demo/ui/home/components/home_image_view.dart';
import 'package:movie_demo/ui/home/home_viewmodel.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/utils/app_languages.dart';
import 'package:provider/provider.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return StreamBuilder<bool>(
      stream: viewModel.loadingSubject,
      builder: (context, snapshot) {
        bool isLoading = snapshot.data ?? false;
        if (isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Movie> movieList = viewModel.movieList;
        if (movieList.isEmpty) {
          return Column(
            children: [
              const SizedBox(height: 4),
              Text(
                AppLanguages.somethingWentWrong,
                style: AppTextstyle().getMediumPoppinTextStyle(fontSize: 20),
              ),
            ],
          );
        }
        return StreamBuilder<bool>(
          stream: viewModel.loadMoreStream,
          builder: (context, snapshot) {
            bool isLoadMore = snapshot.data ?? false;
            return ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                GridView.builder(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 13,
                    crossAxisSpacing: 18,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemCount: movieList.length,
                  itemBuilder: (context, index) {
                    Movie movie = movieList[index];
                    return HomeImageView(
                      imageUrl: movie.backdropPath.isNotEmpty
                          ? RootImage().getBackDropPath(movie.backdropPath)
                          : movie.backdropPath,
                      titleOnImg: movie.title,
                      textStyle: AppTextstyle().getMediumPoppinTextStyle(fontSize: 16),
                    );
                  },
                ),
                if (isLoadMore)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
