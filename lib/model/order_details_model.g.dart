// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
      taskDetails: (json['taskDetails'] as List<dynamic>?)
          ?.map((e) => TaskDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      instructions: json['instructions'] as String?,
      tip: json['tip'] as String?,
      deliveryCharges: (json['deliveryCharges'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      paymentType: json['paymentType'] as String?,
      subTotal: (json['subTotal'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'taskDetails': instance.taskDetails?.map((e) => e.toJson()).toList(),
      'instructions': instance.instructions,
      'tip': instance.tip,
      'deliveryCharges': instance.deliveryCharges,
      'discount': instance.discount,
      'paymentType': instance.paymentType,
      'subTotal': instance.subTotal,
    };
