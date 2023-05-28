// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_category_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryCategoryId _$DeliveryCategoryIdFromJson(Map<String, dynamic> json) =>
    DeliveryCategoryId(
      payload: json['payload'] == null
          ? null
          : DeliveryCategory.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeliveryCategoryIdToJson(DeliveryCategoryId instance) =>
    <String, dynamic>{
      'payload': instance.payload?.toJson(),
    };
