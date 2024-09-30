// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 1,
      status: (json['status'] as num?)?.toInt() ?? 1,
      imageFile: json['imageFile'],
      displayShowcaseContent:
          (json['displayShowcaseContent'] as num?)?.toInt() ?? 0,
      showcaseContentDisplayType:
          (json['showcaseContentDisplayType'] as num?)?.toInt() ?? 2,
      displayShowcaseFooterContent:
          (json['displayShowcaseFooterContent'] as num?)?.toInt() ?? 0,
      showcaseFooterContentDisplayType:
          (json['showcaseFooterContentDisplayType'] as num?)?.toInt() ?? 1,
      hasChildren: (json['hasChildren'] as num?)?.toInt() ?? 0,
      imageUrl: json['imageUrl'],
      isCombine: (json['isCombine'] as num?)?.toInt() ?? 1,
      isSearchable: (json['isSearchable'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sortOrder': instance.sortOrder,
      'status': instance.status,
      'imageFile': instance.imageFile,
      'displayShowcaseContent': instance.displayShowcaseContent,
      'showcaseContentDisplayType': instance.showcaseContentDisplayType,
      'displayShowcaseFooterContent': instance.displayShowcaseFooterContent,
      'showcaseFooterContentDisplayType':
          instance.showcaseFooterContentDisplayType,
      'hasChildren': instance.hasChildren,
      'imageUrl': instance.imageUrl,
      'isCombine': instance.isCombine,
      'isSearchable': instance.isSearchable,
    };
