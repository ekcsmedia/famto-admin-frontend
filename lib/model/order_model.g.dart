// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      loginId: json['loginId'] as int?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      deliveryType: json['deliveryType'] as String?,
      vehicleType: json['vehicleType'] as String?,
      pickupLocation: json['pickupLocation'] as String?,
      dropLocation: json['dropLocation'] as String?,
      deliveryCharge: json['deliveryCharge'] as String?,
      orderId: json['orderId'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'loginId': instance.loginId,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'deliveryType': instance.deliveryType,
      'vehicleType': instance.vehicleType,
      'pickupLocation': instance.pickupLocation,
      'dropLocation': instance.dropLocation,
      'deliveryCharge': instance.deliveryCharge,
      'orderId': instance.orderId,
      'status': instance.status,
    };
