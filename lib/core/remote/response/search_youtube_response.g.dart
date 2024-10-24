// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_youtube_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchYoutubeResponse _$SearchYoutubeResponseFromJson(
        Map<String, dynamic> json) =>
    SearchYoutubeResponse(
      kind: json['kind'] as String,
      videoTrailerYoutube: (json['items'] as List<dynamic>)
          .map((e) =>
              VideoTrailerYoutubeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchYoutubeResponseToJson(
        SearchYoutubeResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'items': instance.videoTrailerYoutube,
    };
