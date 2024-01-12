import 'package:famto_admin_app/model/product_category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_category_all_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductCategoryAll {
  List<ProductCategoryModel>? payload;

  ProductCategoryAll({
    this.payload,
  });

  factory ProductCategoryAll.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryAllFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryAllToJson(this);
}
