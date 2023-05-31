import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderModel {
  int? loginId;
  String? name;
  String? phoneNumber;
  String? deliveryType;
  String? vehicleType;
  String? pickupLocation;
  String? dropLocation;
  String? deliveryCharge;
  String? orderId;
  String? status;


  OrderModel({
    this.loginId,
    this.name,
    this.phoneNumber,
    this.deliveryType,
    this.vehicleType,
    this.pickupLocation,
    this.dropLocation,
    this.deliveryCharge,
    this.orderId,
    this.status
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}