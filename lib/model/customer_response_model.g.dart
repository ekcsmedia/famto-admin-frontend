// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerResponseModel _$CustomerResponseModelFromJson(
        Map<String, dynamic> json) =>
    CustomerResponseModel(
      Customer.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerResponseModelToJson(
        CustomerResponseModel instance) =>
    <String, dynamic>{
      'payload': instance.payload?.toJson(),
    };
