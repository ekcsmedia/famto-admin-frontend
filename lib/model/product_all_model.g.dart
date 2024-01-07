// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_all_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAll _$ProductAllFromJson(Map<String, dynamic> json) => ProductAll(
      payload: (json['payload'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductAllToJson(ProductAll instance) =>
    <String, dynamic>{
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
    };
