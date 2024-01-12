import 'package:json_annotation/json_annotation.dart';

part 'product_category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductCategoryModel {

  int? categoryId;
  String? category;
  int? restaurantId;
  String? description;
  String? restaurantName;

  ProductCategoryModel({
    this.categoryId,
    this.restaurantName,
    this.restaurantId,
    this.category,
    this.description,
  }    );

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryModelToJson(this);
}