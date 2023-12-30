// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) =>
    RestaurantModel(
      description: json['description'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      bgColour: json['bgColour'] as String?,
      businessCategory: json['businessCategory'] as String?,
      city: json['city'] as String?,
      commissionType: json['commissionType'] as String?,
      commissionValue: (json['commissionValue'] as num?)?.toDouble(),
      contactName: json['contactName'] as String?,
      displayAddress: json['displayAddress'] as String?,
      email: json['email'] as String?,
      logoUrl: json['logoUrl'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingBarColor: json['ratingBarColor'] as String?,
      restaurantId: json['restaurantId'] as int?,
      restaurantName: json['restaurantName'] as String?,
      serviceStatus: json['serviceStatus'] as bool?,
      servingArea: json['servingArea'] as String?,
      slug: json['slug'] as String?,
      sponsorship: json['sponsorship'] as bool?,
      tag: json['tag'] as String?,
      restaurantTags: (json['restaurantTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RestaurantModelToJson(RestaurantModel instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'city': instance.city,
      'displayAddress': instance.displayAddress,
      'contactName': instance.contactName,
      'description': instance.description,
      'slug': instance.slug,
      'logoUrl': instance.logoUrl,
      'bannerUrl': instance.bannerUrl,
      'bgColour': instance.bgColour,
      'ratingBarColor': instance.ratingBarColor,
      'tag': instance.tag,
      'servingArea': instance.servingArea,
      'commissionType': instance.commissionType,
      'businessCategory': instance.businessCategory,
      'rating': instance.rating,
      'serviceStatus': instance.serviceStatus,
      'sponsorship': instance.sponsorship,
      'commissionValue': instance.commissionValue,
      'restaurantTags': instance.restaurantTags,
    };
