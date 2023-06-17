import 'package:json_annotation/json_annotation.dart';

part 'delivery_person_registration_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DeliveryPersonRegistration {
  int? deliveryUserId;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? email;
  String? userName;
  String? password;
  String? team;
  String? role;
  String? type;
  String? geofence;
  String? transportType;
  String? transportDescription;
  String? licensePlate;
  String? color;
  double? latitude;
  double? longitude;
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
    this.firstName,
    this.lastName,
    this.email,
    this.userName,
    this.password,
    this.team,
    this.role,
    this.type,
    this.geofence,
    this.transportType,
    this.transportDescription,
    this.licensePlate,
    this.color,
    this.latitude,
    this.longitude,
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
