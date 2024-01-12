import 'package:famto_admin_app/model/product_category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_category_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductCategoryResponseModel {
  ProductCategoryModel? payload;

  ProductCategoryResponseModel(
      this.payload
      );

  factory ProductCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryResponseModelToJson(this);
}