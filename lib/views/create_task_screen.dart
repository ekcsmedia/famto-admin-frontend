// ignore: avoid_web_libraries_in_flutter
import 'dart:html' hide VoidCallback;
import 'dart:js' hide context;

import 'package:famto_admin_app/controller/task_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_web/flutter_google_places_web.dart';
import 'package:get/get.dart';
import 'package:google_maps/google_maps.dart' hide Icon hide Padding;
import 'package:map_location_picker/map_location_picker.dart' as mlp;
import 'dart:ui' as ui hide VoidCallback;

import '../model/task_details.dart';
import 'map_view_order.dart';
import 'order_details_table.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TaskManagementController _taskManagementController =
      TaskManagementController();

  List<TextEditingController> _textEditingControllerList =
      <TextEditingController>[];

  var countRow = 1;
  String test = '';

  String? valueAtCell1;

  String? address;
  String? autocompletePlace;

  DataRow dataRow = DataRow(
    onSelectChanged: (value) {},
    cells: <DataCell>[
      DataCell(TextField()),
      DataCell(TextField()),
      DataCell(TextField()),
      DataCell(IconButton(onPressed: () {}, icon: const Icon(Icons.delete))),
    ],
  );

  List<DataRow> listDataRow = <DataRow>[];

  Widget getMap() {
    String htmlId = "2";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng1 = new LatLng(30.2669444, -97.7427778);
      final myLatlng2 = new LatLng(29.2669444, -97.7427778);
      final myLatlng3 = new LatLng(31.2669444, -97.7427778);

      final mapOptions = new MapOptions()
        ..zoom = 8
        ..center = new LatLng(30.2669444, -97.7427778);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = new GMap(elem, mapOptions);

      final markers = <Marker>[
        Marker(MarkerOptions()
          ..position = myLatlng1
          ..map = map
          ..title = 'Hello Suvi!'),
        Marker(MarkerOptions()
          ..position = myLatlng2
          ..map = map
          ..title = 'Hello Laddu!'),
        Marker(MarkerOptions()
          ..position = myLatlng3
          ..map = map
          ..title = 'Hello Santhosh!')
      ];

      // Marker(MarkerOptions()
      //   ..position = myLatlng2
      //   ..map = map
      //   ..title = 'Hi World!');

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createTaskForm(),
          _mapView(),
        ],
      ),
    );
  }

  _createTaskForm() {
    return Obx(() => Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'New Task',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal),
                      value: _taskManagementController.selectedTeamValue,
                      items: _taskManagementController.teamList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        _taskManagementController.selectedTeamValue =
                            value.toString();
                      },
                      hint: const Text("Select Assignee"),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal),
                      value: _taskManagementController.taskTypeValue,
                      items: _taskManagementController.taskTypeList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        _taskManagementController.taskTypeValue =
                            value.toString();
                      },
                      hint: const Text("Select Task Type"),
                    ),
                  ),
                ),
                Obx(
                  () => Column(
                    children: [
                      for (var i = 0;
                          i < _taskManagementController.pickupListValue.length;
                          i++)
                        _pickupWidget(i),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          _taskManagementController.addPickupAndOrderDetails();
                          // _taskManagementController.addOrderDetailsPickup();
                        },
                        child: Text("Add Pickup")),
                  ),
                ),
                Obx(
                  () => Column(
                    children: [
                      for (var i = 0;
                          i <
                              _taskManagementController
                                  .deliveryListValue.length;
                          i++)
                        _deliveryWidget(i),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          _taskManagementController
                              .addDeliveryAndOrderDetails();
                          // _taskManagementController.addOrderDetailsDelivery();
                        },
                        child: Text("Add Delivery")),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          // _taskManagementController.createTask();
                        },
                        child: Text("Assign Agent")),
                    ElevatedButton(
                        onPressed: () {
                          _taskManagementController.createTask();
                        },
                        child: Text("Create Task")),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                // FlutterGooglePlacesWeb(
                //   apiKey: "AIzaSyDoEWQJI9N4EtAH11h7p3yKzm73rlgcFxY",
                //   // proxyURL: 'https://cors-anywhere.herokuapp.com/',
                //   // proxyURL: "https://app.cors.bridged.cc/",
                //   required: true,
                // ),
                TextButton(
                  onPressed: () {
                    print(FlutterGooglePlacesWeb.value[
                        'name']); // '1600 Amphitheatre Parkway, Mountain View, CA, USA'
                    print(FlutterGooglePlacesWeb
                        .value['streetAddress']); // '1600 Amphitheatre Parkway'
                    print(FlutterGooglePlacesWeb.value['city']); // 'CA'
                    print(FlutterGooglePlacesWeb.value['country']);
                    setState(() {
                      test = FlutterGooglePlacesWeb.value['name'] ?? '';
                    });
                  },
                  child: Text('Press to test'),
                ),
                Text(test),
              ],
            ),
          ),
        ));
  }

  _pickupWidget(int i) {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.grey[300],
              title: const Text("Pick Up", style: TextStyle(fontSize: 12)),
              trailing: i == 0
                  ? const SizedBox.shrink()
                  : IconButton(
                      onPressed: () {
                        _taskManagementController.removePickup(i);
                      },
                      icon: const Icon(Icons.delete)),
              children: [
                Column(
                  children: [
                    _addAgentRowFormField(
                      label1: "Name",
                      label2: "Phone Number",
                      onChanged1: (value) {
                        _taskManagementController.pickupList[i].name = value;
                      },
                      onChanged2: (value) {
                        _taskManagementController.pickupList[i].phone = value;
                      },
                    ),
                    _addAgentRowFormField(
                      label1: "Email",
                      label2: "Order ID",
                      onChanged1: (value) {
                        _taskManagementController.pickupList[i].email = value;
                      },
                      onChanged2: (value) {
                        _taskManagementController.pickupList[i].orderId = value;
                      },
                    ),
                    _pickupDropTextField(
                        label: "Pickup Address",
                        onChanged: (value) {
                          _taskManagementController
                              .pickupList[i].pickupAddress = value;
                        }),
                    FlutterGooglePlacesWeb(
                      apiKey: "AIzaSyDoEWQJI9N4EtAH11h7p3yKzm73rlgcFxY",
                      proxyURL: 'https://cors-anywhere.herokuapp.com/',
                      required: true,
                      // controller: TextEditingController(
                      //     text: _taskManagementController
                      //         .pickupList[i].pickupAddress),
                    ),
                    _pickupDropTextField(
                        label: "Pickup Before",
                        onChanged: (value) {
                          _taskManagementController.pickupList[i].pickupBefore =
                              value as DateTime;
                        }),
                    _pickupDropTextField(
                        label: "Description",
                        onChanged: (value) {
                          _taskManagementController.pickupList[i].description =
                              value;
                        }),
                    _selectTemplatePickup(),
                    _orderFieldsHeader(),
                    _taskDetailsHeader(
                      type: "Pickup",
                      i: i,
                      list: _taskManagementController
                          .pickupList[i].orderDetails?.taskDetails,
                    ),
                    _keyValueWidget(
                        key: "Special Instructions",
                        value: "Special Instructions",
                        onChanged: (value) {
                          _taskManagementController
                              .pickupList[i].orderDetails?.instructions = value;
                        }),
                    _keyValueWidget(
                        key: "Tip",
                        value: "Tip",
                        onChanged: (value) {
                          _taskManagementController
                              .pickupList[i].orderDetails?.tip = value;
                        }),
                    _keyValueWidget(
                        key: "Delivery Charges",
                        value: "Delivery Charges",
                        onChanged: (value) {
                          _taskManagementController.pickupList[i].orderDetails
                              ?.deliveryCharges = double.parse(value);
                        }),
                    _keyValueWidget(
                      key: "Discount",
                      value: "Value",
                      onChanged: (value) {
                        _taskManagementController.pickupList[i].orderDetails
                            ?.discount = double.parse(value);
                      },
                    ),
                    _keyValueWidget(
                      key: "Payment Type",
                      value: "Value",
                      onChanged: (value) {
                        _taskManagementController
                            .pickupList[i].orderDetails?.paymentType = value;
                      },
                    ),
                    _keyValueWidget(
                      key: "Sub Total",
                      value: "Value",
                      onChanged: (value) {
                        _taskManagementController.pickupList[i].orderDetails
                            ?.subTotal = double.parse(value);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                )
              ]),
        ));
  }

  SizedBox _selectTemplatePickup() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton(
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal),
          value: _taskManagementController.templateTypeValue,
          items: _taskManagementController.templateList
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (value) {
            _taskManagementController.templateTypeValue = value.toString();
          },
          hint: const Text("Select Template"),
        ),
      ),
    );
  }

  _deliveryWidget(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: const Text("Delivery", style: TextStyle(fontSize: 12)),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.grey[300],
        trailing: i == 0
            ? const SizedBox.shrink()
            : IconButton(
                onPressed: () {
                  _taskManagementController.removeDelivery(i);
                },
                icon: const Icon(Icons.delete)),
        children: [
          Column(
            children: [
              _addAgentRowFormField(
                label1: "Name",
                label2: "Phone Number",
                onChanged1: (value) {
                  _taskManagementController.deliveryList[i].name = value;
                },
                onChanged2: (value) {
                  _taskManagementController.deliveryList[i].phone = value;
                },
              ),
              _addAgentRowFormField(
                label1: "Email",
                label2: "Order ID",
                onChanged1: (value) {
                  _taskManagementController.deliveryList[i].email = value;
                },
                onChanged2: (value) {
                  _taskManagementController.deliveryList[i].orderId = value;
                },
              ),
              _pickupDropTextField(
                  label: "Delivery Address",
                  onChanged: (value) {
                    _taskManagementController.deliveryList[i].pickupAddress =
                        value;
                  }),
              FlutterGooglePlacesWeb(
                apiKey: "AIzaSyDoEWQJI9N4EtAH11h7p3yKzm73rlgcFxY",
                proxyURL: 'https://cors-anywhere.herokuapp.com/',
                required: true,
                // controller: TextEditingController(
                //     text: _taskManagementController
                //         .deliveryList[i].pickupAddress),
              ),
              _pickupDropTextField(
                  label: "Delivery Before",
                  onChanged: (value) {
                    _taskManagementController.deliveryList[i].deliveryBefore =
                        value as DateTime;
                  }),
              _pickupDropTextField(
                  label: "Description",
                  onChanged: (value) {
                    _taskManagementController.deliveryList[i].description =
                        value;
                  }),
              _selectTemplate(),
              _orderFieldsHeader(),
              _taskDetailsHeader(
                  type: "Delivery",
                  i: i,
                  list: _taskManagementController
                      .deliveryList[i].orderDetails?.taskDetails),
              _keyValueWidget(
                  key: "Special Instructions",
                  value: "Special Instructions",
                  onChanged: (value) {
                    _taskManagementController
                        .deliveryList[i].orderDetails?.instructions = value;
                  }),
              _keyValueWidget(
                  key: "Tip",
                  value: "Tip",
                  onChanged: (value) {
                    _taskManagementController
                        .deliveryList[i].orderDetails?.tip = value;
                  }),
              _keyValueWidget(
                  key: "Delivery Charges",
                  value: "Delivery Charges",
                  onChanged: (value) {
                    _taskManagementController.deliveryList[i].orderDetails
                        ?.deliveryCharges = value as double;
                  }),
              _keyValueWidget(
                  key: "Discount",
                  value: "Discount",
                  onChanged: (value) {
                    _taskManagementController.deliveryList[i].orderDetails
                        ?.discount = value as double;
                  }),
              _keyValueWidget(
                  key: "Payment Type",
                  value: "Payment Type",
                  onChanged: (value) {
                    _taskManagementController
                        .deliveryList[i].orderDetails?.paymentType = value;
                  }),
              _keyValueWidget(
                  key: "Sub Total",
                  value: "Sub Total",
                  onChanged: (value) {
                    _taskManagementController.deliveryList[i].orderDetails
                        ?.subTotal = value as double;
                  }),
              const SizedBox(
                height: 20,
              )
            ],
          )
        ],
      ),
    );
  }

  SizedBox _selectTemplate() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton(
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal),
          value: _taskManagementController.templateTypeValue,
          items: _taskManagementController.templateList
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _taskManagementController.templateTypeValue = value.toString();
            });
          },
          hint: const Text("Select Template"),
        ),
      ),
    );
  }

  _orderFieldsHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: const Center(
                child: Text(
              "Label",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
          Container(
            width: 400,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: const Center(
                child: Text(
              "Value",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          )
        ],
      ),
    );
  }

  _taskDetailsHeader({String? type, int? i, List<TaskDetails>? list}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: Colors.transparent,
                width: 0.5,
              ),
            ),
            child: const Center(child: Text("Task Details")),
          ),
          Column(
            children: [
              Container(
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                child: OrderDetailsScreen(
                  taskDetailsList: list,
                  orderType: type ?? "",
                  index: i ?? 0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding _editCellRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _dataCell(),
          _dataCell(),
          _dataCell(),
          Container(
            width: 80,
            child: Center(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        countRow--;
                      });
                    },
                    icon: const Icon(Icons.delete))),
          )
        ],
      ),
    );
  }

  _dataCell() => Container(
        width: 80,
        height: 50,
        child: TextField(
          maxLines: 1,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal),
          decoration: InputDecoration(
              hintText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              )),
        ),
      );

  // _taskDetailsHeaderAndCells({String label = ""}) {
  //   return Container(
  //       width: 80,
  //       height: 50,
  //       decoration: BoxDecoration(
  //         border: Border.all(
  //           color: Colors.grey,
  //           width: 0.5,
  //         ),
  //       ),
  //       child: Center(
  //         child:
  //             Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
  //       ));
  // }

  _keyValueWidget(
      {String key = "", String value = "", Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: Center(child: Text(key)),
          ),
          Container(
            width: 400,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                maxLines: 1,
                onChanged: onChanged,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal),
                decoration: InputDecoration(
                    hintText: value,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _pickupDropTextField(
      {String? label = "", Function(String)? onChanged}) {
    return SizedBox(
      width: 600,
      child: TextFormField(
        maxLines: 3,
        onChanged: onChanged,
        style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal),
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }

  ListTile _addAgentRowFormField(
      {String? label1 = "",
      String? label2 = "",
      TextEditingController? controller1,
      TextEditingController? controller2,
      Function(String)? onChanged1,
      Function(String)? onChanged2}) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 200,
            child: TextFormField(
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              decoration: InputDecoration(
                labelText: label1,
              ),
              controller: controller1,
              onChanged: onChanged1,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              decoration: InputDecoration(
                labelText: label2,
              ),
              controller: controller2,
              onChanged: onChanged2,
            ),
          ),
        ],
      ),
    );
  }

  _mapView() {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      // child: mapView(),
      child: mlp.MapLocationPicker(
        apiKey: "AIzaSyDoEWQJI9N4EtAH11h7p3yKzm73rlgcFxY",
        popOnNextButtonTaped: false,
        currentLatLng: const mlp.LatLng(8.524139, 76.936638),
        onNext: (mlp.GeocodingResult? result) {
          if (result != null) {
            setState(() {
              address = result.formattedAddress ?? "";
              print("$address");
            });
          }
        },
        onSuggestionSelected: (mlp.PlacesDetailsResponse? result) {
          if (result != null) {
            setState(() {
              autocompletePlace = result.result.formattedAddress ?? "";
              print("$autocompletePlace --  hi");
            });
          }
        },
      ),
      // getMap(),
    );
  }
}
