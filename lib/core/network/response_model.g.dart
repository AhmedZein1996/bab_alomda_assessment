// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    ResponseModel(
      json['status'] as String,
      json['section'] as String,
      json['results'],
      (json['num_results'] as num).toInt(),
      DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'section': instance.section,
      'results': instance.results,
      'num_results': instance.numResults,
      'last_updated': instance.lastUpdated.toIso8601String(),
    };
