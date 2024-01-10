import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product_all_model.dart';
import '../model/product_model.dart';
import '../repository/product_management_repository.dart';

class ProductController extends GetxController {
  final ProductManagementRepository _productManagementRepository =
      ProductManagementRepository();

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
  }

  final RxInt _productId = 0.obs;
  int get productId => _productId.value;
  setProductId(value) {
    _productId.value = value;
  }

  final RxString _productImageUrl = "".obs;
  String get productImageUrl => _productImageUrl.value;
  setProductImageUrl(value) {
    _productImageUrl.value = value;
  }

  final RxInt _quantity = 0.obs;
  int get quantity => _quantity.value;
  setQuantity(value) {
    _quantity.value = value;
  }

  final RxInt _alert = 0.obs;
  int get alert => _alert.value;
  setAlert(value) {
    _alert.value = value;
  }

  final Rx<ProductModel?> _productData = ProductModel().obs;
  ProductModel? get productData => _productData.value;

  final Rx<ProductAll> _productList = ProductAll().obs;
  ProductAll get productList => _productList.value;

  final TextEditingController _categoryNameController = TextEditingController();
  final TextEditingController _categoryDescriptionController =
      TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _searchTagController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _minOrderQtyController = TextEditingController();
  final TextEditingController _maxQtyPerOrderController =
      TextEditingController();
  final TextEditingController _costPriceController = TextEditingController();
  final TextEditingController _skuController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _oftenBoughtTogetherController =
      TextEditingController();
  final TextEditingController _preparationTimeController =
      TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final TextEditingController _productLongDescriptionController =
      TextEditingController();

  TextEditingController get categoryNameController => _categoryNameController;
  TextEditingController get categoryDescriptionController =>
      _categoryDescriptionController;
  TextEditingController get productNameController => _productNameController;
  TextEditingController get searchTagController => _searchTagController;
  TextEditingController get priceController => _priceController;
  TextEditingController get minOrderQtyController => _minOrderQtyController;
  TextEditingController get maxQtyPerOrderController =>
      _maxQtyPerOrderController;
  TextEditingController get costPriceController => _costPriceController;
  TextEditingController get skuController => _skuController;
  TextEditingController get discountController => _discountController;
  TextEditingController get oftenBoughtTogetherController =>
      _oftenBoughtTogetherController;
  TextEditingController get preparationTimeController =>
      _preparationTimeController;
  TextEditingController get productDescriptionController =>
      _productDescriptionController;
  TextEditingController get productLongDescriptionController =>
      _productLongDescriptionController;

  final RxBool _inventory = false.obs;
  bool get inventory => _inventory.value;
  setInventoryValue(value) {
    _inventory.value = value;
    _inventory.refresh();
  }

  createProduct() async {
    _isDataLoading(true);
    var params = {
      "restaurantName": _restaurantName.value,
      "restaurantId": _restaurantId.value,
      "productName": productNameController.text,
      "productImageUrl": _productImageUrl.value,
      "shortDescription": productDescriptionController.text,
      "longDescription": productLongDescriptionController.text,
      "price": double.parse(priceController.text),
      "inventoryStatus": inventory,
      "quantity": quantity,
      "alert": alert,
      "prepartionTime": int.parse(preparationTimeController.text),
      "category": categoryNameController.text,
      "categoryDesc": categoryDescriptionController.text,
      "minOrderQty": int.parse(minOrderQtyController.text),
      "maxQtyPerOrder": int.parse(maxQtyPerOrderController.text),
      "sku": int.parse(skuController.text),
      "cost": double.parse(costPriceController.text),
      // "addOnName": "",
      // "addOnSelectionType": "",
      // "tags": [],
      // "oftenBoughtTogether": [],
      // "addOnsList": [],
    };
    var response = await _productManagementRepository.createProduct(params);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
      print("failed");
    }, (data) async {
      print("success");
      _isDataLoading(false);
      _errorMessage.value = "";
      _productData.value = data;
      print(data.toJson());
    });
  }

  getProductById(int id) async {
    _isDataLoading(true);
    var response = await _productManagementRepository.getProductById(id);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _productData.value = data.payload;
      print(data.toJson());
    });
  }

  deleteProduct(int id) async {
    _isDataLoading(true);
    var response = await _productManagementRepository.deleteProduct(id);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      print(data);
      _isDataLoading(false);
      _errorMessage.value = "";
    });
  }

  getProductDetailsAll() async {
    _isDataLoading(true);
    var response = await _productManagementRepository.getProductDetailsAll();
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _productList.value = data;
    });
  }

  getProductDetailsOfRestaurant() async {
    _isDataLoading(true);
    var response = await _productManagementRepository.getProductDetailsOfRestaurant(restaurantId);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _productList.value = data;
    });
  }

  getProductDetailsOfRestaurantAndCategory() async {
    String category = categoryNameController.text;
    _isDataLoading(true);
    var response = await _productManagementRepository.getProductDetailsOfRestaurantAndCategory(restaurantId, category);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _productList.value = data;
    });
  }

  getProductDetailsOfRestaurantAndCategoryAndProductId() async {
    String category = categoryNameController.text;
    _isDataLoading(true);
    var response = await _productManagementRepository.getProductByRestaurantAndCategoryAndProductId(restaurantId, category, productId);
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _productData.value = data.payload;
    });
  }
}
