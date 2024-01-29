import 'package:famto_admin_app/model/product_model.dart';
import 'package:famto_admin_app/model/restaurant_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address_model.dart';
import 'customer_model.dart';
import 'invoice_model.dart';

part 'manage_order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderModel {
  int? orderId;
  CustomerModel? customerData;
  String? deliveryMethod;
  String? pickupName;
  String? pickupPhone;
  String? pickupEmail;
  String? orderStatus;
  String? suggestions;
  String? deliveryOption;
  RestaurantModel? restaurantDetails;
  AddressModel? pickupAddress;
  AddressModel? deliveryAddress;
  ProductModel? productsData;
  InvoiceModel? invoice;


  OrderModel(
      {this.orderId,
      this.customerData,
      this.deliveryMethod,
      this.pickupName,
      this.pickupPhone,
      this.pickupEmail,
      this.orderStatus,
      this.pickupAddress,
      this.deliveryAddress,
      this.deliveryOption,
      this.restaurantDetails,
      this.productsData,
      this.suggestions,
      this.invoice});

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
