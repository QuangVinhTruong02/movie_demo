import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final int? id;
  final String? title;
  final String? overview;
  final int? runtime;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  @JsonKey(name: "vote_average")
  final double? voteAverage;

  Movie({
    this.id,
    this.title,
    this.overview,
    this.runtime,
    this.backdropPath,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
