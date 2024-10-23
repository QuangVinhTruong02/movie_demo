import 'package:flutter/material.dart';
import 'package:movie_demo/helper/root_image.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/ui/widgets/cached_image.dart';

class DetailMovieBackdropTitle extends StatelessWidget {
  final String backDropPath;
  final String titleMovie;
  const DetailMovieBackdropTitle({super.key, required this.backDropPath, required this.titleMovie});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 29),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CachedImage(
                imageUrl: backDropPath.isNotEmpty ? RootImage().getBackDropPath(backDropPath) : "",
                width: 95,
                height: 120,
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    titleMovie,
                    style: AppTextstyle().getSemiBoldPoppinTextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
