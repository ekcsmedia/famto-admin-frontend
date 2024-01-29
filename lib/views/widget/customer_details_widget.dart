import 'package:flutter/material.dart'  hide DatePickerTheme;
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controller/customer_controller.dart';
import '../../controller/dashboard_controller.dart';

class CustomerDetailsWidget extends StatelessWidget {
  CustomerDetailsWidget({super.key});
  final DashboardController _dashboardController = Get.find();
  final CustomerController _customerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Flexible(
        flex: 4,
        child: _customerController.isDataLoading ? Center(
          child: CircularProgressIndicator(),
        ) : SingleChildScrollView(

          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              _dataSet1(),
              _dataSet2(),
              _divider(),
              _version(),
              _divider(),
              _tags(),
              _divider(),
              _ratings(),
              _divider(),
              _orderDetailsWidget(context),
            ],
          )),
        )));
  }

  Padding _orderDetailsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_orderDetailsHeader(), _dataTableWidget(context)],
      ),
    );
  }

  Text _orderDetailsHeader() {
    return Text("Orders Details",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20));
  }

  Padding _dataTableWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: _dataTable(context),
      ),
    );
  }

  DataTable _dataTable(BuildContext context) {
    return DataTable(
        columnSpacing: 22,
        border: TableBorder.all(color: Colors.blue),
        headingRowColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          return Theme.of(context).colorScheme.primary.withOpacity(0.30);
        }),
        columns: [
          DataColumn(label: Text('Order ID')),
          DataColumn(label: Text('Order Status')),
          DataColumn(label: Text('Restaurant')),
          DataColumn(label: Text('Delivery Mode')),
          DataColumn(
            label: Text('Order Time'),
          ),
          DataColumn(label: Text('Scheduled Delivery Time')),
          DataColumn(
            label: Text('Payment Mode'),
          ),
          DataColumn(
            label: Text('Order Preparation Time'),
          ),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text("12345")),
            DataCell(Text("Completed")),
            DataCell(Text("Restaurant")),
            DataCell(Text("Take Away")),
            DataCell(Text("July 04 2023")),
            DataCell(Text("July 04 2023")),
            DataCell(Text("Cash")),
            DataCell(Text("5 min")),
          ])
        ]);
  }

  Row _header() {
    return Row(
      children: [
        _backArrow(),
        _headerCustomer(),
      ],
    );
  }

  Padding _backArrow() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: IconButton(
         icon: Icon(Icons.arrow_back),
          color: Colors.black, onPressed: () {
          _dashboardController.setPage("customer listing");
        },
        ));
  }

  Padding _headerCustomer() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              width: 200,
              child: Text(
                'Customers',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
        ],
      ),
    );
  }

  _dataSet1() {
    return Obx(() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          _customerDataWidget(key: "Id", value: _customerController.customerData?.customerId.toString()),
          _customerDataWidget(key: "Name", value: _customerController.customerData?.name ?? ""),
          _customerDataWidget(key: "Email", value: _customerController.customerData?.email ?? ""),
          _customerDataWidget(key: "Phone", value: _customerController.customerData?.phone ?? ""),
          _customerDataWidget(key: "Platform", value: _customerController.customerData?.lastUsedPlatform ?? ""),
        ],
      ),
    ),);
  }

   _dataSet2() {
    return Obx(() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          _customerDataWidget(key: "Wallet Balance", value: _customerController.customerData?.walletBalance.toString()),
          _customerDataWidget(key: "Registration Date", value: _customerController.customerData?.registerAt.toString()),
          _customerDataWidget(key: "COD Status", value: _customerController.customerData?.codStatus.toString()),
          _customerDataWidget(key: "Pay Later Status", value: _customerController.customerData?.payLaterStatus.toString()),
          _customerDataWidget(key: "Referral code", value: _customerController.customerData?.referralCode ?? ""),
        ],
      ),
    ));
  }

  Padding _version() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Versions",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              _customerDataWidget(key: "WEB", value: "Version 1.0.0"),
            ],
          ),
        ],
      ),
    );
  }

  _ratings() {
    return Obx(() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rating",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              _customerDataWidget(key: "John Doe", value: _customerController.customerData?.rateAndReview.toString() ?? "0"),
            ],
          ),
        ],
      ),
    ),);
  }

  Padding _tags() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          _customerDataWidget(key: "Tags", value: "Cloud Kitchen"),
        ],
      ),
    );
  }

  Padding _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }

  Padding _customerDataWidget({key, value}) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                key,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(value.toString())
            ],
          ),
        ));
  }
}
