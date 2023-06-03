import 'dart:async';

import 'package:famto_admin_app/controller/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../model/delivery_person_registration_model.dart';
import 'delivery_person_registration.dart';

class DeliveryPersonManagementScreen extends StatefulWidget {
  const DeliveryPersonManagementScreen({super.key});

  @override
  State<DeliveryPersonManagementScreen> createState() =>
      _DeliveryPersonManagementScreenState();
}

class _DeliveryPersonManagementScreenState
    extends State<DeliveryPersonManagementScreen> {
  String page = '';
  final RegistrationController _registrationController =
      Get.put(RegistrationController());

  late Stream<List<DeliveryPersonRegistration>> _stream;

  @override
  void initState() {
    // TODO: implement initState
    // _registrationController.getDeliveryPersonRegistrationDetailsAll();
    _stream = getDeliveryPersonList();
    super.initState();
  }

  final StreamController<List<DeliveryPersonRegistration>> _userController =
      StreamController<List<DeliveryPersonRegistration>>();

  Stream<List<DeliveryPersonRegistration>> getDeliveryPersonList() async* {
    yield* Stream.periodic(const Duration(seconds: 5), (_) {
      _registrationController.getDeliveryPersonRegistrationDetailsAll();
      List<DeliveryPersonRegistration> list = [];
      list = _registrationController.registrationAllDataModel;
      return list;
    }).asyncMap((event) async => event);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Container(
              color: Colors.grey[300],
              child: Column(
                children: [
                  ListTile(
                    title: Text('List Delivery Person'),
                    onTap: () {
                      setState(() {
                        page = 'List Delivery Person';
                        _registrationController
                            .getDeliveryPersonRegistrationDetailsAll();
                      });
                    },
                  ),
                  ListTile(
                    title: Text('Create Delivery Person'),
                    onTap: () {
                      setState(() {
                        _registrationController.setEditMode = false;
                        _registrationController.clearData();
                        page = 'Create Delivery Person';
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        page == "List Delivery Person" && !_registrationController.isEditMode
            ? Flexible(
                flex: 5,
                child: StreamBuilder(
                  stream: _stream,
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? Container(
                            // color: Colors.blue[400],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              child: ListView.builder(
                                itemCount: snapshot.data?.length ?? 0,
                                // _registrationController
                                // .registrationAllDataModel.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.all(10),
                                      tileColor: Colors.grey[300],
                                      onTap: () {
                                        int id = 0;
                                        id = snapshot
                                                .data?[index].deliveryUserId ??
                                            0;
                                        _registrationController
                                            .getDeliveryPersonRegistrationDetail(
                                                id);
                                      },
                                      leading: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 60, 103, 139),
                                          image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                    .data?[index].photo ??
                                                'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                                                const Text("Name",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16)),
                                                Text(
                                                    snapshot.data?[index]
                                                            .name ??
                                                        "",
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontStyle:
                                                            FontStyle.italic)),
                                              ]),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Phone Number",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16)),
                                              Text(
                                                  snapshot.data?[index]
                                                          .phoneNumber ??
                                                      "",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontStyle:
                                                          FontStyle.italic)),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Status",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16)),
                                              Text(
                                                  snapshot.data?[index]
                                                          .status ??
                                                      "",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontStyle:
                                                          FontStyle.italic)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : const CircularProgressIndicator();
                  },
                ),
              )
            : Flexible(flex: 5, child: DeliveryPersonRegistrationForm()),
        page == "List Delivery Person"
            ? Obx(
                () => Flexible(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                                InkWell(
                                    onTap: () {
                                      _registrationController.setEditMode =
                                          true;
                                      int id = 0;
                                      id = _registrationController
                                              .registrationModel
                                              .deliveryUserId ??
                                          0;
                                      _registrationController
                                          .getDeliveryPersonRegistrationDetail(
                                              id);
                                    },
                                    child: Icon(
                                      Icons.edit,
                                    ))
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
                            Text(
                                "Availability: ${_registrationController.registrationModel.availability}"),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  int id = 0;
                                  id = _registrationController
                                          .registrationModel.deliveryUserId ??
                                      0;
                                  _registrationController
                                      .updateDeliveryPersonRegistrationStatus(
                                          id: id, status: "Approved");
                                },
                                child: Text("Approve")),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  int id = 0;
                                  id = _registrationController
                                          .registrationModel.deliveryUserId ??
                                      0;
                                  _registrationController
                                      .updateDeliveryPersonRegistrationStatus(
                                          id: id, status: "Rejected");
                                },
                                child: Text("Reject")),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  int id = 0;
                                  id = _registrationController
                                          .registrationModel.deliveryUserId ??
                                      0;
                                  _registrationController
                                      .updateDeliveryPersonRegistrationStatus(
                                          id: id, status: "Hold");
                                },
                                child: Text("Hold")),

                            // String? phoneNumber;
                            // String? name;
                            // String? address;
                            // String? pan;
                            // String? photo;
                            // String? aadhaar;
                            // String? drivingLicense;
                            // String? status;
                            // String? vehicleRegistration;
                            // String? emergencyContact;
                            // bool? availability;
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
