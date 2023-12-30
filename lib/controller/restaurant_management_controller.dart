import 'package:get/get.dart';
import '../model/restaurant_all_model.dart';
import '../model/restaurant_model.dart';
import '../repository/restaurant_management_repository.dart';

class RestaurantManagementController extends GetxController {

  final RestaurantManagementRepository _restaurantRepository =
  RestaurantManagementRepository();

  final RxBool _isDataLoading =  false.obs;
  bool get isDataLoading  => _isDataLoading.value;

  final RxString _errorMessage = "".obs;
  String get errorMessage  => _errorMessage.value;

  final Rx<RestaurantModel> _restaurantData = RestaurantModel().obs;
  RestaurantModel get restaurantData  => _restaurantData.value;

  final Rx<RestaurantAll> _restaurantList = RestaurantAll().obs;
  RestaurantAll get restaurantList  => _restaurantList.value;

  createRestaurant() async {
    _isDataLoading(true);
    var response = await _restaurantRepository.createRestaurant(
        {});
    response.fold((failure) {
      _isDataLoading(false);
      _errorMessage.value = failure.message;
    }, (data) async {
      _isDataLoading(false);
      _errorMessage.value = "";
      _restaurantData.value = data;
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
      _restaurantData.value = data;
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
    });
  }

  getRestaurantDetailsByNameSearch(String? query) async {
    _isDataLoading(true);
    var response = await _restaurantRepository.getRestaurantDetailsByNameSearch(query);
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

