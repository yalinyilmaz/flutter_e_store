// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      sku: json['sku'] as String,
      stockAmount: (json['stockAmount'] as num).toDouble(),
      price1: (json['price1'] as num?)?.toDouble(),
      currency:
          CurrencyModel.fromJson(json['currency'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'stockAmount': instance.stockAmount,
      'price1': instance.price1,
      'currency': instance.currency,
      'categories': instance.categories,
      'images': instance.images,
    };
