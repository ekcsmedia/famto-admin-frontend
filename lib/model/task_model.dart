import 'package:json_annotation/json_annotation.dart';

import 'delivery_model.dart';
import 'pickup_model.dart';

part 'task_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskModel {
  String? taskId;
  String? assignee;
  String? type;
  List<Pickup>? pickupDetails;
  List<Delivery>? deliveryDetails;
  String? agent;
  String? status;

  TaskModel({
    this.assignee,
    this.type,
    this.pickupDetails,
    this.deliveryDetails,
    this.agent,
    this.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
