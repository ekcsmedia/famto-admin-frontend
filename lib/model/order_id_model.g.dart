// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderById _$OrderByIdFromJson(Map<String, dynamic> json) => OrderById(
      payload: json['payload'] == null
          ? null
          : TaskModel.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderByIdToJson(OrderById instance) => <String, dynamic>{
      'payload': instance.payload?.toJson(),
    };
