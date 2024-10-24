import 'package:flutter/material.dart';
import 'package:movie_demo/ui/base/base_widget.dart';
import 'package:movie_demo/ui/watch_trailer/components/watch_trailer_view.dart';
import 'package:movie_demo/ui/watch_trailer/watch_trailer_viewmodel.dart';

class WatchTrailerPage extends StatelessWidget {
  final String videoId;
  const WatchTrailerPage({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<WatchTrailerViewmodel>(
      viewModel: WatchTrailerViewmodel(videoId: videoId),
      onViewModelReady: (viewModel) => viewModel.onInit(),
      builder: (context, viewModel, child) {
        return const WatchTrailerView();
      },
    );
  }
}
