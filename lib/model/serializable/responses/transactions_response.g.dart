// GENERATED CODE - DO NOT MODIFY BY HAND

part of transactions_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionsResponse _$TransactionsResponseFromJson(Map<String, dynamic> json) {
  return TransactionsResponse(
    json['error'] == null ? null : Error.fromJson(json['error']),
    json['msg_type'] as String,
    json['req_id'] as int,
    json['subscription'] == null
        ? null
        : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
    json['transaction'] == null
        ? null
        : Transaction.fromJson(json['transaction'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TransactionsResponseToJson(
    TransactionsResponse instance) {
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

  writeNotNull('subscription', instance.subscription?.toJson());
  writeNotNull('transaction', instance.transaction?.toJson());
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

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    json['id'] as String,
    (json['amount'] as num)?.toDouble(),
    (json['balance'] as num)?.toDouble(),
    (json['high_barrier'] as num)?.toDouble(),
    (json['low_barrier'] as num)?.toDouble(),
    (json['barrier'] as num)?.toDouble(),
    json['longcode'] as String,
    json['purchase_time'] as int,
    json['symbol'] as String,
    json['contract_id'] as int,
    json['transaction_id'] as int,
    json['display_name'] as String,
    json['currency'] as String,
    json['date_expiry'] as int,
    json['action'] as String,
    json['transaction_time'] as int,
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('amount', instance.amount);
  writeNotNull('balance', instance.balance);
  writeNotNull('high_barrier', instance.highBarrier);
  writeNotNull('low_barrier', instance.lowBarrier);
  writeNotNull('barrier', instance.barrier);
  writeNotNull('longcode', instance.longCode);
  writeNotNull('purchase_time', instance.purchaseTime);
  writeNotNull('symbol', instance.symbol);
  writeNotNull('contract_id', instance.contractId);
  writeNotNull('transaction_id', instance.transactionId);
  writeNotNull('display_name', instance.displayName);
  writeNotNull('currency', instance.currency);
  writeNotNull('date_expiry', instance.dateExpiry);
  writeNotNull('action', instance.action);
  writeNotNull('transaction_time', instance.transactionTime);
  return val;
}
