import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_demo/ui/detail_movie/detail_movie_viewmodel.dart';
import 'package:movie_demo/ui/widgets/custom_button.dart';
import 'package:movie_demo/utils/app_languages.dart';
import 'package:provider/provider.dart';

class DetailMovieBottomNavBar extends StatelessWidget {
  const DetailMovieBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<DetailMovieViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 10),
      child: CustomButton(
        onPressed: viewModel.onPressedNavigateWatchTrailerPage,
        title: AppLanguages.watchTrailer.tr(),
      ),
    );
  }
}
