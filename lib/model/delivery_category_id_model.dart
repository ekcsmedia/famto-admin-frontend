import 'package:famto_admin_app/model/delivery_category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery_category_id_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DeliveryCategoryId {
  DeliveryCategory? payload;

  DeliveryCategoryId({
    this.payload,
  });

  factory DeliveryCategoryId.fromJson(Map<String, dynamic> json) =>
      _$DeliveryCategoryIdFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryCategoryIdToJson(this);
}
