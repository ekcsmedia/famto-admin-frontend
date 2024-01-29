import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel {
  int? productId;
  String? restaurantName;
  int? restaurantId;
  String? productName;
  String? productImageUrl;
  String? shortDescription;
  String? longDescription;
  double? price;
  bool? inventoryStatus;
  int? quantity;
  int? alert;
  int? prepartionTime;
  String? category;
  String? categoryDesc;
  int? minOrderQty;
  int? maxQtyPerOrder;
  int? sku;
  double? cost;
  String? addOnName;
  String? addOnSelectionType;
  List<String>? tags;
  List<String>? oftenBoughtTogether;
  List<String>? addOnsList;
  double? totalPrice;

  ProductModel(
      {this.productId,
      this.restaurantName,
      this.restaurantId,
      this.productName,
      this.productImageUrl,
      this.shortDescription,
      this.longDescription,
      this.price,
      this.inventoryStatus,
      this.quantity,
      this.alert,
      this.prepartionTime,
      this.category,
      this.categoryDesc,
      this.minOrderQty,
      this.maxQtyPerOrder,
      this.sku,
      this.cost,
      this.addOnName,
      this.addOnSelectionType,
      this.tags,
      this.oftenBoughtTogether,
      this.addOnsList,
      this.totalPrice});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
