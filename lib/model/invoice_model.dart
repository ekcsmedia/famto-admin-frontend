import 'package:famto_admin_app/model/product_price_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InvoiceModel {
   List<ProductPriceModel?>? productsPriceData;
   double? subtotal;
   double? salesTax;
   double? gst;
   double? total;


   InvoiceModel(
      {this.productsPriceData,
      this.subtotal,
      this.salesTax,
      this.gst,
      this.total});

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceModelToJson(this);
}
