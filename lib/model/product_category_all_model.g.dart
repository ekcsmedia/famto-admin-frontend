// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_all_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryAll _$ProductCategoryAllFromJson(Map<String, dynamic> json) =>
    ProductCategoryAll(
      payload: (json['payload'] as List<dynamic>?)
          ?.map((e) => ProductCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductCategoryAllToJson(ProductCategoryAll instance) =>
    <String, dynamic>{
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
    };
