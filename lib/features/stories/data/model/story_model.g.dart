// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) => StoryModel(
      json['section'] as String,
      json['title'] as String,
      json['abstract'] as String,
      json['url'] as String,
      json['byline'] as String,
      (json['multimedia'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'section': instance.section,
      'title': instance.title,
      'abstract': instance.description,
      'url': instance.articleUrl,
      'byline': instance.author,
      'multimedia': instance.multimedia,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      imageUrl: json['url'] as String,
      format: json['format'] as String,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'url': instance.imageUrl,
      'format': instance.format,
    };
