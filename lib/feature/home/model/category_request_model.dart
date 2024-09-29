import 'package:flutter_e_store/feature/home/model/category.dart';
import 'package:flutter_e_store/feature/home/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_request_model.g.dart';

@JsonSerializable()
class CategoryRequestModel {
  final int id;
  final Product product;
  final Category category;
  final int sortOrder;

  CategoryRequestModel({
    required this.id,
    required this.product,
    required this.category,
    required this.sortOrder,
  });

  factory CategoryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryRequestModelToJson(this);
}
