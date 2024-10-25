import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_demo/gen/assets.gen.dart';
import 'package:movie_demo/ui/search/components/search_list_view_result.dart';
import 'package:movie_demo/ui/search/components/search_no_result.dart';
import 'package:movie_demo/ui/search/search_viewmodel.dart';
import 'package:movie_demo/ui/widgets/custom_textfield.dart';
import 'package:movie_demo/utils/app_languages.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SearchViewmodel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 24, left: 24, bottom: 16),
          child: CustomTextfield(
            controller: viewModel.searchEditingController,
            hintText: AppLanguages.search.tr(),
            suffixWidget: GestureDetector(
              onTap: viewModel.onSearchPressed,
              child: SvgPicture.asset(Assets.icons.icSearchSuffix.path),
            ),
            onSubmitted: (value) => viewModel.onSearchPressed(),
          ),
        ),
        Flexible(
          child: StreamBuilder<bool>(
            stream: viewModel.loadingSubject,
            builder: (context, snapshot) {
              bool isLoading = snapshot.data ?? false;
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (viewModel.movieList.isEmpty) {
                return const SearchNoResult();
              }
              return const SearchListViewResult();
            },
          ),
        )
      ],
    );
  }
}
