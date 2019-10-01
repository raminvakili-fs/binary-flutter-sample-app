// GENERATED CODE - DO NOT MODIFY BY HAND

part of balance_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceResponse _$BalanceResponseFromJson(Map<String, dynamic> json) {
  return BalanceResponse(
    json['error'] == null ? null : Error.fromJson(json['error']),
    json['msg_type'] as String,
    json['req_id'] as int,
    json['balance'] == null
        ? null
        : Balance.fromJson(json['balance'] as Map<String, dynamic>),
    json['subscription'] == null
        ? null
        : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BalanceResponseToJson(BalanceResponse instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'balance': instance.balance?.toJson(),
      'subscription': instance.subscription?.toJson(),
    };

Balance _$BalanceFromJson(Map<String, dynamic> json) {
  return Balance(
    (json['balance'] as num)?.toDouble(),
    json['currency'] as String,
    json['id'] as String,
    json['loginid'] as String,
  );
}

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'balance': instance.balance,
      'currency': instance.currency,
      'id': instance.id,
      'loginid': instance.loginid,
    };

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return Subscription(
    json['id'] as String,
  );
}

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
