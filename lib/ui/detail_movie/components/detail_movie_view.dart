import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_demo/gen/assets.gen.dart';
import 'package:movie_demo/ui/detail_movie/components/detail_movie_body.dart';
import 'package:movie_demo/ui/detail_movie/components/detail_movie_bottom_nav_bar.dart';
import 'package:movie_demo/ui/detail_movie/detail_movie_viewmodel.dart';
import 'package:movie_demo/ui/widgets/custom_appbar.dart';
import 'package:movie_demo/ui/widgets/leading_back_icon.dart';
import 'package:movie_demo/utils/app_colors.dart';
import 'package:movie_demo/utils/app_languages.dart';
import 'package:provider/provider.dart';

class DetailMovieView extends StatelessWidget {
  const DetailMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<DetailMovieViewModel>();
    return Scaffold(
      appBar: CustomAppbar(
        leading: LeadingBackIcon(
          onPressed: viewModel.onBackPressed,
        ),
        title: AppLanguages.detail.tr(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.icons.icBookmarkWhite.path,
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color ?? AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          )
        ],
      ),
      body: const DetailMovieBody(),
      bottomNavigationBar: const DetailMovieBottomNavBar(),
    );
  }
}
