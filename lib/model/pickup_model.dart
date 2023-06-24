import 'package:json_annotation/json_annotation.dart';

import 'order_details_model.dart';

part 'pickup_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Pickup {
  String? name;
  String? phone;
  String? email;
  String? orderId;
  String? pickupAddress;
  DateTime? pickupBefore;
  String? description;
  String? imageUrl;
  String? template;
  OrderDetails? orderDetails;

  Pickup({
    this.name,
    this.phone,
    this.email,
    this.orderId,
    this.pickupAddress,
    this.pickupBefore,
    this.description,
    this.imageUrl,
    this.template,
    this.orderDetails,
  });

  factory Pickup.fromJson(Map<String, dynamic> json) => _$PickupFromJson(json);

  Map<String, dynamic> toJson() => _$PickupToJson(this);
}
