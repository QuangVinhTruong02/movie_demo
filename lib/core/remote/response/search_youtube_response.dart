import 'package:json_annotation/json_annotation.dart';
import 'package:movie_demo/core/remote/response/video_trailer_youtube_response.dart';

part 'search_youtube_response.g.dart';

@JsonSerializable()
class SearchYoutubeResponse {
  final String kind;
  @JsonKey(name: "items")
  final List<VideoTrailerYoutubeResponse> videoTrailerYoutube;

  SearchYoutubeResponse({
    required this.kind,
    required this.videoTrailerYoutube,
  });

  factory SearchYoutubeResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchYoutubeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchYoutubeResponseToJson(this);
}
