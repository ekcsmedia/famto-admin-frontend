import 'dart:io';

import 'package:famto_admin_app/controller/delivery_category_management.dart';
import 'package:famto_admin_app/views/delivery_person_registration.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/order_management_controller.dart';
import '../controller/registration_controller.dart';
import 'delivery_person_dashboard.dart';
import 'delivery_person_management.dart';
import 'order_management.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  String page = '';
  final DeliveryCategoryController _deliveryCategoryController =
      Get.put(DeliveryCategoryController());
  final RegistrationController _registrationController =
      Get.put(RegistrationController());
  final OrderController _orderController = Get.put(OrderController());

  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Admin Dashboard'),
            ),
            ListTile(
              title: const Text('Delivery Categories Management'),
              onTap: () {
                setState(() {
                  page = 'Delivery Categories';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Order Management'),
              onTap: () {
                setState(() {
                  page = 'Order Management';
                  _registrationController
                      .getDeliveryPersonRegistrationDetailsAll();
                  _orderController.getOrderDetails();

                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: const Text('User Management'),
              onTap: () {
                setState(() {
                  page = 'User Management';
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: const Text('Delivery Person Management'),
              onTap: () {
                // Navigator.push(
                //   context,
                // MaterialPageRoute(
                //   builder: (context) => const DeliveryAgentDashboard(),
                // ),
                // );
                // setState(() {
                //   // page = 'Delivery Person Management';

                //   // Navigator.pop(context);
                // });
              },
            ),
            ListTile(
              title: const Text('Vendor Management'),
              onTap: () {
                setState(() {
                  page = 'Vendor Management';
                });
              },
            ),
          ],
        ),
      ),
      body: page == 'Delivery Categories'
          ? DeliveryScreen()
          // : page == 'Order Management'
          //     ? const OrderManagementScreen()
          : page == 'List Delivery Categories'
              ? DeliveryCategoryListScreen()
              : page == 'Create Delivery Categories'
                  ? DeliveryCategoryAddScreen()
                  : page == 'Delivery Person Management'
                      ? DeliveryPersonManagement()
                      : page == 'List Delivery Person'
                          ? DeliveryPersonListScreen()
                          : page == 'Create Delivery Person'
                              ? DeliveryPersonRegistrationForm()
                              : Container(),
    );
  }

  // ignore: non_constant_identifier_names
  DeliveryScreen() {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: const Text('List Delivery Categories'),
            onTap: () {
              setState(() {
                page = 'List Delivery Categories';
              });
              _deliveryCategoryController.getDeliveryCategoriesAll();
            },
          ),
          ListTile(
            title: const Text('Create Delivery Categories'),
            onTap: () {
              setState(() {
                page = 'Create Delivery Categories';
              });
            },
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  // OrderManagementScreen() {
  //   return Container(
  //     child: Text('Order Management'),
  //   );
  // }

  DeliveryCategoryListScreen() {
    return Center(
      child: Obx(() => ListView.builder(
            itemCount: _deliveryCategoryController
                    .deliveryCategoryAllModel.payload?.length ??
                0,
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  children: [
                    Text(
                        '${_deliveryCategoryController.deliveryCategoryAllModel.payload?[index].deliveryName}'),
                    const Icon(Icons.edit),
                    InkWell(
                      onTap: () {
                        _deliveryCategoryController.deleteDeliveryCategory(
                            _deliveryCategoryController.deliveryCategoryAllModel
                                    .payload?[index].deliveryId ??
                                0);
                        setState(() {
                          _deliveryCategoryController
                              .deliveryCategoryAllModel.payload
                              ?.removeAt(index);
                        });
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ],
                ),
                onTap: () {},
              );
            },
          )),
    );
  }

  DeliveryCategoryAddScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _deliveryCategoryController.nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Delivery Category Name',
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              getImage(ImageSource.gallery);
            },
            child: const Text('Image upload'),
          ),
          const SizedBox(
            height: 20.0,
          ),
          //if image not null show the image
          //if image null show text
          image != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      //to show image, you type like this.
                      File(image!.path),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                    ),
                  ),
                )
              : const Text(
                  "No Image",
                  style: TextStyle(fontSize: 20),
                ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              _deliveryCategoryController.createDeliveryCategory();
            },
            child: const Text('Create Delivery Category'),
          ),
        ],
      ),
    );
  }

  DeliveryPersonManagement() {
    return const DeliveryPersonManagementScreen();
  }

  DeliveryPersonListScreen() {
    return Container(
      child: const Text('Delivery Person List'),
    );
  }
}
