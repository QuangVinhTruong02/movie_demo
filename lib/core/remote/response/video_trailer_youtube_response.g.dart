// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_trailer_youtube_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoTrailerYoutubeResponse _$VideoTrailerYoutubeResponseFromJson(
        Map<String, dynamic> json) =>
    VideoTrailerYoutubeResponse(
      kind: json['kind'] as String,
      trailers: TrailerResponse.fromJson(json['id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoTrailerYoutubeResponseToJson(
        VideoTrailerYoutubeResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'id': instance.trailers,
    };

TrailerResponse _$TrailerResponseFromJson(Map<String, dynamic> json) =>
    TrailerResponse(
      kind: json['kind'] as String,
      videoId: json['videoId'] as String,
    );

Map<String, dynamic> _$TrailerResponseToJson(TrailerResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'videoId': instance.videoId,
    };
