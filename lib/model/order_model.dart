import 'package:json_annotation/json_annotation.dart';

import 'delivery_model.dart';
import 'pickup_model.dart';

part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderModel {
  String? taskId;
  String? assignee;
  String? type;
  List<Pickup>? pickupDetails;
  List<Delivery>? deliveryDetails;
  String? agent;

  OrderModel({
    this.assignee,
    this.type,
    this.pickupDetails,
    this.deliveryDetails,
    this.agent,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
