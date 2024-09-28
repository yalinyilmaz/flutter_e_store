// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRequestModel _$ProductRequestModelFromJson(Map<String, dynamic> json) =>
    ProductRequestModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      sku: json['sku'] as String,
      stockAmount: (json['stockAmount'] as num?)?.toInt() ?? 10,
      price1: (json['price1'] as num).toDouble(),
      currency:
          CurrencyModel.fromJson(json['currency'] as Map<String, dynamic>),
      discountType: (json['discountType'] as num?)?.toInt() ?? 1,
      taxIncluded: (json['taxIncluded'] as num?)?.toInt() ?? 1,
      stockTypeLabel: json['stockTypeLabel'] as String? ?? "Piece",
      customShippingDisabled:
          (json['customShippingDisabled'] as num?)?.toInt() ?? 1,
      hasGift: (json['hasGift'] as num?)?.toInt() ?? 0,
      status: (json['status'] as num?)?.toInt() ?? 1,
      hasOption: (json['hasOption'] as num?)?.toInt() ?? 0,
      categoryShowcaseStatus:
          (json['categoryShowcaseStatus'] as num?)?.toInt() ?? 1,
      images: json['images'] as List<dynamic>?,
    );

Map<String, dynamic> _$ProductRequestModelToJson(
        ProductRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'stockAmount': instance.stockAmount,
      'price1': instance.price1,
      'currency': instance.currency,
      'discountType': instance.discountType,
      'taxIncluded': instance.taxIncluded,
      'stockTypeLabel': instance.stockTypeLabel,
      'customShippingDisabled': instance.customShippingDisabled,
      'hasGift': instance.hasGift,
      'status': instance.status,
      'hasOption': instance.hasOption,
      'categoryShowcaseStatus': instance.categoryShowcaseStatus,
      'images': instance.images,
    };
