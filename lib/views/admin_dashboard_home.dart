import 'package:famto_admin_app/views/widget/create_order_widget.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';

import '../controller/customer_controller.dart';
import '../controller/dashboard_controller.dart';
import '../controller/order_management_controller.dart';
import '../controller/product_management_controller.dart';
import '../controller/restaurant_management_controller.dart';
import '../model/customer_model.dart';
import '../model/product_model.dart';
import '../model/restaurant_model.dart';
import 'delivery_person_dashboard.dart';
import 'widget/customer_widget_home.dart';
import 'restaurants_widget_home.dart';
import 'widget/customer_details_widget.dart';
import 'widget/product_catalogue_widget.dart';
import 'widget/restaurant_details_widget.dart';

class AdminDashBoardHome extends StatefulWidget {
  const AdminDashBoardHome({super.key});

  @override
  State<AdminDashBoardHome> createState() => _AdminDashBoardHomeState();
}

class _AdminDashBoardHomeState extends State<AdminDashBoardHome> {
  final DashboardController _dashboardController =
      Get.put(DashboardController());
  final CustomerController _customerController = Get.put(CustomerController());
  final RestaurantManagementController _restaurantManagementController =
      Get.put(RestaurantManagementController());
  final OrderController _orderController = Get.put(OrderController());
  final ProductController _productController = Get.put(ProductController());

