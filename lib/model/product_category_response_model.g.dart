// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryResponseModel _$ProductCategoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductCategoryResponseModel(
      json['payload'] == null
          ? null
          : ProductCategoryModel.fromJson(
              json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductCategoryResponseModelToJson(
        ProductCategoryResponseModel instance) =>
    <String, dynamic>{
      'payload': instance.payload?.toJson(),
    };
