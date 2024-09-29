// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryRequestModel _$CategoryRequestModelFromJson(
        Map<String, dynamic> json) =>
    CategoryRequestModel(
      id: (json['id'] as num).toInt(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      sortOrder: (json['sortOrder'] as num).toInt(),
    );

Map<String, dynamic> _$CategoryRequestModelToJson(
        CategoryRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'category': instance.category,
      'sortOrder': instance.sortOrder,
    };
