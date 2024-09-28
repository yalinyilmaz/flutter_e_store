import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyModel {
  final int id;
  final String label;

  CurrencyModel({
    required this.id,
    required this.label,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> data) =>
      _$CurrencyModelFromJson(data);
  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}
