import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Customer {
  int? customerId;
  String? name;
  String? email;
  String? phone;
  String? platform;
  int? rating;
  double? walletBalance;
  DateTime? registerAt;

  Customer(
      {this.name,
      this.phone,
      this.email,
      this.customerId,
      this.platform,
      this.rating,
      this.registerAt,
      this.walletBalance});

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
