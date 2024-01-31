import 'package:json_annotation/json_annotation.dart';
import 'manage_order_model.dart';

part 'manage_order_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderResponseModel {
  OrderModel? payload;

  OrderResponseModel(
      this.payload
      );

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseModelToJson(this);
}