// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pickup _$PickupFromJson(Map<String, dynamic> json) => Pickup(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      orderId: json['orderId'] as String?,
      pickupAddress: json['pickupAddress'] as String?,
      pickupBefore: json['pickupBefore'] == null
          ? null
          : DateTime.parse(json['pickupBefore'] as String),
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      template: json['template'] as String?,
      orderDetails: json['orderDetails'] == null
          ? null
          : OrderDetails.fromJson(json['orderDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PickupToJson(Pickup instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'orderId': instance.orderId,
      'pickupAddress': instance.pickupAddress,
      'pickupBefore': instance.pickupBefore?.toIso8601String(),
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'template': instance.template,
      'orderDetails': instance.orderDetails?.toJson(),
    };
