// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_category_all_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryCategoryAll _$DeliveryCategoryAllFromJson(Map<String, dynamic> json) =>
    DeliveryCategoryAll(
      payload: (json['payload'] as List<dynamic>?)
          ?.map((e) => DeliveryCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeliveryCategoryAllToJson(
        DeliveryCategoryAll instance) =>
    <String, dynamic>{
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
    };
