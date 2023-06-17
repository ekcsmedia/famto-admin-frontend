// ignore: avoid_web_libraries_in_flutter
import 'dart:html' hide VoidCallback;
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' hide Icon hide Padding;
import 'dart:ui' as ui hide VoidCallback;

import 'order_details_table.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  var selectedTeam = 'Admin';
  var teamList = ['Admin', 'Delivery Agent', 'Customer'];

  var taskType = 'Pickup and Delivery';
  var taskTypeList = ['Pickup and Delivery', 'Appointment', 'Field Workforce'];

  var templateType = 'Order Template';
  var templateList = ['Order Template', 'Other Template'];

  var countRow = 1;

  String? valueAtCell1;

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
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = new LatLng(30.2669444, -97.7427778);
      final myLatlng2 = new LatLng(29.2669444, -97.7427778);

      final mapOptions = new MapOptions()
        ..zoom = 8
        ..center = new LatLng(30.2669444, -97.7427778);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = new GMap(elem, mapOptions);

      Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Hello World!');

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
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: SingleChildScrollView(
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
                          // Navigator.pop(context);
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
                  value: selectedTeam,
                  items: teamList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTeam = value.toString();
                    });
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
                  value: taskType,
                  items: taskTypeList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      taskType = value.toString();
                    });
                  },
                  hint: const Text("Select Task Type"),
                ),
              ),
            ),
            _pickupWidget(),
            const SizedBox(
              height: 20,
            ),
            _deliveryWidget(),
          ],
        ),
      ),
    );
  }

  ExpansionTile _pickupWidget() {
    return ExpansionTile(
      title: const Text("Pick Up", style: TextStyle(fontSize: 12)),
      children: [
        Column(
          children: [
            _addAgentRowFormField(
              label1: "Name",
              label2: "Phone Number",
            ),
            _addAgentRowFormField(
              label1: "Email",
              label2: "Order ID",
            ),
            _pickupDropTextField(label: "Pickup Address"),
            _pickupDropTextField(label: "Pickup Before"),
            _pickupDropTextField(label: "Description"),
            _selectTemplatePickup(),
            _orderFieldsHeader(),
            _taskDetailsHeader(),
            _keyValueWidget(key: "Special Instructions", value: "Value"),
            _keyValueWidget(key: "Tip", value: "Value"),
            _keyValueWidget(key: "Delivery Charges", value: "Value"),
            _keyValueWidget(key: "Discount", value: "Value"),
            _keyValueWidget(key: "Payment Type", value: "Value"),
            _keyValueWidget(key: "Sub Total", value: "Value"),
            const SizedBox(
              height: 20,
            )
          ],
        )
      ],
    );
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
          value: templateType,
          items: templateList
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              templateType = value.toString();
            });
          },
          hint: const Text("Select Template"),
        ),
      ),
    );
  }

  ExpansionTile _deliveryWidget() {
    return ExpansionTile(
      title: const Text("Delivery", style: TextStyle(fontSize: 12)),
      children: [
        Column(
          children: [
            _addAgentRowFormField(
              label1: "Name",
              label2: "Phone Number",
            ),
            _addAgentRowFormField(
              label1: "Email",
              label2: "Order ID",
            ),
            _pickupDropTextField(label: "Delivery Address"),
            _pickupDropTextField(label: "Delivery Before"),
            _pickupDropTextField(label: "Description"),
            _selectTemplate(),
            _orderFieldsHeader(),
            _taskDetailsHeader(),
            _keyValueWidget(key: "Special Instructions", value: "Value"),
            _keyValueWidget(key: "Tip", value: "Value"),
            _keyValueWidget(key: "Delivery Charges", value: "Value"),
            _keyValueWidget(key: "Discount", value: "Value"),
            _keyValueWidget(key: "Payment Type", value: "Value"),
            _keyValueWidget(key: "Sub Total", value: "Value"),
            const SizedBox(
              height: 20,
            )
          ],
        )
      ],
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
          value: templateType,
          items: templateList
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              templateType = value.toString();
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

  _taskDetailsHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
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
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                child: OrderDetails(),
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

  _keyValueWidget({String key = "", String value = ""}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
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
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                maxLines: 1,
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

  SizedBox _pickupDropTextField({String? label = ""}) {
    return SizedBox(
      width: 600,
      child: TextFormField(
        maxLines: 3,
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
      TextEditingController? controller2}) {
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
      child: getMap(),
    );
  }
}
