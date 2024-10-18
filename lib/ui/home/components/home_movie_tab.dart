import 'package:flutter/material.dart';
import 'package:movie_demo/ui/home/home_viewmodel.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/utils/app_colors.dart';
import 'package:provider/provider.dart';

class HomeMovieTab extends StatelessWidget {
  const HomeMovieTab({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return TabBar(
      dividerColor: Colors.transparent,
      controller: viewModel.tabController,
      indicatorColor: AppColors.grey1,
      isScrollable: true,
      onTap: viewModel.onTapMovieTypeChannge,
      labelStyle: AppTextstyle().getMediumPoppinTextStyle(fontSize: 14),
      unselectedLabelColor: AppColors.grey1,
      unselectedLabelStyle: AppTextstyle().getRegularPoppinTextStyle(fontSize: 14),
      tabs: viewModel.movieTypeList
          .map(
            (item) => Tab(
              text: item.title,
            ),
          )
          .toList(),
    );
  }
}
