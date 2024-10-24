import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_demo/gen/assets.gen.dart';
import 'package:movie_demo/helper/root_image.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/ui/widgets/cached_image.dart';
import 'package:movie_demo/utils/app_colors.dart';
import 'package:movie_demo/utils/app_data.dart';

class DetailMoviePoster extends StatelessWidget {
  final String posterPath;
  const DetailMoviePoster({super.key, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: [
          CachedImage(
            imageUrl: posterPath.isNotEmpty ? RootImage().getBackDropPath(posterPath) : "",
            borderRadiusGeometry: const BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
          Positioned(
            bottom: 9,
            right: 11,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.darkBackGroundColor.withOpacity(0.4)),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.icons.icStart.path),
                  const SizedBox(width: 1),
                  Text(
                    AppData.rate,
                    style: AppTextstyle().getSemiBoldMontserratTextStyle(
                      fontSize: 12,
                      color: AppColors.orange,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
