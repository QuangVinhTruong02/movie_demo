// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String? ?? '',
      overview: json['overview'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      backdropPath: json['backdrop_path'] as String? ?? '',
      posterPath: json['poster_path'] as String? ?? '',
      releaseDate: const DateTimeJsonConverter()
          .fromJson(json['release_date'] as String?),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'runtime': instance.runtime,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'release_date':
          const DateTimeJsonConverter().toJson(instance.releaseDate),
      'vote_average': instance.voteAverage,
    };
