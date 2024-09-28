// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyRequestModel _$CurrencyRequestModelFromJson(
        Map<String, dynamic> json) =>
    CurrencyRequestModel(
      property1: (json['property1'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [
            "product",
            "subscription_product",
            "tabbed_midblock_product",
            "draft_order"
          ],
      property2: (json['property2'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [
            "product",
            "subscription_product",
            "tabbed_midblock_product",
            "draft_order"
          ],
    );

Map<String, dynamic> _$CurrencyRequestModelToJson(
        CurrencyRequestModel instance) =>
    <String, dynamic>{
      'property1': instance.property1,
      'property2': instance.property2,
    };
