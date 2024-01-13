import 'package:dartz/dartz.dart';
import '../model/customer_all_model.dart';
import '../model/customer_model.dart';
import '../model/customer_response_model.dart';
import '../services/api_endpoints.dart';
import '../services/api_exception.dart';
import '../services/api_manager.dart';
import '../utils/failure.dart';

class CustomerManagementRepository {
  final _apiManager = ApiManager();

  Future<Either<Failure, CustomerResponseModel>> createCustomer(
      params) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.post(
        "https://65sj3flif7.execute-api.ap-south-1.amazonaws.com/v1/customers/",
        params,
        isTokenMandatory: false,
      );

      var response = CustomerResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, CustomerResponseModel>> getCustomerById(
      int id) async {
    try {
      var jsonResponse = await _apiManager.get(
        "https://65sj3flif7.execute-api.ap-south-1.amazonaws.com/v1/customers/$id",
        isTokenMandatory: false,
      );

      var response = CustomerResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, CustomerAll>>
  getCustomerDetailsAll() async {
    try {
      var jsonResponse = await _apiManager.get(
        "https://65sj3flif7.execute-api.ap-south-1.amazonaws.com/v1/customers/",
        isTokenMandatory: false,
      );
      var response = CustomerAll.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, CustomerModel>> deleteCustomer(
      int id) async {
    try {
      var jsonResponse = await _apiManager.delete(
        "https://65sj3flif7.execute-api.ap-south-1.amazonaws.com/v1/customers/$id",
        id,
        isTokenMandatory: false,
      );

      var response = CustomerModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
  Future<Either<Failure, CustomerAll>>
  getCustomersByNameSearch(String? query) async {
    try {
      var jsonResponse = await _apiManager.get(
     query == ""  ? "https://65sj3flif7.execute-api.ap-south-1.amazonaws.com/v1/customers/" :
        "https://65sj3flif7.execute-api.ap-south-1.amazonaws.com/v1/customers/search?query=$query",
        isTokenMandatory: false,
      );
      var response = CustomerAll.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
