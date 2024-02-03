import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';

import '../../controller/customer_controller.dart';
import '../../controller/dashboard_controller.dart';
import '../../controller/order_management_controller.dart';
import '../../controller/product_management_controller.dart';
import '../../controller/restaurant_management_controller.dart';
import '../../model/customer_model.dart';
import '../../model/product_model.dart';
import '../../model/restaurant_model.dart';

class CreateOrderWidget extends StatefulWidget {
  CreateOrderWidget({super.key});

  @override
  State<CreateOrderWidget> createState() => _CreateOrderWidgetState();
}

class _CreateOrderWidgetState extends State<CreateOrderWidget> {

  final DashboardController _dashboardController = Get.find();
  final CustomerController _customerController = Get.find();
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
    return Flexible(
          flex: 4,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _errorWidget(),
                  _titleAndArrowWidget(),
                  _spacer(),
                  !addCustomer
                      ? _selectCustomer()
                      : _addCustomers(),
                  _spacer(),
                  _selectDeliveryMethod(),
                  deliveryMethod == "Pick and Drop" ||
                          deliveryMethod == "Home Delivery"
                      ? _spacer()
                      : _sizedBoxShrinkWidget(),
                  deliveryMethod == "Pick and Drop"
                      ? pickUpAddress()
                      : _sizedBoxShrinkWidget(),
                  deliveryMethod == "Pick and Drop"
                      ? _spacer()
                      : _sizedBoxShrinkWidget(),
                  deliveryMethod == "Pick and Drop"
                      ? pickUpDetails()
                      : _sizedBoxShrinkWidget(),
                  deliveryMethod == "Pick and Drop"
                      ? _spacer()
                      : _sizedBoxShrinkWidget(),
                  deliveryMethod == "Pick and Drop" ||
                          deliveryMethod == "Home Delivery"
                      ? selectDeliveryAddress()
                      : _sizedBoxShrinkWidget(),
                  deliveryMethod == "Pick and Drop" ||
                          deliveryMethod == "Home Delivery"
                      ? _spacer()
                      : _sizedBoxShrinkWidget(),
                  _selectDeliveryOption(),
                  _spacer(),
                  _selectRestaurant(),
                  _spacer(),
                  _searchProducts(),
                  _spacer(),
                  _productList(),
                  _spacer(),
                  _suggestionsWidget(),
                  _invoiceButtonWidget(),
                  _invoiceDetailsWidget(),
                  _createOrderButton(),
                ],
              ),
            ),
          ),
        );
  }

  Row _titleAndArrowWidget() {
    return Row(
                  children: [
                    _backArrowWidget(),
                    _orderTitleWidget(),

                    // _createOrderButton(),
                  ],
                );
  }

  IconButton _backArrowWidget() {
    return IconButton(
                      onPressed: () {
                        _dashboardController.setPage("Orders Listing");
                        addCustomer = false;
                      },
                      icon: Icon(Icons.arrow_back_sharp),
                    );
  }

  Text _orderTitleWidget() => Text('Create Order');

  Obx _errorWidget() {
    return Obx(() => Visibility(
                        visible: _customerController.errorMessage.isNotEmpty,
                        child: Row(
                          children: [
                            Text(_customerController.errorMessage),
                            IconButton(
                                onPressed: () {
                                  _customerController.setErrorMessage();
                                },
                                icon: const Icon(Icons.close))
                          ],
                        )));
  }

  SizedBox _sizedBoxShrinkWidget() => SizedBox.shrink();

  Obx _createOrderButton() {
    return Obx(
                  () => Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: ElevatedButton(
                          onPressed: () {
                            _orderController.createOrder();
                          },
                          child: Text(
                              "Create Order - Rs.${_orderController.subtotal * 2.05}")),
                    ),
                  ),
                );
  }

  Obx _invoiceDetailsWidget() {
    return Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 300),
                      SizedBox(
                        width: 350,
                        height: 150,
                        child: Card(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                                itemCount: _orderController
                                        .selectedProducts.length ??
                                    0,
                                shrinkWrap: true,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return _orderCostDetails(
                                    _orderController
                                        .selectedProducts[index].productName,
                                    _orderController
                                        .selectedProducts[index].totalPrice
                                        .toString(),
                                  );
                                }),
                            Divider(),
                            _orderCostDetails(
                              'Sub Total',
                              "Rs.${_orderController.subtotal}",
                            ),
                            _orderCostDetails(
                              'Sales Tax @5%',
                              'Rs.${_orderController.subtotal * 0.05}',
                            ),
                            _orderCostDetails(
                              'GST @100%',
                              'Rs.${_orderController.subtotal * 1.0}',
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                );
  }

  Center _invoiceButtonWidget() {
    return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ElevatedButton(
                        onPressed: () {
                          _orderController.subTotal();
                          _orderController.refreshProductList();
                        },
                        child: Text("Invoices")),
                  ),
                );
  }

  Row _suggestionsWidget() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 300, child: Text('Any Suggestions?')),
                    SizedBox(
                      width: 600,
                      child: TextField(
                        controller: _orderController.suggestions,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Suggestions',
                        ),
                      ),
                    ),
                  ],
                );
  }

  SizedBox _productList() {
    return SizedBox(
                  width: 800,
                  child: ListView.builder(
                      itemCount:
                          _orderController.selectedProducts.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 300),
                            SizedBox(
                              width: 350,
                              height: 100,
                              child: Card(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${_orderController.selectedProducts[index].productName} (Rs.${_orderController.selectedProducts[index].cost})'),
                                      InputQty(
                                        btnColor1: Colors.blue,
                                        btnColor2: Colors.blue,
                                        showMessageLimit: false,
                                        textFieldDecoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        boxDecoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.transparent,
                                              width: 0.0),
                                        ),
                                        maxVal:
                                            double.maxFinite, //max val to go
                                        initVal: 1,
                                        minVal: 1, //min starting val
                                        onQtyChanged: (val) async {
                                          num cost = _orderController
                                                  .selectedProducts[index]
                                                  .cost ??
                                              0;
                                          int? qty = val as int;
                                          num price = await _orderController
                                              .totalProductCostCalculation(
                                                  cost, qty);
                                          _orderController
                                              .selectedProducts[index]
                                              .totalPrice = price as double?;
                                          _orderController.subTotal();
                                          _orderController
                                              .refreshProductList();

                                          //on value changed we may set the value
                                          //setstate could be called
                                        },
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            _orderController
                                                .deleteProductFromList(index);
                                          },
                                          icon: Icon(Icons.delete)),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: Text(
                                        'Rs.${_orderController.selectedProducts[index].totalPrice ?? 0}'),
                                  ),
                                ],
                              )),
                            ),
                          ],
                        );
                      }),
                );
  }

  Obx _searchProducts() {
    return Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 300, child: Text('Search Products')),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: DropdownMenu<ProductModel>(
                          // controller: iconController,
                          enableFilter: true,
                          requestFocusOnTap: true,
                          hintText: "Select Product",
                          leadingIcon: const Icon(Icons.search),
                          inputDecorationTheme: const InputDecorationTheme(
                            filled: true,
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          onSelected: (ProductModel? product) {
                            _orderController.setProductList(product);
                          },
                          dropdownMenuEntries: _productController
                                      .productList.payload ==
                                  null
                              ? []
                              : _productController.productList.payload!
                                  .map<DropdownMenuEntry<ProductModel>>(
                                  (ProductModel product) {
                                    return DropdownMenuEntry<ProductModel>(
                                      value: product,
                                      label: product.productName ?? "null",
                                      leadingIcon: Icon(Icons
                                          .production_quantity_limits_sharp),
                                    );
                                  },
                                ).toList(),
                        ),
                      ),
                    ],
                  ),
                );
  }

  Row _selectRestaurant() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 300, child: Text('Select Restaurants')),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DropdownMenu<RestaurantModel>(
                        // controller: iconController,
                        enableFilter: true,
                        requestFocusOnTap: true,
                        hintText: "Select Restaurant",
                        leadingIcon: const Icon(Icons.search),
                        inputDecorationTheme: const InputDecorationTheme(
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        ),
                        onSelected: (RestaurantModel? restaurant) {
                          _orderController.setRestaurant(restaurant);
                          int? restaurantId = restaurant?.restaurantId ?? 0;
                          _productController
                              .getProductDetailsOfRestaurant(restaurantId);
                        },
                        dropdownMenuEntries: _restaurantManagementController
                                    .restaurantList.payload ==
                                null
                            ? []
                            : _restaurantManagementController
                                .restaurantList.payload!
                                .map<DropdownMenuEntry<RestaurantModel>>(
                                (RestaurantModel restaurant) {
                                  return DropdownMenuEntry<RestaurantModel>(
                                    value: restaurant,
                                    label:
                                        restaurant.restaurantName ?? "null",
                                    leadingIcon: Icon(Icons.restaurant),
                                  );
                                },
                              ).toList(),
                      ),
                    ),
                  ],
                );
  }

  Row _selectDeliveryOption() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 300, child: Text('Select Delivery Option')),
                    SizedBox(
                        width: 600,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 200,
                              child: RadioListTile(
                                title: Text("On Demand"),
                                value: "On Demand",
                                groupValue: deliveryOption,
                                onChanged: (value) {
                                  setState(() {
                                    _orderController
                                        .setDeliveryOption(value);
                                    deliveryOption = value.toString();
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: RadioListTile(
                                title: Text("Scheduling"),
                                value: "Scheduling",
                                groupValue: deliveryOption,
                                onChanged: (value) {
                                  setState(() {
                                    _orderController
                                        .setDeliveryOption(value);
                                    deliveryOption = value.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        )),
                  ],
                );
  }

  Column selectDeliveryAddress() {
    return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  width: 300,
                                  child: Text('Select Delivery Address')),
                              SizedBox(
                                width: 600,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'No address added',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          _spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 250,
                                  height: 100,
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text("Home"),
                                            ),
                                            SizedBox(
                                              width: 100,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                mainAxisSize:
                                                    MainAxisSize.min,
                                                children: [
                                                  IconButton(
                                                    iconSize: 15,
                                                    onPressed: () {},
                                                    icon: Icon(Icons.edit),
                                                  ),
                                                  IconButton(
                                                    iconSize: 15,
                                                    onPressed: () {},
                                                    icon: Icon(Icons.delete),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text(
                                                "Address: abc, xyz",
                                                maxLines: 3,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 100,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                          _spacer(),
                          InkWell(
                              onTap: () {},
                              child: Text(
                                "Add Addresses",
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      );
  }

  Row pickUpDetails() {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 300, child: Text('Pickup Details')),
                          SizedBox(
                            width: 600,
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: TextField(
                                        controller:
                                            _orderController.pickupName,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Name',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: TextField(
                                        controller:
                                            _orderController.pickupPhone,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Phone Number',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 400,
                                  child: TextField(
                                    controller: _orderController.pickupEmail,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Email',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
  }

  Row pickUpAddress() {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 300, child: Text('Pickup Address')),
                          SizedBox(
                            width: 600,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Address',
                              ),
                            ),
                          ),
                        ],
                      );
  }

  Row _selectDeliveryMethod() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 300, child: Text('Select Delivery Method')),
                    SizedBox(
                        width: 600,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 200,
                              child: RadioListTile(
                                title: Text("Take Away"),
                                value: "Take Away",
                                groupValue: deliveryMethod,
                                onChanged: (value) {
                                  setState(() {
                                    _orderController
                                        .setDeliveryMethod(value);
                                    deliveryMethod = value.toString();
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: RadioListTile(
                                title: Text("Home Delivery"),
                                value: "Home Delivery",
                                groupValue: deliveryMethod,
                                onChanged: (value) {
                                  setState(() {
                                    _orderController
                                        .setDeliveryMethod(value);

                                    deliveryMethod = value.toString();
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: RadioListTile(
                                title: Text("Pick and Drop"),
                                value: "Pick and Drop",
                                groupValue: deliveryMethod,
                                onChanged: (value) {
                                  setState(() {
                                    _orderController
                                        .setDeliveryMethod(value);
                                    deliveryMethod = value.toString();
                                  });
                                },
                              ),
                            )
                          ],
                        )),
                  ],
                );
  }

  Row _addCustomers() {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 300, child: Text('Add Customer')),
                          _spacer(),
                          Obx(
                            () => SizedBox(
                              width: 600,
                              height: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 400,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Name',
                                      ),
                                      controller:
                                          _customerController.nameController,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Email',
                                      ),
                                      controller:
                                          _customerController.emailController,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Password',
                                      ),
                                      controller: _customerController
                                          .passwordController,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Phone Number',
                                      ),
                                      controller: _customerController
                                          .phoneNumberController,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              _customerController
                                                  .createCustomer();
                                              addCustomer = false;
                                            });
                                          },
                                          child: Text("Add Customer")),
                                      ElevatedButton(
                                          onPressed: () {
                                            addCustomer = false;
                                            setState(() {});
                                          },
                                          child: Text("Cancel")),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
  }

  Obx _selectCustomer() {
    return Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: 300, child: Text('Select Customer')),
                            _customerController.isDataLoading
                                ? CircularProgressIndicator()
                                : Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: DropdownMenu<CustomerModel>(
                                      controller:
                                          _orderController.filterCustomerData,
                                      enableFilter: true,
                                      requestFocusOnTap: true,
                                      hintText: "Select Customer",
                                      leadingIcon: const Icon(Icons.search),
                                      trailingIcon: IconButton(
                                          onPressed: () {
                                            _orderController
                                                .clearCustomerSearchInput();
                                          },
                                          icon: Icon(Icons.clear)),
                                      inputDecorationTheme:
                                          const InputDecorationTheme(
                                        filled: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5.0),
                                      ),
                                      onSelected: (CustomerModel? customer) {
                                        _orderController
                                            .setCustomer(customer);
                                      },
                                      dropdownMenuEntries: _customerController
                                                  .customerList.payload ==
                                              null
                                          ? []
                                          : _customerController
                                              .customerList.payload!
                                              .map<
                                                  DropdownMenuEntry<
                                                      CustomerModel>>(
                                              (CustomerModel customer) {
                                                return DropdownMenuEntry<
                                                    CustomerModel>(
                                                  value: customer,
                                                  label:
                                                      "${customer.name ?? ""}, ${customer.phone ?? ""}",
                                                  leadingIcon: Icon(
                                                      Icons.person_add_sharp),
                                                );
                                              },
                                            ).toList(),
                                    ),
                                  ),
                            SizedBox(width: 20),
                            IconButton(
                                onPressed: () {
                                  _customerController.getCustomerDataAll();
                                  setState(() {});
                                },
                                icon: Icon(Icons.refresh)),
                            ElevatedButton(
                                onPressed: () {
                                  addCustomer = true;
                                  setState(() {});
                                },
                                child: Text("Add")),
                          ],
                        ),
                      );
  }
}

SizedBox _spacer() {
  return SizedBox(
    height: 20,
  );
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