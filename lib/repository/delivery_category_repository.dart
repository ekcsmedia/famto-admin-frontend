import 'package:dartz/dartz.dart';
import 'package:famto_admin_app/model/delivery_category_all_model.dart';
import 'package:famto_admin_app/model/delivery_category_id_model.dart';
import 'package:famto_admin_app/model/delivery_category_model.dart';

import '../services/api_endpoints.dart';
import '../services/api_exception.dart';
import '../services/api_manager.dart';
import '../utils/failure.dart';

class DeliveryCategoryRepository {
  final _apiManager = ApiManager();

  Future<Either<Failure, DeliveryCategory>> createDeliveryCategory(
      {name, imageUrl}) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.post(
        // "http://10.0.2.2:8080/api/delivery-category/",
        "${ApiEndpoints.apiBaseUrl}delivery-category/",

        {"deliveryName": name, "image": imageUrl},
        isTokenMandatory: false,
      );

      var response = DeliveryCategory.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, DeliveryCategoryId>> getDeliveryCategory(
      int id) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.get(
        // "localhost:8080//api/delivery-category/$id",
        "${ApiEndpoints.apiBaseUrl}delivery-category/$id",
        // "http://10.0.2.2:8080/api/delivery-category/$id",

        isTokenMandatory: false,
      );

      var response = DeliveryCategoryId.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, DeliveryCategoryAll>>
      getDeliveryCategoriesAll() async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.get(
        // "localhost:8080//api/delivery-category/",
        // "http://127.0.0.1:9999/api/delivery-category/",
        // "${ApiEndpoints.apiBaseUrl}delivery-category/",
        "https://bnzyo2asgi.execute-api.ap-south-1.amazonaws.com/alpha/",
        // "http://10.0.2.2:8080/api/delivery-category/",
        isTokenMandatory: false,
      );
      var response = DeliveryCategoryAll.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, DeliveryCategoryId>> deleteDeliveryCategory(
      int id) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.delete(
        // "localhost:8080//api/delivery-category/$id",
        "${ApiEndpoints.apiBaseUrl}delivery-category/$id",
        // "http://10.0.2.2:8080/api/delivery-category/$id",
        id,
        isTokenMandatory: false,
      );

      var response = DeliveryCategoryId.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
