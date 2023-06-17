import 'package:dartz/dartz.dart';
import 'package:famto_admin_app/model/delivery_category_all_model.dart';
import 'package:famto_admin_app/model/delivery_category_id_model.dart';
import 'package:famto_admin_app/model/delivery_category_model.dart';

import '../model/delivery_person_registration_all_model.dart';
import '../model/delivery_person_registration_id_model.dart';
import '../model/delivery_person_registration_model.dart';
import '../services/api_endpoints.dart';
import '../services/api_exception.dart';
import '../services/api_manager.dart';
import '../utils/failure.dart';

class DeliveryPersonRegistrationRepository {
  final _apiManager = ApiManager();

  Future<Either<Failure, DeliveryPersonRegistration>>
      createDeliveryPersonRegistration(
          {String? phoneNumber,
          String? name,
          String? address,
          String? pan,
          String? photo,
          String? aadhaar,
          String? drivingLicense,
          String? status,
          String? vehicleRegistration,
          String? emergencyContact,
          bool? availability,
          String? password,
          String? firstName,
          String? lastName,
          String? email,
          String? userName,
          String? team,
          String? role,
          String? type,
          String? geofence,
          String? transportType,
          String? transportDescription,
          String? licensePlate,
          String? color,
          double? latitude,
          double? longitude}) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.post(
        // "http://10.0.2.2:8080/api/delivery-category/",
        // "${ApiEndpoints.apiBaseUrl}delivery-person-registration/",
        // "https://cxk4wh3u4b.execute-api.ap-south-1.amazonaws.com/create-delivery-person",
        "https://8v07bxn9n3.execute-api.ap-south-1.amazonaws.com/create-delivery-person",
        {
          "phoneNumber": phoneNumber,
          "name": name,
          "address": address,
          "pan": pan,
          "photo": photo,
          "aadhaar": aadhaar,
          "drivingLicense": drivingLicense,
          "status": status,
          "vehicleRegistration": vehicleRegistration,
          "emergencyContact": emergencyContact,
          "availability": availability,
          "email": email,
          "firstName": firstName,
          "lastName": lastName,
          "password": password,
          "userName": userName,
          "team": team,
          "role": role,
          "type": type,
          "geofence": geofence,
          "transportType": transportType,
          "transportDescription": transportDescription,
          "licensePlate": licensePlate,
          "color": color,
          "latitude": latitude,
          "longitude": longitude
        },
        isTokenMandatory: false,
      );

      var response = DeliveryPersonRegistration.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, DeliveryPersonRegistrationModel>>
      getDeliveryPersonRegistrationByID(int id) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.get(
        // "localhost:8080//api/delivery-category/$id",
        // "${ApiEndpoints.apiBaseUrl}delivery-person-registration/$id",
        // "http://10.0.2.2:8080/api/delivery-category/$id",
        "https://8v07bxn9n3.execute-api.ap-south-1.amazonaws.com/v1/$id",

        isTokenMandatory: false,
      );

      var response = DeliveryPersonRegistrationModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, DeliveryPersonRegistrationModel>>
      updateDeliveryPersonRegistrationByID(
          id,
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
          availability) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.put(
        // "localhost:8080//api/delivery-category/$id",
        // "${ApiEndpoints.apiBaseUrl}delivery-person-registration/$id",
        "https://cxk4wh3u4b.execute-api.ap-south-1.amazonaws.com/create-delivery-person",

        {
          "phoneNumber": phoneNumber,
          "name": name,
          "address": address,
          "pan": pan,
          "photo": photo,
          "aadhaar": aadhaar,
          "drivingLicense": drivingLicense,
          "status": status,
          "vehicleRegistration": vehicleRegistration,
          "emergencyContact": emergencyContact,
          "availability": availability
        },
        // "http://10.0.2.2:8080/api/delivery-category/$id",

        isTokenMandatory: false,
      );

      var response = DeliveryPersonRegistrationModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, DeliveryPersonRegistrationModel>>
      updateDeliveryPersonRegistrationStatus(id, status) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.put(
        // "localhost:8080//api/delivery-category/$id",
        "${ApiEndpoints.apiBaseUrl}delivery-person-registration/$id",

        {
          "status": status,
        },
        // "http://10.0.2.2:8080/api/delivery-category/$id",

        isTokenMandatory: false,
      );

      var response = DeliveryPersonRegistrationModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, DeliveryPersonRegistrationAll>>
      getDeliveryPersonRegistrationAll() async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.get(
        // "localhost:8080//api/delivery-category/",
        // "http://127.0.0.1:9999/api/delivery-category/",
        // "${ApiEndpoints.apiBaseUrl}delivery-person-registration/",
        "https://qe7y5ivre3.execute-api.ap-south-1.amazonaws.com/delivery-person",
        // "http://10.0.2.2:8080/api/delivery-category/",
        isTokenMandatory: false,
      );
      var response = DeliveryPersonRegistrationAll.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, DeliveryPersonRegistrationModel>>
      deleteDeliveryPersonRegistration(int id) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.delete(
        // "localhost:8080//api/delivery-category/$id",
        "${ApiEndpoints.apiBaseUrl}delivery-person-registration/$id",
        // "http://10.0.2.2:8080/api/delivery-category/$id",
        id,
        isTokenMandatory: false,
      );

      var response = DeliveryPersonRegistrationModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
