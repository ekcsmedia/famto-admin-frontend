// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_person_registration_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryPersonRegistrationModel _$DeliveryPersonRegistrationModelFromJson(
        Map<String, dynamic> json) =>
    DeliveryPersonRegistrationModel(
      payload: json['payload'] == null
          ? null
          : DeliveryPersonRegistration.fromJson(
              json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeliveryPersonRegistrationModelToJson(
        DeliveryPersonRegistrationModel instance) =>
    <String, dynamic>{
      'payload': instance.payload?.toJson(),
    };
