import 'package:json_annotation/json_annotation.dart';
import 'customer_model.dart';

part 'customer_all_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerAll {
  List<CustomerModel>? payload;

  CustomerAll({
    this.payload,
  });

  factory CustomerAll.fromJson(Map<String, dynamic> json) =>
      _$CustomerAllFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerAllToJson(this);
}
