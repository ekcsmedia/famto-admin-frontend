import 'package:json_annotation/json_annotation.dart';

part 'task_details.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskDetails {
  int? id;
  String? items;
  double? qty;
  double? amount;

  TaskDetails({
    this.id,
    this.items,
    this.qty,
    this.amount,
  });

  factory TaskDetails.fromJson(Map<String, dynamic> json) =>
      _$TaskDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDetailsToJson(this);
}
