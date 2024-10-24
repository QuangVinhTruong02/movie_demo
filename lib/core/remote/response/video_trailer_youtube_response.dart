import 'package:json_annotation/json_annotation.dart';
part 'video_trailer_youtube_response.g.dart';

@JsonSerializable()
class VideoTrailerYoutubeResponse {
  final String kind;
  @JsonKey(name: "id")
  final TrailerResponse trailers;

  VideoTrailerYoutubeResponse({
    required this.kind,
    required this.trailers,
  });

  factory VideoTrailerYoutubeResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoTrailerYoutubeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoTrailerYoutubeResponseToJson(this);
}

@JsonSerializable()
class TrailerResponse {
  final String kind;
  final String videoId;

  TrailerResponse({
    required this.kind,
    required this.videoId,
  });

  factory TrailerResponse.fromJson(Map<String, dynamic> json) => _$TrailerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerResponseToJson(this);
}
