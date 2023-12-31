import 'package:famto_admin_app/model/restaurant_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'customer_model.dart';

part 'restaurant_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RestaurantResponseModel {
  RestaurantModel? payload;

  RestaurantResponseModel(
      this.payload
      );

  factory RestaurantResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantResponseModelToJson(this);
}