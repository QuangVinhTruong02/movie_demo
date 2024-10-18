import 'package:flutter/material.dart';
import 'package:movie_demo/ui/widgets/cached_image.dart';
import 'package:movie_demo/utils/app_languages.dart';

class HomeImageView extends StatelessWidget {
  final String imageUrl;
  final String? titleOnImg;
  final TextStyle textStyle;
  const HomeImageView({
    super.key,
    required this.imageUrl,
    required this.titleOnImg,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedImage(imageUrl: imageUrl),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: 0.23,
              widthFactor: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Text(
                  titleOnImg ?? AppLanguages.unknown,
                  style: textStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
