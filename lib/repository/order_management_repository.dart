import 'package:dartz/dartz.dart';
import '../model/order_all_model.dart';
import '../model/task_model.dart';
import '../services/api_endpoints.dart';
import '../services/api_exception.dart';
import '../services/api_manager.dart';
import '../utils/failure.dart';

class OrderRepository {
  final _apiManager = ApiManager();

  Future<Either<Failure, TaskModel>> createOrder({parameters}) async {
    try {
      print("inside order repository");
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.post(
        "https://tzzg86ms1m.execute-api.ap-south-1.amazonaws.com/v1/api/orders/",
        // "http://192.168.1.3:8080/api/orders/",
        // "http://10.0.2.2:8080/api/orders/",

        parameters,
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

  Future<Either<Failure, TaskModel>> getOrderDetailsByID(int id) async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.get(
        // "localhost:8080//api/delivery-category/$id",
        "https://tzzg86ms1m.execute-api.ap-south-1.amazonaws.com/v1/api/orders/$id",
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

  Future<Either<Failure, OrderAll>> getOrdersAll() async {
    try {
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.get(
        // "localhost:8080//api/delivery-category/",
        // "http://127.0.0.1:9999/api/delivery-category/",
        // "${ApiEndpoints.apiBaseUrl}orders/",
        "https://tzzg86ms1m.execute-api.ap-south-1.amazonaws.com/v1/api/orders",
        // "https://utb9cx6tx1.execute-api.ap-south-1.amazonaws.com/orders",

        // "http://10.0.2.2:8080/api/delivery-category/",
        isTokenMandatory: false,
      );
      var response = OrderAll.fromJson(jsonResponse);
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
