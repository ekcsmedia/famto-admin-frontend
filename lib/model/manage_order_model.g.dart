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
      productsData: json['productsData'] == null
          ? null
          : ProductModel.fromJson(json['productsData'] as Map<String, dynamic>),
      suggestions: json['suggestions'] as String?,
      invoice: json['invoice'] == null
          ? null
          : InvoiceModel.fromJson(json['invoice'] as Map<String, dynamic>),
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
      'pickupAddress': instance.pickupAddress?.toJson(),
      'deliveryAddress': instance.deliveryAddress?.toJson(),
      'deliveryOption': instance.deliveryOption,
      'restaurantDetails': instance.restaurantDetails?.toJson(),
      'productsData': instance.productsData?.toJson(),
      'suggestions': instance.suggestions,
      'invoice': instance.invoice?.toJson(),
    };
