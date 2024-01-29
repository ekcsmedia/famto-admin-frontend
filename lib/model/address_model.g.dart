// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      formattedAddress: json['formattedAddress'] as String?,
      apartmentNo: json['apartmentNo'] as String?,
      postalCode: json['postalCode'] as String?,
      landmark: json['landmark'] as String?,
      label: json['label'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'formattedAddress': instance.formattedAddress,
      'apartmentNo': instance.apartmentNo,
      'postalCode': instance.postalCode,
      'landmark': instance.landmark,
      'label': instance.label,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
