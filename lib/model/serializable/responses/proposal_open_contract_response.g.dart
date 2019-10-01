// GENERATED CODE - DO NOT MODIFY BY HAND

part of proposal_open_contract_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalOpenContractResponse _$ProposalOpenContractResponseFromJson(
    Map<String, dynamic> json) {
  return ProposalOpenContractResponse(
    error: json['error'] == null
        ? null
        : Error.fromJson(json['error'] as Map<String, dynamic>),
    msgType: json['msg_type'],
    reqId: json['req_id'],
    proposalOpenContract: json['proposal_open_contract'] == null
        ? null
        : ProposalOpenContract.fromJson(json['proposal_open_contract']),
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
        : AuditDetails.fromJson(json['audit_details']),
    json['barrier'],
    json['barrier_count'],
    json['bid_price'].toDouble(),
    json['buy_price'],
    json['contract_id'],
    json['contract_type'],
    json['currency'],
    json['current_spot'],
    json['current_spot_display_value'],
    json['current_spot_time'],
    json['date_expiry'],
    json['date_settlement'],
    json['date_start'],
    json['display_name'],
    json['entry_spot'],
    json['entry_spot_display_value'],
    json['entry_tick'],
    json['entry_tick_display_value'],
    json['entry_tick_time'],
    json['exit_tick'],
    json['exit_tick_display_value'],
    json['exit_tick_time'],
    json['is_expired'],
    json['is_forward_starting'],
    json['is_intraday'],
    json['is_path_dependent'],
    json['is_settleable'],
    json['is_sold'],
    json['is_valid_to_sell'],
    json['longcode'],
    json['payout'],
    json['profit'],
    json['profit_percentage'].toDouble(),
    json['purchase_time'],
    json['sell_price'],
    json['sell_spot'],
    json['sell_spot_display_value'],
    json['sell_spot_time'],
    json['sell_time'],
    json['shortcode'],
    json['status'],
    json['transaction_ids'] == null
        ? null
        : TransactionIds.fromJson(json['transaction_ids']),
    json['underlying'],
    json['validation_error'],
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
    json['contract_end'],
    json['contract_start'],
  );
}

Map<String, dynamic> _$AuditDetailsToJson(AuditDetails instance) =>
    <String, dynamic>{
      'contract_end': instance.contractEnd,
      'contract_start': instance.contractStart,
    };

ContractEnd _$ContractEndFromJson(Map<String, dynamic> json) {
  return ContractEnd(
    json['epoch'],
    json['tick'],
    json['tick_display_value'],
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
    json['epoch'],
    json['tick'],
    json['tick_display_value'],
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
    json['buy'],
    json['sell'],
  );
}

Map<String, dynamic> _$TransactionIdsToJson(TransactionIds instance) =>
    <String, dynamic>{
      'buy': instance.buy,
      'sell': instance.sell,
    };
