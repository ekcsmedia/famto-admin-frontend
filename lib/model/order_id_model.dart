import 'package:json_annotation/json_annotation.dart';

import 'order_model.dart';
part 'order_id_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderById {
  OrderModel? payload;

  OrderById({
    this.payload,
  });

  factory OrderById.fromJson(Map<String, dynamic> json) =>
      _$OrderByIdFromJson(json);

  Map<String, dynamic> toJson() => _$OrderByIdToJson(this);
}
