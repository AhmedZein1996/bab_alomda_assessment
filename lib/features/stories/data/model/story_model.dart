import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';

@JsonSerializable()
class StoryModel {
  final String section;

  final String title;

  @JsonKey(name: "abstract")
  final String description;

  @JsonKey(name: "url")
  final String articleUrl;

  @JsonKey(name: "byline")
  final String author;

  final List<Media> multimedia;

  const StoryModel(this.section, this.title, this.description, this.articleUrl,
      this.author, this.multimedia);

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryModelToJson(this);
}

@JsonSerializable()
class Media {
  @JsonKey(name: "url")
  final String imageUrl;

  final String format;

  Media({required this.imageUrl, required this.format});

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
