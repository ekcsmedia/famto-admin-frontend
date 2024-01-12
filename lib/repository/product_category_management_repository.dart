import 'package:dartz/dartz.dart';
import 'package:famto_admin_app/model/product_category_all_model.dart';
import '../model/product_category_model.dart';
import '../services/api_exception.dart';
import '../services/api_manager.dart';
import '../utils/failure.dart';

class ProductCategoryManagementRepository {
  final _apiManager = ApiManager();

  Future<Either<Failure, ProductCategoryModel>> createProductCategory(params) async {
    try {
      var jsonResponse = await _apiManager.post(
        "https://nadwk7v350.execute-api.ap-south-1.amazonaws.com/v1/categories",
        params,
        isTokenMandatory: false,
      );

      var response = ProductCategoryModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, ProductCategoryModel>> getProductCategoryById(int id) async {
    try {
      var jsonResponse = await _apiManager.get(
        "https://nadwk7v350.execute-api.ap-south-1.amazonaws.com/v1/categories/$id",
        isTokenMandatory: false,
      );

      var response = ProductCategoryModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, ProductCategoryAll>>
  getProductCategoryDetailsAll() async {
    try {
      var jsonResponse = await _apiManager.get(
        "https://nadwk7v350.execute-api.ap-south-1.amazonaws.com/v1/categories/",
        isTokenMandatory: false,
      );
      var response = ProductCategoryAll.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, ProductCategoryModel>> deleteProductCategory(int id) async {
    try {
      var jsonResponse = await _apiManager.delete(
        "https://nadwk7v350.execute-api.ap-south-1.amazonaws.com/v1/categories/$id",
        id,
        isTokenMandatory: false,
      );

      var response = ProductCategoryModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, ProductCategoryAll>>
  getProductCategoryDetailsOfRestaurant(restaurantId) async {
    try {
      var jsonResponse = await _apiManager.get(
        "https://nadwk7v350.execute-api.ap-south-1.amazonaws.com/v1/categories/restaurant-categories?restaurantId=$restaurantId",
        isTokenMandatory: false,
      );
      var response = ProductCategoryAll.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}