import 'package:dartz/dartz.dart';
import '../model/customer_all_model.dart';
import '../model/customer_model.dart';
import '../model/restaurant_all_model.dart';
import '../model/restaurant_model.dart';
import '../model/restaurant_response_model.dart';
import '../services/api_endpoints.dart';
import '../services/api_exception.dart';
import '../services/api_manager.dart';
import '../utils/failure.dart';

class RestaurantManagementRepository {
  final _apiManager = ApiManager();

  Future<Either<Failure, RestaurantResponseModel>> createRestaurant(
      params) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.post(
        "https://yk50phe8x8.execute-api.ap-south-1.amazonaws.com/v1/restaurants/",
        params,
        isTokenMandatory: false,
      );

      var response = RestaurantResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, RestaurantResponseModel>> getRestaurantById(
      int id) async {
    try {
      var jsonResponse = await _apiManager.get(
        "https://yk50phe8x8.execute-api.ap-south-1.amazonaws.com/v1/restaurants/$id",
        isTokenMandatory: false,
      );

      var response = RestaurantResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, RestaurantAll>>
  getRestaurantDetailsAll() async {
    try {
      var jsonResponse = await _apiManager.get(
        "https://yk50phe8x8.execute-api.ap-south-1.amazonaws.com/v1/restaurants",
        isTokenMandatory: false,
      );
      var response = RestaurantAll.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, RestaurantModel>> deleteRestaurant(
      int id) async {
    try {
      var jsonResponse = await _apiManager.delete(
        "https://yk50phe8x8.execute-api.ap-south-1.amazonaws.com/v1/restaurants/$id",
        id,
        isTokenMandatory: false,
      );

      var response = RestaurantModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, RestaurantAll>>
  getRestaurantDetailsByNameSearch(String? query) async {
    try {
      var jsonResponse = await _apiManager.get(
       query == "" ?
       "https://yk50phe8x8.execute-api.ap-south-1.amazonaws.com/v1/restaurants" : "https://yk50phe8x8.execute-api.ap-south-1.amazonaws.com/v1/restaurants/search?query=$query",
        isTokenMandatory: false,
      );
      var response = RestaurantAll.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }


}
