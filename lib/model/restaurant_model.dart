import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'restaurant_model.g.dart';

@JsonSerializable(explicitToJson: true)


 // List<RestaurantTagsModel> restaurantTags;


class RestaurantModel {
  int? restaurantId;
  String? restaurantName;
  String? address;
  String? phone;
  String? email;
  String? city;
  String? displayAddress;
  String? contactName;
  String? description;
  String? slug;
  String? logoUrl;
  String? bannerUrl;
  String? bgColour;
  String? ratingBarColor;
  String? tag;
  String? servingArea;
  String? commissionType;
  String? businessCategory;
  double? rating;
  bool? serviceStatus;
  bool? sponsorship;
  double? commissionValue;
  List<String>? restaurantTags;

  RestaurantModel({
    this.description,
    this.phone,
    this.address,
    this.bannerUrl,
    this.bgColour,
    this.businessCategory,
    this.city,
    this.commissionType,
    this.commissionValue,
    this.contactName,
    this.displayAddress,
    this.email,
    this.logoUrl,
    this.rating,
    this.ratingBarColor,
    this.restaurantId,
    this.restaurantName,
    this.serviceStatus,
    this.servingArea,
    this.slug,
    this.sponsorship,
    this.tag,
    this.restaurantTags
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);
}
