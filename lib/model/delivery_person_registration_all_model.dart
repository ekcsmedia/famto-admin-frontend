import 'package:famto_admin_app/model/delivery_person_registration_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery_person_registration_all_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DeliveryPersonRegistrationAll {
  List<DeliveryPersonRegistration>? payload;

  DeliveryPersonRegistrationAll({
    this.payload,
  });

  factory DeliveryPersonRegistrationAll.fromJson(Map<String, dynamic> json) =>
      _$DeliveryPersonRegistrationAllFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryPersonRegistrationAllToJson(this);
}
