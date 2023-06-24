// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Delivery _$DeliveryFromJson(Map<String, dynamic> json) => Delivery(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      orderId: json['orderId'] as String?,
      pickupAddress: json['pickupAddress'] as String?,
      deliveryBefore: json['deliveryBefore'] == null
          ? null
          : DateTime.parse(json['deliveryBefore'] as String),
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      template: json['template'] as String?,
      orderDetails: json['orderDetails'] == null
          ? null
          : OrderDetails.fromJson(json['orderDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeliveryToJson(Delivery instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'orderId': instance.orderId,
      'pickupAddress': instance.pickupAddress,
      'deliveryBefore': instance.deliveryBefore?.toIso8601String(),
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'template': instance.template,
      'orderDetails': instance.orderDetails?.toJson(),
    };
