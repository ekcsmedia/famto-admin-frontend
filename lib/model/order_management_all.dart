import 'package:json_annotation/json_annotation.dart';
import 'manage_order_model.dart';

part 'order_management_all.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderManageAll {
  List<OrderModel>? payload;

  OrderManageAll({
    this.payload,
  });

  factory OrderManageAll.fromJson(Map<String, dynamic> json) =>
      _$OrderManageAllFromJson(json);

  Map<String, dynamic> toJson() => _$OrderManageAllToJson(this);
}
