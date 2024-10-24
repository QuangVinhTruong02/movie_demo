import 'package:movie_demo/gen/assets.gen.dart';

enum StateRendererType {
  loadingState,
  errorState,
  contentState;

  String get animatedImage {
    switch (this) {
      case StateRendererType.loadingState:
        return Assets.jsonAnim.animLoading;
      case StateRendererType.errorState:
        return Assets.jsonAnim.animError;
      case StateRendererType.contentState:
        return "";
    }
  }
}
