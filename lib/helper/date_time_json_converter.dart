import 'package:json_annotation/json_annotation.dart';

class DateTimeJsonConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeJsonConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json == null || json.isEmpty) return null;
    return DateTime.parse(json);
  }

  @override
  String? toJson(DateTime? object) {
    if (object == null) return null;
    return object.toIso8601String();
  }
}
