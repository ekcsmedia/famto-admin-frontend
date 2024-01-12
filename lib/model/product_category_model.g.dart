// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryModel _$ProductCategoryModelFromJson(
        Map<String, dynamic> json) =>
    ProductCategoryModel(
      categoryId: json['categoryId'] as int?,
      restaurantName: json['restaurantName'] as String?,
      restaurantId: json['restaurantId'] as int?,
      category: json['category'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProductCategoryModelToJson(
        ProductCategoryModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'category': instance.category,
      'restaurantId': instance.restaurantId,
      'description': instance.description,
      'restaurantName': instance.restaurantName,
    };
