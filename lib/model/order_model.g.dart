// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      assignee: json['assignee'] as String?,
      type: json['type'] as String?,
      pickupDetails: (json['pickupDetails'] as List<dynamic>?)
          ?.map((e) => Pickup.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryDetails: (json['deliveryDetails'] as List<dynamic>?)
          ?.map((e) => Delivery.fromJson(e as Map<String, dynamic>))
          .toList(),
      agent: json['agent'] as String?,
    )..taskId = json['taskId'] as String?;

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'assignee': instance.assignee,
      'type': instance.type,
      'pickupDetails': instance.pickupDetails?.map((e) => e.toJson()).toList(),
      'deliveryDetails':
          instance.deliveryDetails?.map((e) => e.toJson()).toList(),
      'agent': instance.agent,
    };
