import 'package:famto_admin_app/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_all_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductAll {
  List<ProductModel>? payload;

  ProductAll({
    this.payload,
  });

  factory ProductAll.fromJson(Map<String, dynamic> json) =>
      _$ProductAllFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAllToJson(this);
}
