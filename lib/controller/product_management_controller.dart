import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {

  final TextEditingController _categoryNameController = TextEditingController();
  final TextEditingController _categoryDescriptionController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _searchTagController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _minOrderQtyController = TextEditingController();
  final TextEditingController _maxQtyPerOrderController = TextEditingController();
  final TextEditingController _costPriceController = TextEditingController();
  final TextEditingController _skuController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _oftenBoughtTogetherController = TextEditingController();
  final TextEditingController _preparationTimeController = TextEditingController();
  final TextEditingController _productDescriptionController = TextEditingController();
  final TextEditingController _productLongDescriptionController = TextEditingController();

  TextEditingController get categoryNameController => _categoryNameController;
  TextEditingController get categoryDescriptionController => _categoryDescriptionController;
  TextEditingController get productNameController => _productNameController;
  TextEditingController get searchTagController => _searchTagController;
  TextEditingController get priceController => _priceController;
  TextEditingController get minOrderQtyController => _minOrderQtyController;
  TextEditingController get maxQtyPerOrderController => _maxQtyPerOrderController;
  TextEditingController get costPriceController => _costPriceController;
  TextEditingController get skuController => _skuController;
  TextEditingController get discountController => _discountController;
  TextEditingController get oftenBoughtTogetherController => _oftenBoughtTogetherController;
  TextEditingController get preparationTimeController => _preparationTimeController;
  TextEditingController get productDescriptionController => _productDescriptionController;
  TextEditingController get productLongDescriptionController => _productLongDescriptionController;

  final RxBool _inventory = false.obs;
  bool get inventory => _inventory.value;
  setInventoryValue(value) {
    _inventory.value = value;
    _inventory.refresh();
  }

}
