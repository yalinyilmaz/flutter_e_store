import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  final int id;
  final String filename;
  final String extension;
  final String thumbUrl;
  final String originalUrl;

  ImageModel(
      {required this.id,
      required this.filename,
      required this.extension,
      required this.thumbUrl,
      required this.originalUrl});

  factory ImageModel.fromJson(Map<String, dynamic> data) =>
      _$ImageModelFromJson(data);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