  String deliveryMethod = "Take Away";
  String deliveryOption = "On Demand";
  bool addCustomer = false;
  final scrollController3 = ScrollController();
  @override
  void initState() {
    _customerController.getCustomerDataAll();
    _restaurantManagementController.getRestaurantDetailsAll();
    // TODO: implement initState
    super.initState();
  }

//
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text('Admin Dashboard'),
              IconButton(
                icon: Icon(Icons.delivery_dining),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeliveryAgentDashboard(),
                      // DeliveryAgentDashboard(
                      //   itemFreePersonList: _registrationController.freeDeliveryPerson,
                      //   itemBusy: _registrationController.busyDeliveryPerson,
                      // ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        body: Obx(
          () => Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 0.5,
                  ),
                ),
                // color: Colors.green,
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Home'),
                      selected: _dashboardController.pageSelected == 'Home'
                          ? true
                          : false,
                      selectedColor: Colors.blue,
                      onTap: () {
                        _dashboardController.setPage("Home");
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.list),
                      title: Text('Orders'),
                      selected: _dashboardController.pageSelected ==
                                  'Orders Listing' ||
                              _dashboardController.pageSelected ==
                                  "Create Order"
                          ? true
                          : false,
                      selectedColor: Colors.blue,
                      onTap: () {
                        _dashboardController.setPage("Orders Listing");
                        addCustomer = false;

                        setState(() {});
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.restaurant),
                      title: Text('Restaurants'),
                      selected:
                          _dashboardController.pageSelected == 'Restaurants'
                              ? true
                              : false,
                      selectedColor: Colors.blue,
                      onTap: () {
                        _restaurantManagementController
                            .getRestaurantDetailsAll();
                        _dashboardController.setPage("restaurant listing");
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_bag),
                      title: Text('Products'),
                      selected: _dashboardController.pageSelected == 'catalogue'
                          ? true
                          : false,
                      selectedColor: Colors.blue,
                      onTap: () {
                        _dashboardController.setPage("catalogue");
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.people),
                      title: Text('Customers'),
                      selected: _dashboardController.pageSelected == 'Customers'
                          ? true
                          : false,
                      selectedColor: Colors.blue,
                      onTap: () {
                        _dashboardController.setPage("customer listing");
                        _customerController.getCustomerDataAll();
                      },
                    )
                  ],
                ),
                // child: Column(children: [
                // InkWell(
                //   onTap: () {},
                //   child: ListTile(
                //     leading: Icon(Icons.home),
                //     title: Text('Home'),
                //   ),
                // ),
                // InkWell(F
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const Placeholder()),
                //     );
                //   },
                //   child: ListTile(
                //     leading: Icon(Icons.list),
                //     title: Text('Orders'),
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const Placeholder()),
                //     );
                //   },
                //   child: ListTile(
                //     leading: Icon(Icons.restaurant),
                //     title: Text('Restaurants'),
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const Placeholder()),
                //     );
                //   },
                //   child: ListTile(
                //     leading: Icon(Icons.shopping_bag),
                //     title: Text('Products'),
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const Placeholder()),
                //     );
                //   },
                //   child: ListTile(
                //     leading: Icon(Icons.shopping_bag),
                //     title: Text('Customers'),
                //   ),
                // )
                // ]
                // ),
              ),
            ),
            _dashboardController.pageSelected == "Orders Listing"
                ? Flexible(
                    flex: 4,
                    child: Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Order Status'),
                              _createOrderButton(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Scrollbar(
                            thumbVisibility: true,
                            controller: scrollController3,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              controller: scrollController3,
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
                                    DataColumn(label: Text('Order ID')),
                                    DataColumn(label: Text('Order Status')),
                                    DataColumn(label: Text('Restaurant')),
                                    DataColumn(
                                      label: Text('Customer'),
                                    ),
                                    DataColumn(label: Text('Delivery Mode')),
                                    DataColumn(label: Text('Delivery Agent')),
                                    DataColumn(
                                      label: Text('Order Time'),
                                      onSort: (columnIndex, ascending) {},
                                    ),
                                    DataColumn(
                                        label: Text('Scheduled Delivery Time')),
                                    DataColumn(
                                      label: Text('Payment Mode'),
                                    ),
                                    DataColumn(label: Text('Address')),
                                    DataColumn(label: Text('Amount')),
                                    DataColumn(
                                      label: Text('Payment Status '),
                                    ),
                                    DataColumn(
                                      label: Text('Rating '),
                                    ),
                                    DataColumn(
                                      label: Text('Order Preparation Time'),
                                    ),
                                    DataColumn(
                                      label: Text('Device Type '),
                                    ),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(Text("12345")),
                                      DataCell(Text("Completed")),
                                      DataCell(Text("Restaurant")),
                                      DataCell(Text("Ruban")),
                                      DataCell(Text("Take Away")),
                                      DataCell(Text("Agent Name")),
                                      DataCell(Text("July 04 2023")),
                                      DataCell(Text("July 04 2023")),
                                      DataCell(Text("Cash")),
                                      DataCell(Text("address: abc, xyz")),
                                      DataCell(Text("Rs.110")),
                                      DataCell(Text("-")),
                                      DataCell(Text("-")),
                                      DataCell(Text("5 min")),
                                      DataCell(Text("Web")),
                                    ])
                                  ]),
                            ),
                          ),
                        )
                      ],
                    )))
                : _dashboardController.pageSelected == "Create Order"
                    ? CreateOrderWidget()
                    : _dashboardController.pageSelected == "customer listing"
                        ? CustomerListing()
                        : _dashboardController.pageSelected ==
                                "restaurant listing"
                            ? RestaurantListing()
                            : _dashboardController.pageSelected == "catalogue"
                                ? ProductCatalogueScreen()
                                : _dashboardController.pageSelected ==
                                        "customer details"
                                    ? CustomerDetailsWidget()
                                    : _dashboardController.pageSelected ==
                                            "restaurant details"
                                        ? RestaurantDetailsWidget()
                                        : Flexible(
                                            flex: 4, child: SizedBox.shrink())
          ]),
        ));
  }

  Row _orderCostDetails(text1, text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 120, child: Text(text1)),
        SizedBox(width: 120, child: Text(text2)),
      ],
    );
  }

  SizedBox _spacer() {
    return SizedBox(
      height: 20,
    );
  }

  ElevatedButton _createOrderButton() {
    return ElevatedButton(
      onPressed: () {
        _dashboardController.setPage("Create Order");
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
      child: const Text("Create Order", style: TextStyle(color: Colors.black)),
    );
  }
}
