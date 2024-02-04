import 'package:dartz/dartz.dart';
import '../model/manage_order_model.dart';
import '../model/manage_order_response_model.dart';
import '../model/order_all_model.dart';
import '../model/order_management_all.dart';
import '../model/task_model.dart';
import '../services/api_endpoints.dart';
import '../services/api_exception.dart';
import '../services/api_manager.dart';
import '../utils/failure.dart';

class OrderRepository {
  final _apiManager = ApiManager();

  Future<Either<Failure, OrderResponseModel>> createOrder({parameters}) async {
    try {
      var jsonResponse = await _apiManager.post(
        "https://6qg7wh8nga.execute-api.ap-south-1.amazonaws.com/v1/order-management",
        parameters,
        isTokenMandatory: false,
      );
      print("$jsonResponse -- ");
      var response = OrderResponseModel.fromJson(jsonResponse);
      print("$response ++");

      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, TaskModel>> getOrderDetailsByID(int id) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.get(
        // "localhost:8080//api/delivery-category/$id",
        "https://6qg7wh8nga.execute-api.ap-south-1.amazonaws.com/v1/order-management/$id",
        // "http://10.0.2.2:8080/api/delivery-category/$id",

        isTokenMandatory: false,
      );

      var response = TaskModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, OrderManageAll>> getOrdersAll() async {
    try {
      var jsonResponse = await _apiManager.get(
        "https://6qg7wh8nga.execute-api.ap-south-1.amazonaws.com/v1/order-management",
        isTokenMandatory: false,
      );
      var response = OrderManageAll.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, String?>> deleteOrderManagementById({int? id}) async {
    try {
      var jsonResponse = await _apiManager.delete(
        "https://6qg7wh8nga.execute-api.ap-south-1.amazonaws.com/v1/order-management/$id",
        id,
        isTokenMandatory: false,
      );
      var response = jsonResponse.toString();
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }


  Future<Either<Failure, TaskModel>> updateOrderByID(
      {int? id,
      String? phoneNumber,
      String? name,
      String? deliveryType,
      String? vehicleType,
      String? pickupLocation,
      String? dropLocation,
      String? deliveryCharges,
      String? deliveryPerson,
      String? deliveryPersonNumber,
      String? orderId,
      String? status}) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.put(
        // "localhost:8080//api/delivery-category/$id",
        "https://tzzg86ms1m.execute-api.ap-south-1.amazonaws.com/v1/api/orders/$id",
        {
          "phoneNumber": phoneNumber,
          "name": name,
          "deliveryType": deliveryType,
          "vehicleType": vehicleType,
          "pickupLocation": pickupLocation,
          "dropLocation": dropLocation,
          "deliveryCharge": deliveryCharges,
          "deliveryPerson": deliveryPerson,
          "deliveryPersonNumber": deliveryPersonNumber,
          "orderId": orderId,
          "status": status
        },
        // "http://10.0.2.2:8080/api/delivery-category/$id",

        isTokenMandatory: false,
      );

      var response = TaskModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, TaskModel>> updateOrderStatus(
      {required int id, String? status}) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.put(
        // "localhost:8080//api/delivery-category/$id",
        "https://tzzg86ms1m.execute-api.ap-south-1.amazonaws.com/v1/api/orders/$id",
        {"status": status},
        // "http://10.0.2.2:8080/api/delivery-category/$id",

        isTokenMandatory: false,
      );

      var response = TaskModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, TaskModel>> deleteOrderById(int id) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.delete(
        // "localhost:8080//api/delivery-category/$id",
        "https://tzzg86ms1m.execute-api.ap-south-1.amazonaws.com/v1/api/orders/$id",
        // "http://10.0.2.2:8080/api/delivery-category/$id",
        id,
        isTokenMandatory: false,
      );

      var response = TaskModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
