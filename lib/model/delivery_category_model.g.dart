// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryCategory _$DeliveryCategoryFromJson(Map<String, dynamic> json) =>
    DeliveryCategory(
      deliveryId: json['deliveryId'] as int?,
      deliveryName: json['deliveryName'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$DeliveryCategoryToJson(DeliveryCategory instance) =>
    <String, dynamic>{
      'deliveryId': instance.deliveryId,
      'deliveryName': instance.deliveryName,
      'image': instance.image,
    };
