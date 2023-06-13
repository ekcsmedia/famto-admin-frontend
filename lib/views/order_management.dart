import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../controller/order_management_controller.dart';
import '../controller/registration_controller.dart';
import '../model/delivery_person_registration_model.dart';
import '../model/order_model.dart';
import 'widget/gods_view.dart';

class OrderManagementScreen extends StatefulWidget {
  const OrderManagementScreen({super.key});

  @override
  State<OrderManagementScreen> createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends State<OrderManagementScreen> {
  String page = '';
  final RegistrationController _registrationController =
      Get.put(RegistrationController());
  final OrderController _orderController = Get.put(OrderController());

  late Stream<List<OrderModel>> _orderStream;
  late Stream<List<DeliveryPersonRegistration>> _availableDeliveryPersonStream;

  Stream<List<OrderModel>> orderStream() async* {
    yield* Stream.periodic(const Duration(seconds: 5), (_) {
      _orderController.getOrderDetails();
      List<OrderModel> list = [];
      list = _orderController.orderModelAll;
      return list;
    }).asyncMap((event) async => event);
  }

  Stream<List<DeliveryPersonRegistration>>
      availableDeliveryPersonStream() async* {
    yield* Stream.periodic(const Duration(seconds: 5), (_) {
      _registrationController.getDeliveryPersonRegistrationDetailsAll();
      List<DeliveryPersonRegistration> list = [];
      list = _registrationController.registrationAllDataModel
          .where((element) => element.availability == true)
          .toList();
      return list;
    }).asyncMap((event) async => event);
  }

  @override
  void initState() {
    // TODO: implement initState
    _orderStream = orderStream();
    _availableDeliveryPersonStream = availableDeliveryPersonStream();
    // _registrationController.getDeliveryPersonRegistrationDetailsAll();
    // _orderController.getOrderDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: StreamBuilder(
              stream: _orderStream,
              builder: (context, snapshot) => snapshot.hasData
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ExpansionTile(
                              tilePadding: const EdgeInsets.all(10),
                              collapsedBackgroundColor: Colors.grey[400],
                              backgroundColor: Colors.grey[400],
                              leading: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 146, 235, 155),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Order ID",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        Text(
                                            snapshot.data?[index].orderId ?? "",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontStyle: FontStyle.italic)),
                                      ]),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Order Status",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Text(
                                          snapshot.data?[index].status ??
                                              "None",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontStyle: FontStyle.italic)),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Delivery Person",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Text(snapshot.data?[index].name ?? "None",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontStyle: FontStyle.italic)),
                                    ],
                                  ),
                                ],
                              ),
                              children: [
                                Container(
                                  color: Colors.grey[300],
                                  width: 600,
                                  height: 450,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8),
                                    child: ListView(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "Order Details",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Delivery Type: ${snapshot.data?[index].deliveryType}"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text("Name: Santhosh Kumar S"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Phone Number: ${snapshot.data?[index].phoneNumber}"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Pickup: ${snapshot.data?[index].pickupLocation}"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Drop: ${snapshot.data?[index].dropLocation}"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Vehicle Type: ${snapshot.data?[index].vehicleType}"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Status: ${snapshot.data?[index].status}"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Delivery Charges: ${snapshot.data?[index].deliveryCharge}"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Delivery Person: ${snapshot.data?[index].deliveryPerson}"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Delivery Person Phone: ${snapshot.data?[index].deliveryPersonNumber}"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          ),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StreamBuilder(
                              stream: _availableDeliveryPersonStream,
                              builder: (context, snapshot) => snapshot.hasData
                                  ? Container(
                                      color: Colors.yellow,
                                      child: ListView.builder(
                                          itemCount: snapshot.data?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              onTap: () {
                                                _registrationController
                                                    .getDeliveryPersonRegistrationDetail(
                                                        snapshot.data?[index]
                                                                .deliveryUserId ??
                                                            0);
                                              },
                                              title: Text(
                                                  snapshot.data?[index].name ??
                                                      ""),
                                              subtitle: Text(snapshot
                                                      .data?[index]
                                                      .phoneNumber ??
                                                  ""),
                                            );
                                          }),
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                        const Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: GodsViewDart(),
                        ),
                      ]),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(
                    color: Colors.white,
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Obx(
                              () => Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 0),
                                child: Container(
                                  color: Colors.grey[300],
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10),
                                    child: ListView(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Delivery Person Details",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Name: ${_registrationController.registrationModel.name}"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Phone Number: ${_registrationController.registrationModel.phoneNumber}"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Address: ${_registrationController.registrationModel.address}"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "PAN: ${_registrationController.registrationModel.pan}"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Aadhaar: ${_registrationController.registrationModel.aadhaar}"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Driving License: ${_registrationController.registrationModel.drivingLicense}"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Status: ${_registrationController.registrationModel.status}"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Vehicle Registration: ${_registrationController.registrationModel.vehicleRegistration}"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "Emergency Contact: ${_registrationController.registrationModel.emergencyContact}"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        // Text(
                                        //     "Availability: ${_registrationController.registrationModel.availability}"),
                                        // SizedBox(
                                        //   height: 20,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              color: Colors.white12,
                              child: const Text("Assign Order"),
                            ),
                          ),
                        ]),
                  ),
                )
              ]))
        ],
      ),
    );
  }
}
