import 'package:famto_admin_app/controller/order_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/customer_all_model.dart';
import '../model/customer_model.dart';
import '../repository/customer_management_repository.dart';

class CustomerController extends GetxController {

  final CustomerManagementRepository _customerRepository =
  CustomerManagementRepository();

  final RxBool _isDataLoading =  false.obs;
  bool get isDataLoading  => _isDataLoading.value;

  final RxString _errorMessage = "".obs;
  String get errorMessage  => _errorMessage.value;
  setErrorMessage() {
    _errorMessage.value = "";
  }

  OrderController orderController = OrderController();

  final Rx<CustomerModel> _selectedCustomer = CustomerModel().obs;
  CustomerModel get selectedCustomer  => _selectedCustomer.value;
  setCustomer(value) {
    _selectedCustomer.value = value;
  }

  final Rx<CustomerModel?> _customerData = CustomerModel().obs;
  CustomerModel? get customerData  => _customerData.value;

  final Rx<CustomerAll> _customerList = CustomerAll().obs;
  CustomerAll get customerList  => _customerList.value;

  final Rx<TextEditingController> _nameController = TextEditingController().obs;
  TextEditingController get nameController  => _nameController.value;

  final Rx<TextEditingController> _emailController = TextEditingController().obs;
  TextEditingController get emailController  => _emailController.value;

  final Rx<TextEditingController> _passwordController = TextEditingController().obs;
  TextEditingController get passwordController  => _passwordController.value;

  final Rx<TextEditingController> _phoneNumberController = TextEditingController().obs;
  TextEditingController get phoneNumberController  => _phoneNumberController.value;



  createCustomer() async {
    _isDataLoading(true);

    print(nameController.text);

    var parameter = {
      "name" : nameController.text,
      "email" : emailController.text,
      "phone" : phoneNumberController.text,
      // "password" : passwordController.text
    };
    var response = await _customerRepository.createCustomer(
        parameter);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "successfully added a customer";
      _customerData.value = data.payload;
      // orderController.setCustomerData("${data.payload?.name ?? ""} + ${data.payload?.phone ?? ""}");
      getCustomerDataAll();
      });
  }

  getCustomerById(int id) async {
    _isDataLoading(true);
    var response = await _customerRepository.getCustomerById(id);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _customerData.value = data.payload;
      _customerData.refresh();
    });
  }

  deleteDeliveryCategory(int id) async {
    _isDataLoading(true);
    var response = await _customerRepository.deleteCustomer(id);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
    });
  }

  getCustomerDataAll() async {
    _isDataLoading(true);
    var response = await _customerRepository.getCustomerDetailsAll();
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _customerList.value = data;
      _customerList.refresh();
    });
  }

  getCustomerDataSearchResult(query) async {
    _isDataLoading(true);
    var response = await _customerRepository.getCustomersByNameSearch(query);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _customerList.value = data;
      _customerList.refresh();
    });
  }

}

