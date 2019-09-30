// GENERATED CODE - DO NOT MODIFY BY HAND

part of buy_contract_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyContractResponse _$BuyContractResponseFromJson(Map<String, dynamic> json) {
  return BuyContractResponse(
    json['error'] == null ? null : Error.fromJson(json['error']),
    json['msg_type'] as String,
    json['req_id'] as int,
    json['buy'] == null
        ? null
        : Buy.fromJson(json['buy'] as Map<String, dynamic>),
    json['subscription'] == null
        ? null
        : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BuyContractResponseToJson(BuyContractResponse instance) {
  final val = <String, dynamic>{
    'error': instance.error?.toJson(),
    'msg_type': instance.msgType,
    'req_id': instance.reqId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('buy', instance.buy?.toJson());
  writeNotNull('subscription', instance.subscription?.toJson());
  return val;
}

Buy _$BuyFromJson(Map<String, dynamic> json) {
  return Buy(
    (json['balance_after'] as num)?.toDouble(),
    (json['buy_price'] as num)?.toDouble(),
    json['contract_id'] as int,
    json['longcode'] as String,
    json['payout'] as int,
    json['purchase_time'] as int,
    json['shortcode'] as String,
    json['start_time'] as int,
    json['transaction_id'] as int,
  );
}

Map<String, dynamic> _$BuyToJson(Buy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('balance_after', instance.balanceAfter);
  writeNotNull('buy_price', instance.buyPrice);
  writeNotNull('contract_id', instance.contractId);
  writeNotNull('longcode', instance.longcode);
  writeNotNull('payout', instance.payout);
  writeNotNull('purchase_time', instance.purchaseTime);
  writeNotNull('shortcode', instance.shortcode);
  writeNotNull('start_time', instance.startTime);
  writeNotNull('transaction_id', instance.transactionId);
  return val;
}

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return Subscription(
    json['id'] as String,
  );
}

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}
