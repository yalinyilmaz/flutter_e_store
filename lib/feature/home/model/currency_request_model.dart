import 'package:json_annotation/json_annotation.dart';

part 'currency_request_model.g.dart';

@JsonSerializable()
class CurrencyRequestModel {
  final List<String> property1;
  final List<String> property2;

  CurrencyRequestModel(
      {this.property1 = const [
        "product",
        "subscription_product",
        "tabbed_midblock_product",
        "draft_order",
      ],
      this.property2 = const [
        "product",
        "subscription_product",
        "tabbed_midblock_product",
        "draft_order"
      ]});

      factory CurrencyRequestModel.fromJson(Map<String, dynamic> data) =>
      _$CurrencyRequestModelFromJson(data);
  Map<String, dynamic> toJson() => _$CurrencyRequestModelToJson(this);
}
