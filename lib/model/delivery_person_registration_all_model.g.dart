// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_person_registration_all_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryPersonRegistrationAll _$DeliveryPersonRegistrationAllFromJson(
        Map<String, dynamic> json) =>
    DeliveryPersonRegistrationAll(
      payload: (json['payload'] as List<dynamic>?)
          ?.map((e) =>
              DeliveryPersonRegistration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeliveryPersonRegistrationAllToJson(
        DeliveryPersonRegistrationAll instance) =>
    <String, dynamic>{
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
    };
