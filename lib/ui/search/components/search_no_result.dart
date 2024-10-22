import 'package:flutter/widgets.dart';
import 'package:movie_demo/gen/assets.gen.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/utils/app_colors.dart';
import 'package:movie_demo/utils/app_languages.dart';

class SearchNoResult extends StatelessWidget {
  const SearchNoResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.images.imgSearchNoResults.path),
          const SizedBox(height: 16),
          Text(
            AppLanguages.notFindTheMovieTitle,
            style: AppTextstyle().getSemiBoldMontserratTextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            AppLanguages.notFindTheMovieSubTitle,
            style: AppTextstyle().getSemiBoldMontserratTextStyle(
              fontSize: 12,
              color: AppColors.grey1,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
