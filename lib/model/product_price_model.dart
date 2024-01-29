

import 'package:json_annotation/json_annotation.dart';

part 'product_price_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductPriceModel {
   String? name;
   double? price;


   ProductPriceModel({this.name, this.price});

  factory ProductPriceModel.fromJson(Map<String, dynamic> json) =>
      _$ProductPriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPriceModelToJson(this);
}
