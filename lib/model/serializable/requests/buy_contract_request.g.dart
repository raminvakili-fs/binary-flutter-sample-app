// GENERATED CODE - DO NOT MODIFY BY HAND

part of buy_contract_request;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyContractRequest _$BuyContractRequestFromJson(Map<String, dynamic> json) {
  return BuyContractRequest(
    buy: json['buy'] as String,
    price: (json['price'] as num)?.toDouble(),
    subscribe: json['subscribe'] as int,
  )..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$BuyContractRequestToJson(BuyContractRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('req_id', instance.reqId);
  val['buy'] = instance.buy;
  writeNotNull('price', instance.price);
  writeNotNull('subscribe', instance.subscribe);
  return val;
}
