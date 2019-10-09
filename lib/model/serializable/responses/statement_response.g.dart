// GENERATED CODE - DO NOT MODIFY BY HAND

part of statement_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatementResponse _$StatementResponseFromJson(Map<String, dynamic> json) {
  return StatementResponse(
    json['error'] == null ? null : Error.fromJson(json['error']),
    json['msg_type'] as String,
    json['req_id'] as int,
    json['statement'] == null
        ? null
        : Statement.fromJson(json['statement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StatementResponseToJson(StatementResponse instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'statement': instance.statement?.toJson(),
    };

Statement _$StatementFromJson(Map<String, dynamic> json) {
  return Statement(
    json['count'] as int,
    (json['transactions'] as List)
        ?.map((e) =>
            e == null ? null : Transactions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StatementToJson(Statement instance) => <String, dynamic>{
      'count': instance.count,
      'transactions': instance.transactions?.map((e) => e?.toJson())?.toList(),
    };

Transactions _$TransactionsFromJson(Map<String, dynamic> json) {
  return Transactions(
    json['action_type'] as String,
    (json['amount'] as num)?.toDouble(),
    json['app_id'] as int,
    (json['balance_after'] as num)?.toDouble(),
    json['contract_id'] as int,
    json['longcode'] as String,
    (json['payout'] as num)?.toDouble(),
    json['reference_id'] as int,
    json['shortcode'] as String,
    json['transaction_id'] as int,
    json['transaction_time'] as int,
  );
}

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'action_type': instance.actionType,
      'amount': instance.amount,
      'app_id': instance.appId,
      'balance_after': instance.balanceAfter,
      'contract_id': instance.contractId,
      'longcode': instance.longcode,
      'payout': instance.payout,
      'reference_id': instance.referenceId,
      'shortcode': instance.shortcode,
      'transaction_id': instance.transactionId,
      'transaction_time': instance.transactionTime,
    };
