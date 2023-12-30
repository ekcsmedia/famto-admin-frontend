// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_all_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantAll _$RestaurantAllFromJson(Map<String, dynamic> json) =>
    RestaurantAll(
      payload: (json['payload'] as List<dynamic>?)
          ?.map((e) => RestaurantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantAllToJson(RestaurantAll instance) =>
    <String, dynamic>{
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
    };
