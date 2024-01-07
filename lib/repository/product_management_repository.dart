import 'package:dartz/dartz.dart';
import '../model/product_all_model.dart';
import '../model/product_model.dart';
import '../model/product_response_model.dart';
import '../services/api_exception.dart';
import '../services/api_manager.dart';
import '../utils/failure.dart';

class ProductManagementRepository {
  final _apiManager = ApiManager();

  Future<Either<Failure, ProductModel>> createProduct(
      params) async {
    try {
      var jsonResponse = await _apiManager.post(
        "https://z729navl52.execute-api.ap-south-1.amazonaws.com/v1/products/",
        params,
        isTokenMandatory: false,
      );

      var response = ProductModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, ProductResponseModel>> getProductById(
      int id) async {
    try {
      var jsonResponse = await _apiManager.get(
        "https://z729navl52.execute-api.ap-south-1.amazonaws.com/v1/products/$id",
        isTokenMandatory: false,
      );

      var response = ProductResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, ProductAll>>
  getProductDetailsAll() async {
    try {
      var jsonResponse = await _apiManager.get(
        "https://z729navl52.execute-api.ap-south-1.amazonaws.com/v1/products/",
        isTokenMandatory: false,
      );
      var response = ProductAll.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, ProductModel>> deleteProduct(
      int id) async {
    try {
      var jsonResponse = await _apiManager.delete(
        "https://yk50phe8x8.execute-api.ap-south-1.amazonaws.com/v1/products/$id",
        id,
        isTokenMandatory: false,
      );

      var response = ProductModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  // Future<Either<Failure, ProductAll>>
  // getRestaurantDetailsByNameSearch(String? query) async {
  //   try {
  //     var jsonResponse = await _apiManager.get(
  //       query == "" ?
  //       "https://yk50phe8x8.execute-api.ap-south-1.amazonaws.com/v1/restaurants" : "https://yk50phe8x8.execute-api.ap-south-1.amazonaws.com/v1/restaurants/search?query=$query",
  //       isTokenMandatory: false,
  //     );
  //     var response = ProductAll.fromJson(jsonResponse);
  //     return right(response);
  //   } on AppException catch (error) {
  //     return left(ApiFailure(message: error.message));
  //   } catch (error) {
  //     return left(ApiFailure(message: error.toString()));
  //   }
  // }


}
