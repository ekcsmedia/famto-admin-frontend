// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      orderId: json['orderId'] as int?,
      customerData: json['customerData'] == null
          ? null
          : CustomerModel.fromJson(
              json['customerData'] as Map<String, dynamic>),
      deliveryMethod: json['deliveryMethod'] as String?,
      pickupName: json['pickupName'] as String?,
      pickupPhone: json['pickupPhone'] as String?,
      pickupEmail: json['pickupEmail'] as String?,
      orderStatus: json['orderStatus'] as String?,
      pickupAddress: json['pickupAddress'] == null
          ? null
          : AddressModel.fromJson(
              json['pickupAddress'] as Map<String, dynamic>),
      deliveryAddress: json['deliveryAddress'] == null
          ? null
          : AddressModel.fromJson(
              json['deliveryAddress'] as Map<String, dynamic>),
      deliveryOption: json['deliveryOption'] as String?,
      restaurantDetails: json['restaurantDetails'] == null
          ? null
          : RestaurantModel.fromJson(
              json['restaurantDetails'] as Map<String, dynamic>),
      productsData: (json['productsData'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      suggestions: json['suggestions'] as String?,
      invoice: json['invoice'] == null
          ? null
          : InvoiceModel.fromJson(json['invoice'] as Map<String, dynamic>),
      deliveryAgentData: json['deliveryAgentData'] == null
          ? null
          : DeliveryPersonRegistration.fromJson(
              json['deliveryAgentData'] as Map<String, dynamic>),
      orderTime: json['orderTime'] == null
          ? null
          : DateTime.parse(json['orderTime'] as String),
      scheduledDeliveryTime: json['scheduledDeliveryTime'] == null
          ? null
          : DateTime.parse(json['scheduledDeliveryTime'] as String),
      paymentMode: json['paymentMode'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      rating: json['rating'] as String?,
      orderPreparationTime: json['orderPreparationTime'] as String?,
      deviceType: json['deviceType'] as String?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'customerData': instance.customerData?.toJson(),
      'deliveryMethod': instance.deliveryMethod,
      'pickupName': instance.pickupName,
      'pickupPhone': instance.pickupPhone,
      'pickupEmail': instance.pickupEmail,
      'orderStatus': instance.orderStatus,
      'suggestions': instance.suggestions,
      'deliveryOption': instance.deliveryOption,
      'restaurantDetails': instance.restaurantDetails?.toJson(),
      'pickupAddress': instance.pickupAddress?.toJson(),
      'deliveryAddress': instance.deliveryAddress?.toJson(),
      'productsData': instance.productsData?.map((e) => e.toJson()).toList(),
      'deliveryAgentData': instance.deliveryAgentData?.toJson(),
      'invoice': instance.invoice?.toJson(),
      'orderTime': instance.orderTime?.toIso8601String(),
      'scheduledDeliveryTime':
          instance.scheduledDeliveryTime?.toIso8601String(),
      'paymentMode': instance.paymentMode,
      'paymentStatus': instance.paymentStatus,
      'rating': instance.rating,
      'orderPreparationTime': instance.orderPreparationTime,
      'deviceType': instance.deviceType,
    };
