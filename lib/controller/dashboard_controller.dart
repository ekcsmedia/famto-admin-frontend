import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repository/delivery_category_repository.dart';

class DashboardController extends GetxController {

  final Rx<String> _pageSelected = "Home".obs;

  setPage(value) {
    _pageSelected?.value = value;
  }

 String? get pageSelected => _pageSelected?.value;

}