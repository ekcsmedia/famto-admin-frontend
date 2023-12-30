import 'package:json_annotation/json_annotation.dart';

part 'tag_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TagModel {
  String? name;
  String? status;

  TagModel({
    this.name,
    this.status,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);

  Map<String, dynamic> toJson() => _$TagModelToJson(this);
}
