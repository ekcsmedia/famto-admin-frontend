import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrderManagementScreen extends StatefulWidget {
  const OrderManagementScreen({super.key});

  @override
  State<OrderManagementScreen> createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends State<OrderManagementScreen> {
  String page = '';

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
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.all(10),
                      collapsedBackgroundColor: Colors.grey[400],
                      backgroundColor: Colors.grey[400],
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 146, 235, 155),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Order ID",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Text("1234567890",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic)),
                              ]),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order Status",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Text("Yet to be Assigned",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Delivery Person",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Text("Yet to be Assigned",
                                  style: TextStyle(
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
                            padding: const EdgeInsets.only(left: 8.0, top: 8),
                            child: ListView(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Order Details",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Delivery Type: Single Delivery"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Name: Santhosh Kumar S"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Phone Number: 2222222222"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Pickup: abc"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Drop: xyz"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Vehicle Type: Bike"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Status: Approved"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Vehicle Registration: 1234567890"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Emergency Contact: 1234567890"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Delivery Charges: 100"),
                                SizedBox(
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
                          child: Container(
                            color: Colors.yellow,
                            child: Text("Order Details"),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            color: Colors.pink,
                            child: Text("Order Details"),
                          ),
                        ),
                      ]),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    color: Colors.purple,
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              color: Colors.green,
                              child: Text("Order Details"),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              color: Colors.blue,
                              child: Text("Order Details"),
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
