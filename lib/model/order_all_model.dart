import 'package:json_annotation/json_annotation.dart';

import 'order_model.dart';

part 'order_all_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderAll {
  List<OrderModel>? payload;

  OrderAll({
    this.payload,
  });

  factory OrderAll.fromJson(Map<String, dynamic> json) =>
      _$OrderAllFromJson(json);

  Map<String, dynamic> toJson() => _$OrderAllToJson(this);
}
