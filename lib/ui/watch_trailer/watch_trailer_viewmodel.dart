import 'package:movie_demo/ui/base/base_viewmodel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailerViewmodel extends BaseViewModel {
  final String videoId;
  WatchTrailerViewmodel({required this.videoId});

  late YoutubePlayerController youtubePlayerController;

  Future<void> onInit() async {
    setLoading(true);
    youtubePlayerController = YoutubePlayerController(initialVideoId: videoId);
    setLoading(false);
  }

  @override
  void dispose() {
    super.dispose();
    youtubePlayerController.dispose();
  }
}
