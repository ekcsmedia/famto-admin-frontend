// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productId: json['productId'] as int?,
      restaurantName: json['restaurantName'] as String?,
      restaurantId: json['restaurantId'] as int?,
      productName: json['productName'] as String?,
      productImageUrl: json['productImageUrl'] as String?,
      shortDescription: json['shortDescription'] as String?,
      longDescription: json['longDescription'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      inventoryStatus: json['inventoryStatus'] as bool?,
      quantity: json['quantity'] as int?,
      alert: json['alert'] as int?,
      prepartionTime: json['prepartionTime'] as int?,
      category: json['category'] as String?,
      categoryDesc: json['categoryDesc'] as String?,
      minOrderQty: json['minOrderQty'] as int?,
      maxQtyPerOrder: json['maxQtyPerOrder'] as int?,
      sku: json['sku'] as int?,
      cost: (json['cost'] as num?)?.toDouble(),
      addOnName: json['addOnName'] as String?,
      addOnSelectionType: json['addOnSelectionType'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      oftenBoughtTogether: (json['oftenBoughtTogether'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      addOnsList: (json['addOnsList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'restaurantName': instance.restaurantName,
      'restaurantId': instance.restaurantId,
      'productName': instance.productName,
      'productImageUrl': instance.productImageUrl,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'price': instance.price,
      'inventoryStatus': instance.inventoryStatus,
      'quantity': instance.quantity,
      'alert': instance.alert,
      'prepartionTime': instance.prepartionTime,
      'category': instance.category,
      'categoryDesc': instance.categoryDesc,
      'minOrderQty': instance.minOrderQty,
      'maxQtyPerOrder': instance.maxQtyPerOrder,
      'sku': instance.sku,
      'cost': instance.cost,
      'addOnName': instance.addOnName,
      'addOnSelectionType': instance.addOnSelectionType,
      'tags': instance.tags,
      'oftenBoughtTogether': instance.oftenBoughtTogether,
      'addOnsList': instance.addOnsList,
      'totalPrice': instance.totalPrice,
    };
