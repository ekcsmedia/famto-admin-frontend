import 'package:famto_admin_app/model/tag_model.dart';
import 'package:famto_admin_app/model/version_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerModel {
  int? customerId;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? lastUsedPlatform;
  int? rating;
  double? walletBalance;
  DateTime? registerAt;
  bool? codStatus;
  bool? payLaterStatus;
  String? referralCode;
  double? rateAndReview;
  List<TagModel>? tagsModel;
  List<VersionModel>? versions;

  CustomerModel(
      {this.name,
      this.phone,
      this.email,
        this.password,
      this.customerId,
      this.lastUsedPlatform,
      this.rating,
      this.registerAt,
      this.walletBalance,
      this.codStatus,
      this.payLaterStatus,
      this.rateAndReview,
      this.referralCode,
      this.tagsModel,
      this.versions});

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
