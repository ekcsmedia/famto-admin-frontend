// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      customerId: json['customerId'] as int?,
      platform: json['platform'] as String?,
      rating: json['rating'] as int?,
      registerAt: json['registerAt'] == null
          ? null
          : DateTime.parse(json['registerAt'] as String),
      walletBalance: (json['walletBalance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'customerId': instance.customerId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'platform': instance.platform,
      'rating': instance.rating,
      'walletBalance': instance.walletBalance,
      'registerAt': instance.registerAt?.toIso8601String(),
    };
