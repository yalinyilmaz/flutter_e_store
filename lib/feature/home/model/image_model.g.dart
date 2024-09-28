// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      id: (json['id'] as num).toInt(),
      filename: json['filename'] as String,
      extension: json['extension'] as String,
      thumbUrl: json['thumbUrl'] as String,
      originalUrl: json['originalUrl'] as String,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'extension': instance.extension,
      'thumbUrl': instance.thumbUrl,
      'originalUrl': instance.originalUrl,
    };
