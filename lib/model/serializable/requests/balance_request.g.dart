// GENERATED CODE - DO NOT MODIFY BY HAND

part of balance_request;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceRequest _$BalanceRequestFromJson(Map<String, dynamic> json) {
  return BalanceRequest(
    reqId: json['req_id'] as int,
    account: json['account'] as String,
    subscribe: json['subscribe'] as int,
    balance: json['balance'] as int,
  );
}

Map<String, dynamic> _$BalanceRequestToJson(BalanceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('req_id', instance.reqId);
  writeNotNull('account', instance.account);
  writeNotNull('subscribe', instance.subscribe);
  val['balance'] = instance.balance;
  return val;
}
