import 'package:dartz/dartz.dart';
import 'package:famto_admin_app/model/order_details_model.dart';
import 'package:famto_admin_app/views/create_task_screen.dart';
import 'package:get/get.dart';

import '../model/delivery_model.dart';
import '../model/order_model.dart';
import '../model/pickup_model.dart';
import '../model/task_details.dart';
import '../repository/task_management_repo.dart';

class TaskManagementController extends GetxController {
  final _orderModel = OrderModel().obs;
  OrderModel get orderModel => _orderModel.value;

  RxList<OrderDetails> orderDetailsDeliveryList = <OrderDetails>[
    OrderDetails(
      taskDetails: [],
      instructions: "",
      tip: "",
      deliveryCharges: 0.0,
      discount: 0.0,
      paymentType: "",
      subTotal: 0.0,
    )
  ].obs;

  List<OrderDetails> get orderDetailsDeliveryListValue =>
      orderDetailsDeliveryList.value;

  RxList<OrderDetails> orderDetailsPickUpList = <OrderDetails>[
    OrderDetails(
      taskDetails: [],
      instructions: "",
      tip: "",
      deliveryCharges: 0.0,
      discount: 0.0,
      paymentType: "",
      subTotal: 0.0,
    )
  ].obs;

  List<OrderDetails> get orderDetailsPickUpListValue =>
      orderDetailsPickUpList.value;

  // OrderDetails get orderDetails => _orderDetails.value;

  // final _taskDetails = TaskDetails().obs;
  // TaskDetails get taskDetails => _taskDetails.value;

  RxList<TaskDetails> taskListPickup = <TaskDetails>[].obs;
  List<TaskDetails> get taskListPickupValue => taskListPickup.value;

  addTaskDetailsListPickup(TaskDetails taskDetails) {
    taskListPickup.add(taskDetails);
    print(taskListPickupValue.length);
    print(taskListPickupValue[0].items);
  }

  removeTaskDetailsListPickup(index) {
    taskListPickup.removeAt(index);
    print(taskListPickupValue.length);
  }

  List<TaskDetails> taskListDelivery = [];

  final _pickUpDetails = Pickup().obs;
  Pickup get pickUpDetails => _pickUpDetails.value;

  RxList<Pickup> pickupList = <Pickup>[
    Pickup(
      name: "",
      phone: "",
      email: "",
      orderId: "",
      pickupAddress: "",
      pickupBefore: DateTime.now(),
      description: "",
      imageUrl: "",
      template: "",
      orderDetails: OrderDetails(),
    )
  ].obs;

  List<Pickup> get pickupListValue => pickupList.value;

  addPickup() {
    pickupList.add(Pickup(
      name: "",
      phone: "",
      email: "",
      orderId: "",
      pickupAddress: "",
      pickupBefore: DateTime.now(),
      description: "",
      imageUrl: "",
      template: "",
      orderDetails: OrderDetails(),
    ));
    print(taskListPickupValue.length);
    print(taskListPickupValue[0].items);
  }

  removePickup(index) {
    pickupList.removeAt(index);
  }

  final _deliveryDetails = Delivery().obs;
  Delivery get deliveryDetails => _deliveryDetails.value;

  RxList<Delivery> deliveryList = <Delivery>[
    Delivery(
      name: "",
      phone: "",
      email: "",
      orderId: "",
      pickupAddress: "",
      deliveryBefore: DateTime.now(),
      description: "",
      imageUrl: "",
      template: "",
      orderDetails: OrderDetails(),
    )
  ].obs;

  List<Delivery> get deliveryListValue => deliveryList.value;

  addDelivery() {
    deliveryList.add(Delivery(
      name: "",
      phone: "",
      email: "",
      orderId: "",
      pickupAddress: "",
      deliveryBefore: DateTime.now(),
      description: "",
      imageUrl: "",
      template: "",
      orderDetails: OrderDetails(),
    ));
  }

  removeDelivery(index) {
    deliveryList.removeAt(index);
  }

  final _taskRepo = TaskRepo();

  var teamList = ['Admin', 'Delivery Agent', 'Customer'];
  Rx<String> selectedTeam = 'Admin'.obs;
  get selectedTeamValue => selectedTeam.value;
  set selectedTeamValue(value) => selectedTeam.value = value;

  var taskTypeList = ['Pickup and Delivery', 'Appointment', 'Field Workforce'];
  Rx<String> taskType = 'Pickup and Delivery'.obs;
  get taskTypeValue => taskType.value;
  set taskTypeValue(value) => taskType.value = value;

  var templateList = ['Order Template', 'Other Template'];
  Rx<String> templateType = 'Order Template'.obs;
  get templateTypeValue => templateType.value;
  set templateTypeValue(value) => templateType.value = value;

  createTask() async {
    print("inside create task");

    for (int i = 0; i < pickupList.length; i++) {
      pickupList[i].template = templateTypeValue;
      pickupList[i].orderDetails = orderDetailsPickUpListValue[i];
    }
    for (int i = 0; i < deliveryList.length; i++) {
      deliveryList[i].template = templateTypeValue;
      deliveryList[i].orderDetails = orderDetailsDeliveryListValue[i];
    }
    for (int i = 0; i < orderDetailsPickUpListValue.length; i++) {
      orderDetailsPickUpListValue[i].taskDetails =
          taskListPickupValue.toSet().toList();
    }
    for (int i = 0; i < orderDetailsDeliveryListValue.length; i++) {
      orderDetailsDeliveryListValue[i].taskDetails =
          taskListDelivery.toSet().toList();
    }

    orderModel.assignee = selectedTeamValue;
    orderModel.type = taskTypeValue;
    orderModel.pickupDetails = pickupListValue;
    orderModel.deliveryDetails = deliveryListValue;

    print("-----------------");
    print(orderModel.toJson());
    print("-----------------");

    var response = await _taskRepo.createTask(parameters: orderModel);

    response.fold((failure) {
      print("FAILED");
    }, (data) async {
      print("Success");
    });
  }
}
