import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/dashboard_controller.dart';
import '../controller/restaurant_management_controller.dart';

class RestaurantListing extends StatefulWidget {
  RestaurantListing({super.key});

  @override
  State<RestaurantListing> createState() => _RestaurantListingState();
}

class _RestaurantListingState extends State<RestaurantListing> {
  final DashboardController _dashboardController = Get.find();
  final RestaurantManagementController _restaurantController = Get.put(RestaurantManagementController());
  final scrollController2 = ScrollController();

  String logoImageUrl = "";
  String bannerImageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 4,
        child: Obx (() => Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 200, child: Text('Restaurants')),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 400,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Search Records'),
                        onChanged: (value) {
                          _restaurantController.getRestaurantDetailsByNameSearch(value);
                        },
                      ),
                    ),
                  ),
                ),
                _addRestaurant(context),
              ],
            ),
            _restaurantController.isDataLoading ? Center( child: CircularProgressIndicator()) :Obx(() => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Scrollbar(
                thumbVisibility: true,
                controller: scrollController2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController2,
                  child: DataTable(
                      border: TableBorder.all(color: Colors.blue),
                      headingRowColor:
                          MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                        return Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.30);
                      }),
                      columns: [
                        DataColumn(label: Text('StoreId')),
                        DataColumn(label: Text('Restaurant Name')),
                        DataColumn(label: Text('Address')),
                        DataColumn(
                          label: Text('Phone'),
                        ),
                        DataColumn(label: Text('Email')),
                        DataColumn(
                          label: Text("Rating"),
                          onSort: (columnIndex, ascending) {},
                        ),
                        DataColumn(label: Text('Serviceable')),
                        DataColumn(
                          label: Text('Status'),
                        ),
                        DataColumn(label: Text('Stripe Account Status')),
                        DataColumn(label: Text('City')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: _rowList()),
                ),
              ),
            )),
          ],
        ))));
  }

  List<DataRow> _rowList() {
    List<DataRow> _dataRow = [];
    for (int i = 0;
    i < _restaurantController.restaurantList!.payload!.length;
    i++) {
      DataRow dataRow =
      DataRow(cells: [
        DataCell(InkWell(
          child: Text(_restaurantController.restaurantList!.payload![i].restaurantId
              .toString()),
          onTap: () {
            int id = _restaurantController.restaurantList!.payload![i].restaurantId ?? 0;
            _dashboardController.setPage("restaurant details");
            _restaurantController.getRestaurantById(id);
          },
        )),
        DataCell(Text(_restaurantController.restaurantList.payload![i].restaurantName ?? "")),
        DataCell(
            Text(_restaurantController.restaurantList.payload![i].address ?? "")),
        DataCell(
            Text(_restaurantController.restaurantList.payload![i].phone ?? "")),
        DataCell(Text(
            _restaurantController.restaurantList.payload![i].email ??
                "")),
        DataCell(Text(_restaurantController.restaurantList.payload![i].rating
            .toString() ??
            "")),
        DataCell(Text(_restaurantController.restaurantList.payload![i].serviceStatus == true ? "OPEN" : "CLOSED"
            .toString() ??
            "")),
        DataCell(Text(_restaurantController.restaurantList.payload![i].serviceStatus
            .toString() ??
            "")),
        DataCell(Text("-")),
        DataCell(Text(_restaurantController.restaurantList.payload![i].city
            .toString() ??
            "")),
        DataCell(IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: () {},
        )),
      ]);
      _dataRow.add(dataRow);
    }
    return _dataRow;
  }

  _addRestaurant(context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: ElevatedButton(
        onPressed: () {
          _showMyDialog(context);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
        child:
            const Text("Add Restaurant", style: TextStyle(color: Colors.black)),
      ),
    );
  }

  Future _showMyDialog(context) async {
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Restaurant Data'),
          content:
          SingleChildScrollView(
            child: ListBody(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'NAME',
                            ),
                            controller: _restaurantController.nameController,
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'EMAIL',
                            ),
                            controller: _restaurantController.emailController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'PHONE',
                            ),
                            controller: _restaurantController.phoneController,
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'ADDRESS',
                            ),
                            controller: _restaurantController.addressController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'DISPLAY ADDRESS',
                            ),
                            controller: _restaurantController.displayAddressController,
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'RESTAURANT NAME',
                            ),
                            controller: _restaurantController.restaurantNameController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'DESCRIPTION',
                            ),
                            controller: _restaurantController.descriptionController,
                            minLines: 3,
                            maxLines: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: _uploadBannerButton(),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: _uploadLogoButton(),
                          ),
                        ),
                  ])
                      ),
                    ],
                  ),
                ),
                // Row(
                //   children: [
                //     Padding(
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                //       child: TextFormField(
                //         decoration: InputDecoration(
                //           border: UnderlineInputBorder(),
                //           labelText: 'PHONE',
                //         ),
                //       ),
                //     ),
                //     Padding(
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                //       child: TextFormField(
                //         decoration: InputDecoration(
                //           border: UnderlineInputBorder(),
                //           labelText: 'ADDRESS',
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // Row(
                //   children: [
                //     Padding(
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                //       child: TextFormField(
                //         decoration: InputDecoration(
                //           border: UnderlineInputBorder(),
                //           labelText: 'DISPLAY ADDRESS',
                //         ),
                //       ),
                //     ),
                //     Padding(
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                //       child: TextFormField(
                //         decoration: InputDecoration(
                //           border: UnderlineInputBorder(),
                //           labelText: 'RESTAURANT NAME',
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       border: UnderlineInputBorder(),
                //       labelText: 'DESCRIPTION',
                //     ),
                //   ),
                // ),
                // Row(
                //   children: [
                //     _uploadLogoButton(),
                //     _uploadBannerButton(),
                //   ],
                // ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add Restaurant'),
              onPressed: () {
                _restaurantController.createRestaurant();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  ElevatedButton _uploadLogoButton() {
    return ElevatedButton(
        onPressed: () async {
          String url = "";
          XFile? image = await selectPicture(ImageSource.gallery);
          String? path = image?.path;
          String? name = image?.name;
          if (image != null && path != null && name != null) {
            Uint8List imageData = await XFile(path).readAsBytes();
            FirebaseStorage storage = FirebaseStorage.instance;
            Reference ref = storage
                .ref()
                .child("images/restaurant/logo/$name-${DateTime.now()}");
            UploadTask uploadTask = ref.putData(imageData);
            uploadTask.then((res) async {
              url = await res.ref.getDownloadURL();

              setState(() {
                logoImageUrl = url;
                _restaurantController.logoUrl = url;
              });
            });
          }
        },
        child: Text("Upload Logo Photo"));
  }

  ElevatedButton _uploadBannerButton() {
    return ElevatedButton(
        onPressed: () async {
          String url = "";
          XFile? image = await selectPicture(ImageSource.gallery);
          String? path = image?.path;
          String? name = image?.name;
          if (image != null && path != null && name != null) {
            Uint8List imageData = await XFile(path).readAsBytes();
            FirebaseStorage storage = FirebaseStorage.instance;
            Reference ref = storage
                .ref()
                .child("images/restaurant/banner/$name-${DateTime.now()}");
            UploadTask uploadTask = ref.putData(imageData);
            uploadTask.then((res) async {
              url = await res.ref.getDownloadURL();
              setState(() {
                bannerImageUrl = url;
                _restaurantController.bannerUrl = url;
              });
            });
          }
        },
        child: Text("Upload Banner Image"));
  }

  Future<XFile?> selectPicture(ImageSource source) async {
    XFile? image;
    image = await ImagePicker().pickImage(
      source: source,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    return image;
  }
}
