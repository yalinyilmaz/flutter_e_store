import 'package:flutter_e_store/feature/home/model/currency_model.dart';
import 'package:flutter_e_store/feature/home/model/image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String fullName;
  final double? stockAmount;
  final double? price1;
  final CurrencyModel currency;
  final List<ImageModel> images;

  ProductModel(
      {required this.id,
      required this.fullName,
      this.stockAmount,
      this.price1,
      required this.currency,
      required this.images});

  factory ProductModel.fromJson(Map<String, dynamic> data) =>
      _$ProductModelFromJson(data);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
