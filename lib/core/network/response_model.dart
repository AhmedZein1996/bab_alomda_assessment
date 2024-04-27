import 'package:json_annotation/json_annotation.dart';

import '../utils/string_date_time_converter.dart';

part 'response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseModel {
  final String status;
  final String section;
  final dynamic results;
  @JsonKey(name: "num_results")
  final int numResults;
  @JsonKey(name: "last_updated")
  @StringDateTimeConverter()
  final DateTime lastUpdated;

  const ResponseModel(this.status, this.section, this.results, this.numResults,
      this.lastUpdated);

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}
