// GENERATED CODE - DO NOT MODIFY BY HAND

part of transactions_request;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionsRequest _$TransactionsRequestFromJson(Map<String, dynamic> json) {
  return TransactionsRequest(
    transaction: json['transaction'] as int,
    subscribe: json['subscribe'] as int,
  )..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$TransactionsRequestToJson(TransactionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('req_id', instance.reqId);
  val['transaction'] = instance.transaction;
  writeNotNull('subscribe', instance.subscribe);
  return val;
}
