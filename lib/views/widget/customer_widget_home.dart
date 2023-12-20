import 'package:flutter/material.dart'  hide DatePickerTheme;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../controller/dashboard_controller.dart';

class CustomerListing extends StatelessWidget {
   CustomerListing({super.key});
  final DashboardController _dashboardController = Get.find();
   final ScrollController1 = ScrollController();


   @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 4,
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 200, child: Text('Customers')),
                ],
              ),
            ),
            SizedBox(
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Search Customer'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: ScrollController1,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: ScrollController1,
                    child: DataTable(
                        border: TableBorder.all(color: Colors.blue),
                        headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.30);
                        }),
                        columns: [
                          DataColumn(
                              label: InkWell(onTap: () {}, child: Text('Id'))),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Email')),
                          DataColumn(
                            label: Text('Phone'),
                          ),
                          DataColumn(label: Text('Platform')),
                          DataColumn(
                            label: Text("Registration Date"),
                            onSort: (columnIndex, ascending) {},
                          ),
                          DataColumn(label: Text('Rating')),
                          DataColumn(
                            label: Text('Wallet Balance'),
                          ),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(InkWell(
                                child: Text("12345"),
                              onTap: () {
                                _dashboardController.setPage("customer details");
                              },
                            )),
                            DataCell(Text("Ruban")),
                            DataCell(Text("ruban@mail.go")),
                            DataCell(Text("99999888888")),
                            DataCell(Text("Web")),
                            DataCell(Text("July 04 2023")),
                            DataCell(Text("5")),
                            DataCell(Text("Wallet Balance")),
                            DataCell(IconButton(
                              icon: Icon(Icons.more_horiz),
                              onPressed: () {},
                            )),
                          ])
                        ]),
                  ),
                ),
              ),
            )
          ],
        )));
  }
}
