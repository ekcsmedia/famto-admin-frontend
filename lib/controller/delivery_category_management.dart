import 'package:famto_admin_app/model/delivery_category_all_model.dart';
import 'package:famto_admin_app/model/delivery_category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repository/delivery_category_repository.dart';

class DeliveryCategoryController extends GetxController {
  final DeliveryCategoryRepository _deliveryCategoryRepository =
      DeliveryCategoryRepository();

  final _deliveryCategoryModel = DeliveryCategory().obs;
  DeliveryCategory get deliveryCategoryModel => _deliveryCategoryModel.value;

  final _deliveryCategoryAllModel = DeliveryCategoryAll().obs;
  DeliveryCategoryAll get deliveryCategoryAllModel =>
      _deliveryCategoryAllModel.value;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get imageUrlController => _imageUrlController;

  createDeliveryCategory() async {
    // _isDataLoading(true);
    print("name from controller ${nameController.text}");

    var response = await _deliveryCategoryRepository.createDeliveryCategory(
        name: nameController.text, imageUrl: imageUrlController.text);

    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      // _isDataLoading(false);
      // _errorMessage.value = "";
      _deliveryCategoryModel.value = data;
      print("Data: ${data.deliveryName} ${data.image}");
    });
  }

  getDeliveryCategory(int id) async {
    // _isDataLoading(true);

    var response = await _deliveryCategoryRepository.getDeliveryCategory(id);
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      // _isDataLoading(false);
      // _errorMessage.value = "";
      _deliveryCategoryModel.value = data.payload ?? DeliveryCategory();
      print(
          "Test Name: ${data.payload?.deliveryName ?? ""} ${data.payload?.image ?? ""}");
    });
  }

  deleteDeliveryCategory(int id) async {
    // _isDataLoading(true);

    var response = await _deliveryCategoryRepository.deleteDeliveryCategory(id);
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      getDeliveryCategoriesAll();
      _deliveryCategoryAllModel.refresh();
      // _isDataLoading(false);
      // _errorMessage.value = "";
    });
  }

  getDeliveryCategoriesAll() async {
    // _isDataLoading(true);

    var response = await _deliveryCategoryRepository.getDeliveryCategoriesAll();
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      // _isDataLoading(false);
      // _errorMessage.value = "";
      _deliveryCategoryAllModel.value = data;
      print(
          "Test Name: ${data.payload?[0].deliveryName} ${data.payload?[0].image}");
    });
  }
}
