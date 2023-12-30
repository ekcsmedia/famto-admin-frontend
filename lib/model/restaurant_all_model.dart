import 'package:famto_admin_app/model/restaurant_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_all_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RestaurantAll {
  List<RestaurantModel>? payload;

  RestaurantAll({
    this.payload,
  });

  factory RestaurantAll.fromJson(Map<String, dynamic> json) =>
      _$RestaurantAllFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantAllToJson(this);
}
