import 'package:get/get.dart';
import '../model/task_model.dart';
import '../repository/order_management_repository.dart';

class OrderController extends GetxController {
  final OrderRepository _orderRepository = OrderRepository();

  final RxBool _isDataLoading =  false.obs;
  bool get isDataLoading  => _isDataLoading.value;

  final RxString _errorMessage = "".obs;
  String get errorMessage  => _errorMessage.value;
  final _orderModel = TaskModel().obs;
  TaskModel get orderModel => _orderModel.value;

  final RxList<TaskModel> _orderModelAll = <TaskModel>[].obs;
  List<TaskModel> get orderModelAll => _orderModelAll;


  createOrder({parameters}) async {
    _isDataLoading(true);

    var response = await _orderRepository.createOrder(parameters: parameters);

    response.fold((failure) {
      print("FAILED");
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _orderModel.value = data;
      // print("Test Name: ${data.name} ${data.deliveryType}");
    });
  }

  getOrderDetails() async {
    var response = await _orderRepository.getOrdersAll();
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      print("-------------");
      print(data.payload?.length);
      print("-------------");
      print(orderModelAll.toString());
      _orderModelAll.value = data.payload ?? [];
    });
  }

  getOrderDetailById(int id) async {
    var response = await _orderRepository.getOrderDetailsByID(id);
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      _orderModel.value = data;
    });
  }

  updateOrderStatus(int id, String status) async {
    var response =
        await _orderRepository.updateOrderStatus(id: id, status: status);
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      _orderModel.value = data;
    });
  }

  updateOrderById(
      {required int id,
      String? status,
      String? phoneNumber,
      String? name,
      String? deliveryType,
      String? vehicleType,
      String? deliveryCharges,
      String? pickupLocation,
      String? deliveryPerson,
      String? dropLocation,
      String? deliveryPersonNumber}) async {
    var response = await _orderRepository.updateOrderByID(
        id: id,
        status: status,
        phoneNumber: phoneNumber,
        name: name,
        deliveryType: deliveryType,
        vehicleType: vehicleType,
        deliveryCharges: deliveryCharges,
        pickupLocation: pickupLocation,
        dropLocation: dropLocation,
        deliveryPerson: deliveryPerson,
        deliveryPersonNumber: deliveryPersonNumber);
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      _orderModel.value = data;
    });
  }

  deleteOrderById(int id) async {
    var response = await _orderRepository.deleteOrderById(id);
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      print(data);
    });
  }
}
