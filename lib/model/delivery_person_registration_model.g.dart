// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_person_registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryPersonRegistration _$DeliveryPersonRegistrationFromJson(
        Map<String, dynamic> json) =>
    DeliveryPersonRegistration(
      deliveryUserId: json['deliveryUserId'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      pan: json['pan'] as String?,
      photo: json['photo'] as String?,
      aadhaar: json['aadhaar'] as String?,
      drivingLicense: json['drivingLicense'] as String?,
      status: json['status'] as String?,
      vehicleRegistration: json['vehicleRegistration'] as String?,
      emergencyContact: json['emergencyContact'] as String?,
      availability: json['availability'] as bool?,
    );

Map<String, dynamic> _$DeliveryPersonRegistrationToJson(
        DeliveryPersonRegistration instance) =>
    <String, dynamic>{
      'deliveryUserId': instance.deliveryUserId,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'pan': instance.pan,
      'photo': instance.photo,
      'aadhaar': instance.aadhaar,
      'drivingLicense': instance.drivingLicense,
      'status': instance.status,
      'vehicleRegistration': instance.vehicleRegistration,
      'emergencyContact': instance.emergencyContact,
      'availability': instance.availability,
    };
