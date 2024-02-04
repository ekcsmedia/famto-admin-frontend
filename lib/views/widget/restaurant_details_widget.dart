import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../controller/dashboard_controller.dart';
import '../../controller/restaurant_management_controller.dart';

class RestaurantDetailsWidget extends StatefulWidget {
  RestaurantDetailsWidget({super.key});

  final bool value = false;

  @override
  State<RestaurantDetailsWidget> createState() =>
      _RestaurantDetailsWidgetState();
}

class _RestaurantDetailsWidgetState extends State<RestaurantDetailsWidget> {
  final DashboardController _dashboardController = Get.find();
  final ScrollController2 = ScrollController();
  final RestaurantManagementController _restaurantController =
      Get.put(RestaurantManagementController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  bool isSponsorshipSwitched = false;

  void sponsorshipToggleSwitch(bool value) {
    if (isSponsorshipSwitched == false) {
      setState(() {
        isSponsorshipSwitched = true;
      });
    } else {
      setState(() {
        isSponsorshipSwitched = false;
      });
    }
  }

  bool isTagSwitched = false;

  void tagToggleSwitch(bool value) {
    if (isTagSwitched == false) {
      setState(() {
        isTagSwitched = true;
      });
    } else {
      setState(() {
        isTagSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              _dataSet1(),
              _dataSet2(),
              _dataSet3(),
              _dataSet4(),
              _divider(),
              _servingArea(),
              _divider(),
              _sponsorship(),
              _divider(),
              _tags(),
              _divider(),
            ],
          ),
        ),
      ),
    );
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
      child: Scrollbar(
        thumbVisibility: true,
        controller: ScrollController2,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: ScrollController2,
          child: _dataTable(context),
        ),
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
          onPressed: () {
            _dashboardController.setPage("restaurant listing");
          },
          color: Colors.black,
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
              child: Column(
                children: [
                  Text(
                    'Restaurant',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Obx(() => Text(
                    _restaurantController.restaurantData?.restaurantName ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey),
                  ),)
                ],
              )),
        ],
      ),
    );
  }

  Padding _dataSet1() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          _restaurantDataWidget(
              key: "Id",
              value: _restaurantController.restaurantData?.restaurantId
                      .toString() ??
                  ""),
          _restaurantDataWidget(
              key: "Name",
              value: _restaurantController.restaurantData?.contactName ?? ""),
          _restaurantDataWidget(
              key: "Email",
              value: _restaurantController.restaurantData?.email ?? ""),
          _restaurantDataWidget(
              key: "Phone",
              value: _restaurantController.restaurantData?.phone ?? ""),
          _restaurantDataWidget(
              key: "Address",
              value: _restaurantController.restaurantData?.address ?? ""),
        ],
      ),
    );
  }

  Padding _dataSet2() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          _restaurantDataWidget(
              key: "Display Address",
              value: _restaurantController.restaurantData?.displayAddress ?? ""),
          _restaurantDataWidget(
              key: "Restaurant Name",
              value: _restaurantController.restaurantData?.restaurantName ?? ""),
          _restaurantDataWidget(
              key: "Description",
              value: _restaurantController.restaurantData?.description ?? ""),
          _restaurantDataWidget(key: "Slug", value: "Slug description"),
          _restaurantDataWidget(
              key: "Logo",
              value: _restaurantController.restaurantData?.logoUrl ?? "logoUrl"),
        ],
      ),
    );
  }

  Padding _dataSet3() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          _restaurantDataWidget(
              key: "Banner Image Web",
              value: _restaurantController.restaurantData?.bannerUrl ?? ""),
          _restaurantDataWidget(
              key: "Banner Image Mobile", value: "Image Url Mobile"),
          _restaurantDataWidget(key: "Background Color", value: "Blue"),
          _restaurantDataWidget(key: "Rating Bar Color", value: "Red"),
          _restaurantDataWidget(
              key: "Link City",
              value: _restaurantController.restaurantData?.city ?? ""),
        ],
      ),
    );
  }

  Padding _dataSet4() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          _restaurantDataWidget(
              key: "Status",
              value: _restaurantController.restaurantData?.serviceStatus ?? ""),
          _restaurantDataWidget(
              key: "Custom Tag",
              value: _restaurantController.restaurantData?.restaurantTags == null
                  ? ""
                  : _restaurantController.restaurantData?.restaurantTags
                      .toString()),
        ],
      ),
    );
  }

  Padding _servingArea() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Serving Area",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Radio(value: "value", groupValue: "Group", onChanged: (value) {}),
            ],
          ),
        ],
      ),
    );
  }

  Padding _sponsorship() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          const Text("Sponsorship"),
          Switch(
            onChanged: sponsorshipToggleSwitch,
            value: isSponsorshipSwitched,
            activeColor: Colors.blue,
            activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Padding _tags() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          const Text("Tags"),
          Switch(
            onChanged: tagToggleSwitch,
            value: isTagSwitched,
            activeColor: Colors.blue,
            activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
          ),
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

  Padding _restaurantDataWidget({key, value}) {
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
