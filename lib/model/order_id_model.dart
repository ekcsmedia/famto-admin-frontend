import 'package:json_annotation/json_annotation.dart';

import 'task_model.dart';
part 'order_id_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderById {
  TaskModel? payload;

  OrderById({
    this.payload,
  });

  factory OrderById.fromJson(Map<String, dynamic> json) =>
      _$OrderByIdFromJson(json);

  Map<String, dynamic> toJson() => _$OrderByIdToJson(this);
}
