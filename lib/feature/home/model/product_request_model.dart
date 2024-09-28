import 'package:flutter_e_store/feature/home/model/currency_request_model.dart';
import 'package:flutter_e_store/feature/home/model/image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_request_model.g.dart';

@JsonSerializable()
class ProductRequestModel {
  final int id;
  final String name;
  final String sku;
  final int stockAmount;
  final double price1;
  final CurrencyRequestModel currency;
  final int discountType;
  final int taxIncluded;
  final String stockTypeLabel;
  final int customShippingDisabled;
  final int hasGift;
  final int status;
  final int hasOption;
  final int categoryShowcaseStatus;
  final List<ImageModel> images;

  ProductRequestModel(
      {required this.id,
      required this.name,
      required this.sku,
      this.stockAmount = 10,
      required this.price1,
      required this.currency,
      this.discountType = 1,
      this.taxIncluded = 1,
      this.stockTypeLabel = "Piece",
      this.customShippingDisabled = 1,
      this.hasGift = 0,
      this.status = 1,
      this.hasOption = 0,
      this.categoryShowcaseStatus = 1,
      required this.images});

  factory ProductRequestModel.fromJson(Map<String, dynamic> data) =>
      _$ProductRequestModelFromJson(data);
  Map<String, dynamic> toJson() => _$ProductRequestModelToJson(this);
}
