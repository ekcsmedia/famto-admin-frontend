import 'package:famto_admin_app/model/delivery_person_registration_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery_person_registration_id_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DeliveryPersonRegistrationModel {
  DeliveryPersonRegistration? payload;

  DeliveryPersonRegistrationModel({
    this.payload,
  });

  factory DeliveryPersonRegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryPersonRegistrationModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeliveryPersonRegistrationModelToJson(this);
}
