// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDetails _$TaskDetailsFromJson(Map<String, dynamic> json) => TaskDetails(
      id: json['id'] as int?,
      items: json['items'] as String?,
      qty: json['qty'] as double?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TaskDetailsToJson(TaskDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items,
      'qty': instance.qty,
      'amount': instance.amount,
    };
