// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_all_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderAll _$OrderAllFromJson(Map<String, dynamic> json) => OrderAll(
      payload: (json['payload'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderAllToJson(OrderAll instance) => <String, dynamic>{
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
    };
