import 'package:famto_admin_app/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductResponseModel {
  ProductModel? payload;

  ProductResponseModel(
      this.payload
      );

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);
}