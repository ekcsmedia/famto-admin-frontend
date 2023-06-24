import 'package:json_annotation/json_annotation.dart';

import 'task_details.dart';

part 'order_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderDetails {
  List<TaskDetails>? taskDetails;
  String? instructions;
  String? tip;
  double? deliveryCharges;
  double? discount;
  String? paymentType;
  double? subTotal;

  OrderDetails({
    this.taskDetails,
    this.instructions,
    this.tip,
    this.deliveryCharges,
    this.discount,
    this.paymentType,
    this.subTotal,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}
