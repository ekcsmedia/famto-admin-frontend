import 'package:famto_admin_app/model/delivery_category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/delivery_person_registration_model.dart';
import '../repository/delivery_person_registration_repository.dart';

class RegistrationController extends GetxController {
  final DeliveryPersonRegistrationRepository _registrationRepository =
      DeliveryPersonRegistrationRepository();

  final _registrationModel = DeliveryPersonRegistration().obs;
  DeliveryPersonRegistration get registrationModel => _registrationModel.value;

  final _registrationAllDataModel = <DeliveryPersonRegistration>[].obs;
  List<DeliveryPersonRegistration> get registrationAllDataModel =>
      _registrationAllDataModel;

  createDeliveryPersonRegistration({
    phoneNumber,
    name,
    address,
    pan,
    photo,
    aadhaar,
    drivingLicense,
    status,
    vehicleRegistration,
    emergencyContact,
    availability,
  }) async {
    // _isDataLoading(true);

    var response =
        await _registrationRepository.createDeliveryPersonRegistration(
            phoneNumber: phoneNumber,
            name: name,
            address: address,
            pan: pan,
            photo: photo,
            aadhaar: aadhaar,
            drivingLicense: drivingLicense,
            status: status,
            vehicleRegistration: vehicleRegistration,
            emergencyContact: emergencyContact,
            availability: availability);

    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      // _isDataLoading(false);
      // _errorMessage.value = "";
      _registrationModel.value = data;
      print("Test Name: ${data.name} ${data.address}");
    });
  }

  getDeliveryPersonRegistrationDetailsAll() async {
    // _isDataLoading(true);

    var response =
        await _registrationRepository.getDeliveryPersonRegistrationAll();
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      // _isDataLoading(false);
      // _errorMessage.value = "";
      _registrationAllDataModel.value = data.payload ?? [];
      print("Test Name: ${data.payload?[0].name} ${data.payload?[0].address}");
    });
  }
}
