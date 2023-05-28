import 'package:json_annotation/json_annotation.dart';

part 'delivery_category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DeliveryCategory {
  int? deliveryId;
  String? deliveryName;
  String? image;

  DeliveryCategory({
    this.deliveryId,
    this.deliveryName,
    this.image,
  });

  factory DeliveryCategory.fromJson(Map<String, dynamic> json) =>
      _$DeliveryCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryCategoryToJson(this);
}
