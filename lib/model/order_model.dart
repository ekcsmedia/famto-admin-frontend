import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderModel {
  int? newId;
  String? name;
  String? phoneNumber;
  String? deliveryType;
  String? vehicleType;
  String? pickupLocation;
  String? dropLocation;
  double? deliveryCharge;
  String? orderId;
  String? status;
  String? deliveryPerson;
  String? deliveryPersonNumber;
  DateTime? createdAt;

  OrderModel(
      {this.newId,
      this.name,
      this.phoneNumber,
      this.deliveryType,
      this.vehicleType,
      this.pickupLocation,
      this.dropLocation,
      this.deliveryCharge,
      this.deliveryPerson,
      this.deliveryPersonNumber,
      this.orderId,
      this.createdAt,
      this.status});

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
