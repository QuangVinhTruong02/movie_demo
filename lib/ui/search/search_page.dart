import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/gen/assets.gen.dart';
import 'package:movie_demo/ui/base/base_widget.dart';
import 'package:movie_demo/ui/search/components/search_view.dart';
import 'package:movie_demo/ui/search/search_viewmodel.dart';
import 'package:movie_demo/ui/widgets/custom_appbar.dart';
import 'package:movie_demo/utils/app_colors.dart';
import 'package:movie_demo/utils/app_languages.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SearchViewmodel>(
      viewModel: SearchViewmodel(movieRepository: context.read<MovieRepository>()),
      onViewModelReady: (viewModel) => viewModel.onInit(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppbar(
            leading: null,
            title: AppLanguages.search.tr(),
            actions: [
              IconButton(
                onPressed: null,
                icon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Assets.icons.icInfoCircle.path,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).iconTheme.color ?? AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: const SearchView(),
        );
      },
    );
  }
}
