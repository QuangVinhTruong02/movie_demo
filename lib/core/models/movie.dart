import 'package:json_annotation/json_annotation.dart';
import 'package:movie_demo/helper/date_time_json_converter.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  @JsonKey(name: "title", defaultValue: "")
  final String title;
  final String? overview;
  final int? runtime;
  @JsonKey(name: "backdrop_path", defaultValue: "")
  final String backdropPath;
  @JsonKey(name: "poster_path", defaultValue: "")
  final String posterPath;
  @JsonKey(name: "release_date")
  @DateTimeJsonConverter()
  final DateTime? releaseDate;
  @JsonKey(name: "vote_average")
  final double? voteAverage;

  Movie({
    required this.id,
    required this.title,
    this.overview,
    this.runtime,
    required this.backdropPath,
    required this.posterPath,
    this.releaseDate,
    this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
