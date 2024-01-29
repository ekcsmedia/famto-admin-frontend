import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/address_model.dart';
import '../model/customer_model.dart';
import '../model/invoice_model.dart';
import '../model/manage_order_model.dart';
import '../model/product_model.dart';
import '../model/product_price_model.dart';
import '../model/restaurant_model.dart';
import '../model/task_model.dart';
import '../repository/order_management_repository.dart';

class OrderController extends GetxController {
  final OrderRepository _orderRepository = OrderRepository();

  final RxBool _isDataLoading =  false.obs;
  bool get isDataLoading  => _isDataLoading.value;

  final RxString _errorMessage = "".obs;
  String get errorMessage  => _errorMessage.value;

  final _orderModel = TaskModel().obs;
  TaskModel get orderModel => _orderModel.value;

  final _orderManageModel = OrderModel().obs;
  OrderModel get orderManageModel => _orderManageModel.value;

  final _pickupAddressModel = AddressModel().obs;
  AddressModel get pickupAddressModel => _pickupAddressModel.value;
  setPickUpAddress(value) => _pickupAddressModel.value =value;

  final _deliveryAddressModel = AddressModel().obs;
  AddressModel get deliveryAddressModel => _deliveryAddressModel.value;
  setDeliveryAddress(value) => _deliveryAddressModel.value =value;

  final _customerModel = CustomerModel().obs;
  get customerModel => _customerModel;

  final _productModel = ProductModel().obs;
  get productModel => _productModel;

  final _productPriceModel = ProductPriceModel().obs;
  get productPriceModel => _productPriceModel;

  final _restaurantModel = RestaurantModel().obs;
  get restaurantModel => _restaurantModel;

  final _invoiceModel = InvoiceModel().obs;
  get invoiceModel => _invoiceModel;
  setInvoice(value) => _invoiceModel.value = value;



  final Rx<TextEditingController> _deliveryMethod = TextEditingController(text: "").obs;
  TextEditingController get deliveryMethod => _deliveryMethod.value;
  setDeliveryMethod(value) {
    _deliveryMethod.value.text = value ?? "";
  }
  final Rx<TextEditingController> _pickupName = TextEditingController(text: "").obs;
  TextEditingController get pickupName => _pickupName.value;

  final Rx<TextEditingController> _pickupPhone = TextEditingController(text: "").obs;
  TextEditingController get pickupPhone => _pickupPhone.value;

  final Rx<TextEditingController> _pickupEmail = TextEditingController(text: "").obs;
  TextEditingController get pickupEmail => _pickupEmail.value;

  final Rx<TextEditingController> _orderStatus = TextEditingController(text: "Order Placed").obs;
  TextEditingController get orderStatus => _orderStatus.value;

  final Rx<TextEditingController> _suggestions = TextEditingController(text: "").obs;
  TextEditingController get suggestions => _suggestions.value;

  final Rx<TextEditingController> _deliveryOption = TextEditingController(text: "").obs;
  TextEditingController get deliveryOption => _deliveryOption.value;
  setDeliveryOption(value) {
    _deliveryOption.value.text = value ?? "";
  }
  final Rx<TextEditingController> _filterCustomerData = TextEditingController(text: "").obs;
  TextEditingController get filterCustomerData => _filterCustomerData.value;

  clearCustomerSearchInput(){
    _filterCustomerData.value.clear();
    _filterCustomerData.refresh();
  }

  // setCustomerData(value){
  //   _filterCustomerData.value.text = value;
  //   _filterCustomerData.refresh();
  // }


  final RxList<TaskModel> _orderModelAll = <TaskModel>[].obs;
  List<TaskModel> get orderModelAll => _orderModelAll;

  final Rx<CustomerModel> _selectedCustomer = CustomerModel().obs;
  CustomerModel get selectedCustomer  => _selectedCustomer.value;
  setCustomer(value) {
    _selectedCustomer.value = value;
  }

  final Rx<RestaurantModel> _selectedRestaurant = RestaurantModel().obs;
  RestaurantModel get selectedRestaurant  => _selectedRestaurant.value;

  setRestaurant(value) {
    _selectedRestaurant.value = value;
    _selectedProducts.value = [];
    _selectedProducts.refresh();
  }


  final RxList<ProductModel> _selectedProducts = <ProductModel>[].obs;
  List<ProductModel> get selectedProducts  => _selectedProducts.value;

  setProductList(value) {
    _selectedProducts.add(value);
    _selectedProducts.refresh();
  }

  refreshProductList() {
    _selectedProducts.refresh();
  }

  totalProductCostCalculation(num cost, int qty){
    num total = cost * qty ;
    return total;
  }

  final Rx<double> _subtotalValue = 0.0.obs;
  double get subtotal => _subtotalValue.value;

  subTotal() {
    double subTotal = 0;
    for(int i=0; i< _selectedProducts.length; i++) {
      if(_selectedProducts[i].totalPrice != null ) {
        subTotal = subTotal + _selectedProducts[i].totalPrice!;
      }
    }
    _subtotalValue.value = subTotal;
    return subTotal;
  }

  deleteProductFromList(index){
    _selectedProducts.removeAt(index);
    _selectedProducts.refresh();
  }



  createOrder() async {
    _isDataLoading(true);

    var parameters = {};

    parameters = {
      "customerData" : selectedCustomer,
      "deliveryMethod" : deliveryMethod.text,
      "pickupName" : pickupName.text,
      "pickupPhone" : pickupPhone.text,
      "pickupEmail" : pickupEmail.text,
      "deliveryOption" : deliveryOption.text,
      "suggestions" : suggestions.text,
      "restaurantDetails" : selectedRestaurant,
      "pickupAddress" : null,
      "deliveryAddress" : null,
      "productsData" : selectedProducts,
      "invoice" : null,
      "orderStatus" : orderStatus.text,
    };

    print("===========");
    print(parameters);

    var response = await _orderRepository.createOrder(parameters: parameters);

    response.fold((failure) {
      print("FAILED");
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      print("SUCCESS");
      _isDataLoading(false);
      _errorMessage.value = "";
      _orderManageModel.value = data;
    });
  }

  getOrderDetails() async {
    var response = await _orderRepository.getOrdersAll();
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      print("-------------");
      print(data.payload?.length);
      print("-------------");
      print(orderModelAll.toString());
      _orderModelAll.value = data.payload ?? [];
    });
  }

  getOrderDetailById(int id) async {
    var response = await _orderRepository.getOrderDetailsByID(id);
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      _orderModel.value = data;
    });
  }

  updateOrderStatus(int id, String status) async {
    var response =
        await _orderRepository.updateOrderStatus(id: id, status: status);
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      _orderModel.value = data;
    });
  }

  updateOrderById(
      {required int id,
      String? status,
      String? phoneNumber,
      String? name,
      String? deliveryType,
      String? vehicleType,
      String? deliveryCharges,
      String? pickupLocation,
      String? deliveryPerson,
      String? dropLocation,
      String? deliveryPersonNumber}) async {
    var response = await _orderRepository.updateOrderByID(
        id: id,
        status: status,
        phoneNumber: phoneNumber,
        name: name,
        deliveryType: deliveryType,
        vehicleType: vehicleType,
        deliveryCharges: deliveryCharges,
        pickupLocation: pickupLocation,
        dropLocation: dropLocation,
        deliveryPerson: deliveryPerson,
        deliveryPersonNumber: deliveryPersonNumber);
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      _orderModel.value = data;
    });
  }

  deleteOrderById(int id) async {
    var response = await _orderRepository.deleteOrderById(id);
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      print(data);
    });
  }
}
