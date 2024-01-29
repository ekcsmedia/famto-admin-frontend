import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressModel {
   String? formattedAddress;
   String? apartmentNo;
   String?  postalCode;
   String? landmark;
   String? label;
   double? latitude;
   double? longitude;


   AddressModel(
      {this.formattedAddress,
      this.apartmentNo,
      this.postalCode,
      this.landmark,
      this.label,
      this.latitude,
      this.longitude});

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
