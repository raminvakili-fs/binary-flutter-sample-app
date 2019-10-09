// GENERATED CODE - DO NOT MODIFY BY HAND

part of proposal_open_contract_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalOpenContractResponse _$ProposalOpenContractResponseFromJson(
    Map<String, dynamic> json) {
  return ProposalOpenContractResponse(
    error: json['error'] == null ? null : Error.fromJson(json['error']),
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    proposalOpenContract: json['proposal_open_contract'] == null
        ? null
        : ProposalOpenContract.fromJson(
            json['proposal_open_contract'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProposalOpenContractResponseToJson(
        ProposalOpenContractResponse instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'proposal_open_contract': instance.proposalOpenContract?.toJson(),
    };

ProposalOpenContract _$ProposalOpenContractFromJson(Map<String, dynamic> json) {
  return ProposalOpenContract(
    json['audit_details'] == null
        ? null
        : AuditDetails.fromJson(json['audit_details'] as Map<String, dynamic>),
    json['barrier'] as String,
    json['barrier_count'] as int,
    (json['bid_price'] as num)?.toDouble(),
    (json['buy_price'] as num)?.toDouble(),
    json['contract_id'] as int,
    json['contract_type'] as String,
    json['currency'] as String,
    (json['current_spot'] as num)?.toDouble(),
    json['current_spot_display_value'] as String,
    json['current_spot_time'] as int,
    json['date_expiry'] as int,
    json['date_settlement'] as int,
    json['date_start'] as int,
    json['display_name'] as String,
    (json['entry_spot'] as num)?.toDouble(),
    json['entry_spot_display_value'] as String,
    (json['entry_tick'] as num)?.toDouble(),
    json['entry_tick_display_value'] as String,
    json['entry_tick_time'] as int,
    (json['exit_tick'] as num)?.toDouble(),
    json['exit_tick_display_value'] as String,
    json['exit_tick_time'] as int,
    json['is_expired'] as int,
    json['is_forward_starting'] as int,
    json['is_intraday'] as int,
    json['is_path_dependent'] as int,
    json['is_settleable'] as int,
    json['is_sold'] as int,
    json['is_valid_to_sell'] as int,
    json['longcode'] as String,
    (json['payout'] as num)?.toDouble(),
    (json['profit'] as num)?.toDouble(),
    (json['profit_percentage'] as num)?.toDouble(),
    json['purchase_time'] as int,
    json['sell_price'] as int,
    (json['sell_spot'] as num)?.toDouble(),
    json['sell_spot_display_value'] as String,
    json['sell_spot_time'] as int,
    json['sell_time'] as int,
    json['shortcode'] as String,
    json['status'] as String,
    json['transaction_ids'] == null
        ? null
        : TransactionIds.fromJson(
            json['transaction_ids'] as Map<String, dynamic>),
    json['underlying'] as String,
    json['validation_error'] as String,
  );
}

Map<String, dynamic> _$ProposalOpenContractToJson(
        ProposalOpenContract instance) =>
    <String, dynamic>{
      'audit_details': instance.auditDetails?.toJson(),
      'barrier': instance.barrier,
      'barrier_count': instance.barrierCount,
      'bid_price': instance.bidPrice,
      'buy_price': instance.buyPrice,
      'contract_id': instance.contractId,
      'contract_type': instance.contractType,
      'currency': instance.currency,
      'current_spot': instance.currentSpot,
      'current_spot_display_value': instance.currentSpotDisplayValue,
      'current_spot_time': instance.currentSpotTime,
      'date_expiry': instance.dateExpiry,
      'date_settlement': instance.dateSettlement,
      'date_start': instance.dateStart,
      'display_name': instance.displayName,
      'entry_spot': instance.entrySpot,
      'entry_spot_display_value': instance.entrySpotDisplayValue,
      'entry_tick': instance.entryTick,
      'entry_tick_display_value': instance.entryTickDisplayValue,
      'entry_tick_time': instance.entryTickTime,
      'exit_tick': instance.exitTick,
      'exit_tick_display_value': instance.exitTickDisplayValue,
      'exit_tick_time': instance.exitTickTime,
      'is_expired': instance.isExpired,
      'is_forward_starting': instance.isForwardStarting,
      'is_intraday': instance.isIntraday,
      'is_path_dependent': instance.isPathDependent,
      'is_settleable': instance.isSettleable,
      'is_sold': instance.isSold,
      'is_valid_to_sell': instance.isValidToSell,
      'longcode': instance.longcode,
      'payout': instance.payout,
      'profit': instance.profit,
      'profit_percentage': instance.profitPercentage,
      'purchase_time': instance.purchaseTime,
      'sell_price': instance.sellPrice,
      'sell_spot': instance.sellSpot,
      'sell_spot_display_value': instance.sellSpotDisplayValue,
      'sell_spot_time': instance.sellSpotTime,
      'sell_time': instance.sellTime,
      'shortcode': instance.shortcode,
      'status': instance.status,
      'transaction_ids': instance.transactionIds?.toJson(),
      'underlying': instance.underlying,
      'validation_error': instance.validationError,
    };

AuditDetails _$AuditDetailsFromJson(Map<String, dynamic> json) {
  return AuditDetails(
    (json['contract_end'] as List)
        ?.map((e) =>
            e == null ? null : ContractEnd.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['contract_start'] as List)
        ?.map((e) => e == null
            ? null
            : ContractStart.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AuditDetailsToJson(AuditDetails instance) =>
    <String, dynamic>{
      'contract_end': instance.contractEnd?.map((e) => e?.toJson())?.toList(),
      'contract_start':
          instance.contractStart?.map((e) => e?.toJson())?.toList(),
    };

ContractEnd _$ContractEndFromJson(Map<String, dynamic> json) {
  return ContractEnd(
    json['epoch'] as int,
    (json['tick'] as num)?.toDouble(),
    json['tick_display_value'] as String,
  );
}

Map<String, dynamic> _$ContractEndToJson(ContractEnd instance) =>
    <String, dynamic>{
      'epoch': instance.epoch,
      'tick': instance.tick,
      'tick_display_value': instance.tickDisplayValue,
    };

ContractStart _$ContractStartFromJson(Map<String, dynamic> json) {
  return ContractStart(
    json['epoch'] as int,
    (json['tick'] as num)?.toDouble(),
    json['tick_display_value'] as String,
  );
}

Map<String, dynamic> _$ContractStartToJson(ContractStart instance) =>
    <String, dynamic>{
      'epoch': instance.epoch,
      'tick': instance.tick,
      'tick_display_value': instance.tickDisplayValue,
    };

TransactionIds _$TransactionIdsFromJson(Map<String, dynamic> json) {
  return TransactionIds(
    json['buy'] as int,
    json['sell'] as int,
  );
}

Map<String, dynamic> _$TransactionIdsToJson(TransactionIds instance) =>
    <String, dynamic>{
      'buy': instance.buy,
      'sell': instance.sell,
    };
