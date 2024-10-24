import 'package:flutter/material.dart';
import 'package:movie_demo/ui/watch_trailer/watch_trailer_viewmodel.dart';
import 'package:movie_demo/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailerView extends StatelessWidget {
  const WatchTrailerView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<WatchTrailerViewmodel>();
    return Scaffold(
      body: StreamBuilder<bool>(
        stream: viewModel.loadingSubject,
        builder: (context, snapshot) {
          bool isLoading = snapshot.data ?? false;
          if (isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: viewModel.youtubePlayerController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: AppColors.blue,
              progressColors: ProgressBarColors(
                playedColor: AppColors.blue,
                handleColor: AppColors.blue,
              ),
            ),
            builder: (context, player) {
              return Center(
                child: player,
              );
            },
          );
        },
      ),
    );
  }
}
