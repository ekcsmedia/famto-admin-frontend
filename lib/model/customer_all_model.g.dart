// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_all_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerAll _$CustomerAllFromJson(Map<String, dynamic> json) => CustomerAll(
      payload: (json['payload'] as List<dynamic>?)
          ?.map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerAllToJson(CustomerAll instance) =>
    <String, dynamic>{
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
    };
