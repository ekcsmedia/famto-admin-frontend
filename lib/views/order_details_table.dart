import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final List<OrderSet> _sets = <OrderSet>[];

  void removeSetAt(index) {
    print(_sets);
    setState(() {
      _sets.removeAt(index);
    });
    print(_sets);
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
            for (var i = 0; i < _sets.length; i++)
              DataRow(
                  key: ObjectKey(_sets[i]),
                  onSelectChanged: (bool) => print("select $bool"),
                  cells: [
                    // SET NUMBER
                    DataCell(Text("${i + 1}")),
                    // ITEM
                    DataCell(Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: TextFormField(
                            initialValue: "${_sets[i].items}",
                            onChanged: (value) {
                              setState(() {
                                _sets[i].items = value;
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
                            initialValue: "${_sets[i].qty}",
                            onChanged: (value) {
                              setState(() {
                                _sets[i].qty = value;
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
                    // REPS
                    DataCell(Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: TextFormField(
                            initialValue: "${_sets[i].amount}",
                            onChanged: (value) {
                              setState(() {
                                _sets[i].amount = value;
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
                _sets.add(OrderSet("", "", "", "", ""));
                setState(() {});
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

class OrderSet {
  String id;
  String items;
  String qty;
  String amount;
  String action;

  OrderSet(this.id, this.items, this.qty, this.amount, this.action);
}
