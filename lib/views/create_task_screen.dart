import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
                    Text(
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
                        icon: Icon(Icons.close)),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic),
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
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic),
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
            ExpansionTile(
              title: Text("Pick Up"),
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
                  ],
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic),
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
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _pickupDropTextField({String? label = ""}) {
    return SizedBox(
      width: 600,
      child: TextFormField(
        maxLines: 3,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic),
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
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic),
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
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic),
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Placeholder(),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
