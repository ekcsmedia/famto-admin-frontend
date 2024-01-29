// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPriceModel _$ProductPriceModelFromJson(Map<String, dynamic> json) =>
    ProductPriceModel(
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductPriceModelToJson(ProductPriceModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
    };
