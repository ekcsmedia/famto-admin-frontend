import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomerDetailsWidget extends StatelessWidget {
  const CustomerDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 4,
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                      DataColumn(label: Text('Id')),
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
                        DataCell(Text("12345")),
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
            )
          ],
        )));
  }
}
