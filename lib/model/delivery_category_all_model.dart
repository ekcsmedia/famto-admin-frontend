import 'package:famto_admin_app/model/delivery_category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery_category_all_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DeliveryCategoryAll {
  List<DeliveryCategory>? payload;

  DeliveryCategoryAll({
    this.payload,
  });

  factory DeliveryCategoryAll.fromJson(Map<String, dynamic> json) =>
      _$DeliveryCategoryAllFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryCategoryAllToJson(this);
}
