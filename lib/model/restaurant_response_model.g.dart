// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantResponseModel _$RestaurantResponseModelFromJson(
        Map<String, dynamic> json) =>
    RestaurantResponseModel(
      json['payload'] == null
          ? null
          : RestaurantModel.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RestaurantResponseModelToJson(
        RestaurantResponseModel instance) =>
    <String, dynamic>{
      'payload': instance.payload?.toJson(),
    };
