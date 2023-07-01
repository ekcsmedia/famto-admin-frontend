import 'package:dartz/dartz.dart';
import 'package:famto_admin_app/views/create_task_screen.dart';

import '../model/order_model.dart';
import '../services/api_exception.dart';
import '../services/api_manager.dart';
import '../utils/failure.dart';

class TaskRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, OrderModel>> createTask({parameters}) async {
    // var parameters = {
    //   "taskId": "T2",
    //   "assignee": "admin",
    //   "type": "Pickup and Delivery",
    //   "pickupDetails": [
    //     {
    //       "name": "santhosh",
    //       "phone": "666666666",
    //       "email": "email@add.to",
    //       "orderDetails": {
    //         "taskDetails": [
    //           {"items": "item1"},
    //           {"items": "item2"}
    //         ]
    //       }
    //     }
    //   ],
    //   "deliveryDetails": [
    //     {
    //       "name": "kumar",
    //       "phone": "55555555",
    //       "email": "email@add.to",
    //       "orderDetails": {
    //         "taskDetails": [
    //           {"items": "item1"},
    //           {"items": "item2"}
    //         ]
    //       }
    //     }
    //   ]
    // };

    try {
      print("inside order repository");
      // var jsonResponse = json.decode(await getJson());
      var jsonResponse = await _apiManager.post(
        "https://5ti3frg6nk.execute-api.ap-south-1.amazonaws.com/v1/get-tasks",
        // "http://ec2-3-111-2-150.ap-south-1.compute.amazonaws.com:8080/famto-backend/api/task/",
        // "http://192.168.1.3:8080/api/orders/",
        // "http://10.0.2.2:8080/api/orders/",

        parameters,
        isTokenMandatory: false,
      );

      var response = OrderModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
