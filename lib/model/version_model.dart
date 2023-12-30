import 'package:json_annotation/json_annotation.dart';

part 'version_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VersionModel {
  String? type;
  String? version;

  VersionModel({
    this.type,
    this.version,
  });

  factory VersionModel.fromJson(Map<String, dynamic> json) =>
      _$VersionModelFromJson(json);

  Map<String, dynamic> toJson() => _$VersionModelToJson(this);
}
