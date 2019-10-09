// GENERATED CODE - DO NOT MODIFY BY HAND

part of price_proposal_request;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceProposalRequest _$PriceProposalRequestFromJson(Map<String, dynamic> json) {
  return PriceProposalRequest(
    reqId: json['req_id'] as int,
    subscribe: json['subscribe'] as int,
    tradingPeriodStart: json['trading_period_start'] as int,
    selectedTick: json['selected_tick'] as int,
    dateExpiry: json['date_expiry'] as int,
    dateStart: json['date_start'] as int,
    proposal: json['proposal'] as int,
    amount: json['amount'] as int,
    basis: json['basis'] as String,
    contractType: json['contract_type'] as String,
    currency: json['currency'] as String,
    duration: json['duration'] as int,
    durationUnit: json['duration_unit'] as String,
    barrier: (json['barrier'] as num)?.toDouble(),
    barrier2: json['barrier2'] as String,
    symbol: json['symbol'] as String,
    productType: json['product_type'] as String,
    multiplier: json['multiplier'] as int,
  );
}

Map<String, dynamic> _$PriceProposalRequestToJson(
    PriceProposalRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('req_id', instance.reqId);
  writeNotNull('subscribe', instance.subscribe);
  writeNotNull('trading_period_start', instance.tradingPeriodStart);
  writeNotNull('selected_tick', instance.selectedTick);
  writeNotNull('date_expiry', instance.dateExpiry);
  writeNotNull('date_start', instance.dateStart);
  writeNotNull('proposal', instance.proposal);
  writeNotNull('amount', instance.amount);
  writeNotNull('basis', instance.basis);
  writeNotNull('contract_type', instance.contractType);
  writeNotNull('currency', instance.currency);
  writeNotNull('duration', instance.duration);
  writeNotNull('duration_unit', instance.durationUnit);
  writeNotNull('barrier', instance.barrier);
  writeNotNull('barrier2', instance.barrier2);
  writeNotNull('symbol', instance.symbol);
  writeNotNull('product_type', instance.productType);
  writeNotNull('multiplier', instance.multiplier);
  return val;
}
