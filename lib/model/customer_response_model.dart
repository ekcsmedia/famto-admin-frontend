import 'package:json_annotation/json_annotation.dart';

import 'customer_model.dart';

part 'customer_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerResponseModel {
  Customer? payload;

  CustomerResponseModel(
      this.payload
      );

  factory CustomerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerResponseModelToJson(this);
}