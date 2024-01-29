// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      customerId: json['customerId'] as int?,
      lastUsedPlatform: json['lastUsedPlatform'] as String?,
      rating: json['rating'] as int?,
      registerAt: json['registerAt'] == null
          ? null
          : DateTime.parse(json['registerAt'] as String),
      walletBalance: (json['walletBalance'] as num?)?.toDouble(),
      codStatus: json['codStatus'] as bool?,
      payLaterStatus: json['payLaterStatus'] as bool?,
      rateAndReview: (json['rateAndReview'] as num?)?.toDouble(),
      referralCode: json['referralCode'] as String?,
      tagsModel: (json['tagsModel'] as List<dynamic>?)
          ?.map((e) => TagModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      versions: (json['versions'] as List<dynamic>?)
          ?.map((e) => VersionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'lastUsedPlatform': instance.lastUsedPlatform,
      'rating': instance.rating,
      'walletBalance': instance.walletBalance,
      'registerAt': instance.registerAt?.toIso8601String(),
      'codStatus': instance.codStatus,
      'payLaterStatus': instance.payLaterStatus,
      'referralCode': instance.referralCode,
      'rateAndReview': instance.rateAndReview,
      'tagsModel': instance.tagsModel?.map((e) => e.toJson()).toList(),
      'versions': instance.versions?.map((e) => e.toJson()).toList(),
    };
