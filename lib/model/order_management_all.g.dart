// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_management_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderManageAll _$OrderManageAllFromJson(Map<String, dynamic> json) =>
    OrderManageAll(
      payload: (json['payload'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderManageAllToJson(OrderManageAll instance) =>
    <String, dynamic>{
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
    };
