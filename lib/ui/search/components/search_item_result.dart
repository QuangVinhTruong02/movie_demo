import 'package:flutter/material.dart';
import 'package:movie_demo/core/models/movie.dart';
import 'package:movie_demo/gen/assets.gen.dart';
import 'package:movie_demo/helper/root_image.dart';
import 'package:movie_demo/ui/search/components/item_piece.dart';
import 'package:movie_demo/ui/search/search_viewmodel.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/ui/widgets/cached_image.dart';
import 'package:movie_demo/utils/app_colors.dart';
import 'package:movie_demo/utils/app_languages.dart';
import 'package:movie_demo/utils/date_time_util.dart';
import 'package:provider/provider.dart';

class SearchItemResult extends StatelessWidget {
  final Movie movie;
  const SearchItemResult({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SearchViewmodel>();
    return InkWell(
      onTap: () => viewModel.onPressedNavigateDetailMoviePage(movie.id),
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedImage(
              imageUrl: movie.backdropPath.isNotEmpty
                  ? RootImage().getBackDropPath(movie.backdropPath)
                  : "",
              width: 95,
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title.isNotEmpty ? movie.title : AppLanguages.unknown,
                      style: AppTextstyle().getRegularPoppinTextStyle(fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    ItemPiece(
                      iconPath: Assets.icons.icStart.path,
                      title: movie.voteAverage?.toStringAsFixed(1) ?? AppLanguages.unknown,
                      colorsTitle: AppColors.orange,
                    ),
                    const SizedBox(height: 5),
                    ItemPiece(
                      iconPath: Assets.icons.icCalendar.path,
                      title: movie.releaseDate != null
                          ? DateTimeUtil().convertDateTimeToString(dateTime: movie.releaseDate!)
                          : AppLanguages.unknown,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
