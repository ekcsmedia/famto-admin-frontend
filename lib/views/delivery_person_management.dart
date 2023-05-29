import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
                      });
                    },
                  ),
                  ListTile(
                    title: Text('Create Delivery Person'),
                    onTap: () {
                      setState(() {
                        page = 'Create Delivery Person';
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        page == "List Delivery Person"
            ? Flexible(
                flex: 5,
                child: Container(
                  // color: Colors.blue[400],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            tileColor: Colors.grey[300],
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 60, 103, 139),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text("Name",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Text("Santhosh Kumar S",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontStyle: FontStyle.italic)),
                                    ]),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Phone Number",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    Text("2222222222",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic)),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Status",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    Text("Approved",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            : Flexible(flex: 5, child: DeliveryPersonRegistrationForm()),
        page != "List Delivery Person"
            ? SizedBox()
            : Flexible(
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
                          Text(
                            "Delivery Person Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
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
                          Text("Address: abc"),
                          SizedBox(
                            height: 20,
                          ),
                          Text("PAN: 1234567890"),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Aadhaar: 1234567890"),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Driving License: 1234567890"),
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
                          Text("Availability: Yes"),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: Text("Approve")),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: Text("Reject")),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(onPressed: () {}, child: Text("Hold")),

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
                )),
      ],
    );
  }
}
