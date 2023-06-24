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
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      userName: json['userName'] as String?,
      password: json['password'] as String?,
      team: json['team'] as String?,
      role: json['role'] as String?,
      type: json['type'] as String?,
      geofence: json['geofence'] as String?,
      transportType: json['transportType'] as String?,
      transportDescription: json['transportDescription'] as String?,
      licensePlate: json['licensePlate'] as String?,
      color: json['color'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
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
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'userName': instance.userName,
      'password': instance.password,
      'team': instance.team,
      'role': instance.role,
      'type': instance.type,
      'geofence': instance.geofence,
      'transportType': instance.transportType,
      'transportDescription': instance.transportDescription,
      'licensePlate': instance.licensePlate,
      'color': instance.color,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
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
