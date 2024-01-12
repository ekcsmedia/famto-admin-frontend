import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/product_category_all_model.dart';
import '../model/product_category_model.dart';
import '../repository/product_category_management_repository.dart';

class ProductCategoryController extends GetxController {
  final ProductCategoryManagementRepository _productCategoryManagementRepository =
  ProductCategoryManagementRepository();

  final RxBool _isDataLoading = false.obs;
  bool get isDataLoading => _isDataLoading.value;

  final RxString _errorMessage = "".obs;
  String get errorMessage => _errorMessage.value;
  setErrorMessage() {
    _errorMessage.value = "";
  }

  final RxString _restaurantName = "".obs;
  String get restaurantName => _restaurantName.value;
  setRestaurantName(value) {
    _restaurantName.value = value;
  }

  final RxInt _restaurantId = 0.obs;
  int get restaurantId => _restaurantId.value;
  setRestaurantId(value) {
    _restaurantId.value = value;
    getProductCategoryDetailsOfRestaurant(value);
  }

  final RxInt _categoryId = 0.obs;
  int get categoryId => _categoryId.value;
  setCategoryId(value) {
    _categoryId.value = value;
  }

  final Rx<ProductCategoryAll> _categoryList = ProductCategoryAll().obs;
  ProductCategoryAll get categoryList => _categoryList.value;

  final Rx<ProductCategoryModel> _categoryData = ProductCategoryModel().obs;
  ProductCategoryModel get categoryData => _categoryData.value;

  final TextEditingController _categoryNameController = TextEditingController();
  final TextEditingController _categoryDescriptionController =
  TextEditingController();

  TextEditingController get categoryNameController => _categoryNameController;
  TextEditingController get categoryDescriptionController =>
      _categoryDescriptionController;

  createProductCategory() async {
    _isDataLoading(true);
    print(
            "Restaurant: $restaurantName ---  "
            "Resto Id: $restaurantId --  "
            "Category: ${categoryNameController.text} -- "
            "Category desc ${categoryDescriptionController.text}"
    );
    var params = {
      "restaurantName": restaurantName,
      "restaurantId": restaurantId,
      "category": categoryNameController.text,
      "description": categoryDescriptionController.text,
    };
    var response = await _productCategoryManagementRepository.createProductCategory(params);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
      print("failed");
    }, (data) async {
      print("success");
      _isDataLoading(false);
      _errorMessage.value = "";
      _categoryData.value = data;
      print(data.toJson());
      getProductCategoryDetailsOfRestaurant(data.restaurantId ?? 0);
    });
  }

  getProductCategoryById(int id) async {
    _isDataLoading(true);
    var response = await _productCategoryManagementRepository.getProductCategoryById(id);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _categoryData.value = data;
      _categoryData.refresh();
      print(data.toJson());
    });
  }

  deleteProductCategory(int id) async {
    _isDataLoading(true);
    var response = await _productCategoryManagementRepository.deleteProductCategory(id);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      print(data);
      _isDataLoading(false);
      _errorMessage.value = "";
    });
  }

  getProductCategoryDetailsAll() async {
    _isDataLoading(true);
    var response = await _productCategoryManagementRepository.getProductCategoryDetailsAll();
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _categoryList.value = data;
    });
  }

  getProductCategoryDetailsOfRestaurant(value) async {
    _isDataLoading(true);
    var response = await _productCategoryManagementRepository.getProductCategoryDetailsOfRestaurant(value);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _categoryList.value = data;
    });
  }


}
