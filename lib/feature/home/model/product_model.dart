import 'package:flutter_e_store/feature/home/model/currency_model.dart';
import 'package:flutter_e_store/feature/home/model/image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  String name;
  final String sku;
  final double stockAmount;
  double? price1;
  final CurrencyModel currency;
  final List<ImageModel>? images;

  ProductModel(
      {required this.id,
      required this.name,
      required this.sku,
      required this.stockAmount,
      this.price1,
      required this.currency,
      this.images});

  factory ProductModel.fromJson(Map<String, dynamic> data) =>
      _$ProductModelFromJson(data);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
