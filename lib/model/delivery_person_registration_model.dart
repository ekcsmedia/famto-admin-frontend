import 'package:json_annotation/json_annotation.dart';

part 'delivery_person_registration_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DeliveryPersonRegistration {
  int? deliveryUserId;
  String? phoneNumber;
  String? name;
  String? address;
  String? pan;
  String? photo;
  String? aadhaar;
  String? drivingLicense;
  String? status;
  String? vehicleRegistration;
  String? emergencyContact;
  bool? availability;

  DeliveryPersonRegistration({
    this.deliveryUserId,
    this.phoneNumber,
    this.name,
    this.address,
    this.pan,
    this.photo,
    this.aadhaar,
    this.drivingLicense,
    this.status,
    this.vehicleRegistration,
    this.emergencyContact,
    this.availability,
  });

  factory DeliveryPersonRegistration.fromJson(Map<String, dynamic> json) =>
      _$DeliveryPersonRegistrationFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryPersonRegistrationToJson(this);
}
