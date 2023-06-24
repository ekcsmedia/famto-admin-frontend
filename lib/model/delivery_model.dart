import 'package:json_annotation/json_annotation.dart';

import 'order_details_model.dart';

part 'delivery_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Delivery {
  String? name;
  String? phone;
  String? email;
  String? orderId;
  String? pickupAddress;
  DateTime? deliveryBefore;
  String? description;
  String? imageUrl;
  String? template;
  OrderDetails? orderDetails;

  Delivery({
    this.name,
    this.phone,
    this.email,
    this.orderId,
    this.pickupAddress,
    this.deliveryBefore,
    this.description,
    this.imageUrl,
    this.template,
    this.orderDetails,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) =>
      _$DeliveryFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryToJson(this);
}
