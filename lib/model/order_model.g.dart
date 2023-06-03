// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      newId: json['newId'] as int?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      deliveryType: json['deliveryType'] as String?,
      vehicleType: json['vehicleType'] as String?,
      pickupLocation: json['pickupLocation'] as String?,
      dropLocation: json['dropLocation'] as String?,
      deliveryCharge: (json['deliveryCharge'] as num?)?.toDouble(),
      deliveryPerson: json['deliveryPerson'] as String?,
      deliveryPersonNumber: json['deliveryPersonNumber'] as String?,
      orderId: json['orderId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'newId': instance.newId,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'deliveryType': instance.deliveryType,
      'vehicleType': instance.vehicleType,
      'pickupLocation': instance.pickupLocation,
      'dropLocation': instance.dropLocation,
      'deliveryCharge': instance.deliveryCharge,
      'orderId': instance.orderId,
      'status': instance.status,
      'deliveryPerson': instance.deliveryPerson,
      'deliveryPersonNumber': instance.deliveryPersonNumber,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
