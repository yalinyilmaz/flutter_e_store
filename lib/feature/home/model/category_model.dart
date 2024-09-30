import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int id;
  String name;
  final int sortOrder;
  final int status;
  final dynamic imageFile;
  final int displayShowcaseContent;
  final int showcaseContentDisplayType;
  final int displayShowcaseFooterContent;
  final int showcaseFooterContentDisplayType;
  final int hasChildren;
  final dynamic imageUrl;
  final int isCombine;
  final int isSearchable;

  CategoryModel({
    required this.id,
    required this.name,
    this.sortOrder = 1,
    this.status = 1,
    this.imageFile,
    this.displayShowcaseContent = 0,
    this.showcaseContentDisplayType = 2,
    this.displayShowcaseFooterContent = 0,
    this.showcaseFooterContentDisplayType = 1,
    this.hasChildren = 0,
    this.imageUrl,
    this.isCombine = 1,
    this.isSearchable = 1,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
