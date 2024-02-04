import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/restaurant_all_model.dart';
import '../model/restaurant_model.dart';
import '../repository/restaurant_management_repository.dart';

class RestaurantManagementController extends GetxController {
  final RestaurantManagementRepository _restaurantRepository =
      RestaurantManagementRepository();

  final RxBool _isDataLoading = false.obs;
  bool get isDataLoading => _isDataLoading.value;

  final RxString _errorMessage = "".obs;
  String get errorMessage => _errorMessage.value;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;
  final TextEditingController _addressController = TextEditingController();
  TextEditingController get addressController => _addressController;
  final TextEditingController _displayAddressController =
      TextEditingController();
  TextEditingController get displayAddressController =>
      _displayAddressController;
  final TextEditingController _restaurantNameController =
      TextEditingController();
  TextEditingController get restaurantNameController =>
      _restaurantNameController;
  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  final RxString _logoUrl = "".obs;
  String get logoUrl => _logoUrl.value;
  set logoUrl(value) => _logoUrl.value = value;

  final RxString _bannerUrl = "".obs;
  String get bannerUrl => _bannerUrl.value;
  set bannerUrl(value) => _bannerUrl.value = value;

  final Rx<RestaurantModel?> _restaurantData = RestaurantModel().obs;
  RestaurantModel? get restaurantData => _restaurantData.value;

  final Rx<RestaurantAll> _restaurantList = RestaurantAll().obs;
  RestaurantAll get restaurantList => _restaurantList.value;

  List<RestaurantModel> restaurants = [];

  createRestaurant() async {
    _isDataLoading(true);
    print(restaurantNameController.text);
    var params = {
      "restaurantName": restaurantNameController.text,
      "address": addressController.text,
      "phone": phoneController.text,
      "email": emailController.text,
      "city": "chennai",
      "displayAddress": displayAddressController.text,
      "contactName": nameController.text,
      "description": descriptionController.text,
      "logoUrl": logoUrl,
      "bannerUrl": bannerUrl
    };
    var response = await _restaurantRepository.createRestaurant(params);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
      print("failed");
    }, (data) async {
      print("success");
      _isDataLoading(false);
      _errorMessage.value = "";
      _restaurantData.value = data.payload;
      print("restaurant name"); print(data.payload?.restaurantName);
      _restaurantData.refresh();
      getRestaurantDetailsAll();
      print(data.toJson());
    });
  }

  getRestaurantById(int id) async {
    _isDataLoading(true);
    var response = await _restaurantRepository.getRestaurantById(id);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _restaurantData.value = data.payload;
      print(data.toJson());
    });
  }

  deleteRestaurant(int id) async {
    _isDataLoading(true);
    var response = await _restaurantRepository.deleteRestaurant(id);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      print(data);
      _isDataLoading(false);
      _errorMessage.value = "";
      getRestaurantDetailsAll();
      _restaurantList.refresh();
    });
  }

  getRestaurantDetailsAll() async {
    _isDataLoading(true);
    var response = await _restaurantRepository.getRestaurantDetailsAll();
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _restaurantList.value = data;

      _restaurantList.refresh();
      restaurants = data.payload ?? [];
    });
  }

  getRestaurantDetailsByNameSearch(String? query) async {
    _isDataLoading(true);
    var response =
        await _restaurantRepository.getRestaurantDetailsByNameSearch(query);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _restaurantList.value = data;
    });
  }
}
