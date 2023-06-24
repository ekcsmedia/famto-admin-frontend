import 'package:famto_admin_app/controller/task_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/task_details.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({String? orderType, super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final TaskManagementController _taskManagementController =
      TaskManagementController();

  List<TaskDetails> taskDetailsList = [];

  @override
  void initState() {
    super.initState();
  }

  void removeSetAt(index) {
    print(taskDetailsList.toString());
    setState(() {
      taskDetailsList.removeAt(index);
      _taskManagementController.removeTaskDetailsListPickup(index);
    });
    print(taskDetailsList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DataTable(
          showCheckboxColumn: false,
          columnSpacing: 20,
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'S.No',
                style: TextStyle(
                    fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Items',
                style: TextStyle(
                    fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Qty',
                style: TextStyle(
                    fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Amount',
                style: TextStyle(
                    fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Action',
                style: TextStyle(
                    fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: [
            for (var i = 0; i < taskDetailsList.length; i++)
              DataRow(
                  key: ObjectKey(taskDetailsList[i]),
                  onSelectChanged: (bool) => print("select $bool"),
                  cells: [
                    // SET NUMBER
                    DataCell(Text("${i + 1}")),
                    // ITEM
                    DataCell(Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: TextFormField(
                            initialValue: "${taskDetailsList[i].items}",
                            onChanged: (value) {
                              setState(() {
                                taskDetailsList[i].items = value;
                                _taskManagementController
                                    .taskListPickup[i].items = value;
                              });
                            },
                            cursorColor: Colors.black,
                            decoration: new InputDecoration(
                              isDense: true,
                              fillColor: Colors.grey[200],
                              filled: true,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            )))),
                    // WEIGHT
                    DataCell(Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: TextFormField(
                            // initialValue: "${taskDetailsList[i].qty}",
                            onChanged: (value) {
                              // setState(() {
                              //   taskDetailsList[i].qty = value as double?;
                              //   _taskManagementController
                              //       .taskListPickup[i].qty = value as double?;
                              // });
                            },
                            cursorColor: Colors.black,
                            decoration: new InputDecoration(
                              isDense: true,
                              fillColor: Colors.grey[200],
                              filled: true,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            )))),
                    // REPS
                    DataCell(Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: TextFormField(
                            // initialValue: "${taskDetailsList[i].amount}",
                            onChanged: (value) {
                              // setState(() {
                              //   taskDetailsList[i].amount = double.parse(value);

                              //   _taskManagementController.taskListPickup[i]
                              //       .amount = value as double?;
                              // });
                            },
                            cursorColor: Colors.black,
                            decoration: new InputDecoration(
                              isDense: true,
                              fillColor: Colors.grey[200],
                              filled: true,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            )))),
                    DataCell(Container(
                      width: MediaQuery.of(context).size.width * 0.05,
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => removeSetAt(i),
                        color: Colors.black,
                      ),
                    ))
                  ])
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: InkWell(
              onTap: () {
                setState(() {
                  taskDetailsList
                      .add(TaskDetails(id: 0, items: "", qty: 0.0, amount: 0));
                  _taskManagementController.addTaskDetailsListPickup(
                      TaskDetails(id: 0, items: "", qty: 0.0, amount: 0));
                });
              },
              child: const Text(
                "+ Add Row",
                style: TextStyle(color: Colors.blue),
              )),
        ),
      ],
    );
  }
}
