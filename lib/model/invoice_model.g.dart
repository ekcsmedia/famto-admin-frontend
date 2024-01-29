// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) => InvoiceModel(
      productsPriceData: (json['productsPriceData'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ProductPriceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      salesTax: (json['salesTax'] as num?)?.toDouble(),
      gst: (json['gst'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InvoiceModelToJson(InvoiceModel instance) =>
    <String, dynamic>{
      'productsPriceData':
          instance.productsPriceData?.map((e) => e?.toJson()).toList(),
      'subtotal': instance.subtotal,
      'salesTax': instance.salesTax,
      'gst': instance.gst,
      'total': instance.total,
    };
