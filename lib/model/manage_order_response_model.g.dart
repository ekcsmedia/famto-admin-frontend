// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponseModel _$OrderResponseModelFromJson(Map<String, dynamic> json) =>
    OrderResponseModel(
      json['payload'] == null
          ? null
          : OrderModel.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderResponseModelToJson(OrderResponseModel instance) =>
    <String, dynamic>{
      'payload': instance.payload?.toJson(),
    };
