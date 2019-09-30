// GENERATED CODE - DO NOT MODIFY BY HAND

part of contracts_for_symbol_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractsForSymbolResponse _$ContractsForSymbolResponseFromJson(
    Map<String, dynamic> json) {
  return ContractsForSymbolResponse(
    json['error'],
    json['msg_type'] as String,
    json['req_id'] as int,
  )..contractsFor = json['contracts_for'] == null
      ? null
      : ContractsFor.fromJson(json['contracts_for'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ContractsForSymbolResponseToJson(
        ContractsForSymbolResponse instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'contracts_for': instance.contractsFor?.toJson(),
    };

ContractsFor _$ContractsForFromJson(Map<String, dynamic> json) {
  return ContractsFor(
    (json['available'] as List)
        ?.map((e) =>
            e == null ? null : Available.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['close'] as int,
    json['feed_license'] as String,
    json['hit_count'] as int,
    json['open'] as int,
    (json['spot'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ContractsForToJson(ContractsFor instance) =>
    <String, dynamic>{
      'available': instance.available?.map((e) => e?.toJson())?.toList(),
      'close': instance.close,
      'feed_license': instance.feedLicense,
      'hit_count': instance.hitCount,
      'open': instance.open,
      'spot': instance.spot,
    };

Available _$AvailableFromJson(Map<String, dynamic> json) {
  return Available(
    json['barrier_category'] as String,
    json['barriers'] as int,
    json['contract_category'] as String,
    json['contract_category_display'] as String,
    json['contract_display'] as String,
    json['contract_type'] as String,
    json['exchange_name'] as String,
    json['expiry_type'] as String,
    (json['forward_starting_options'] as List)
        ?.map((e) => e == null
            ? null
            : ForwardStartingOptions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['market'] as String,
    json['max_contract_duration'] as String,
    json['min_contract_duration'] as String,
    json['sentiment'] as String,
    json['start_type'] as String,
    json['submarket'] as String,
    json['underlying_symbol'] as String,
  );
}

Map<String, dynamic> _$AvailableToJson(Available instance) => <String, dynamic>{
      'barrier_category': instance.barrierCategory,
      'barriers': instance.barriers,
      'contract_category': instance.contractCategory,
      'contract_category_display': instance.contractCategoryDisplay,
      'contract_display': instance.contractDisplay,
      'contract_type': instance.contractType,
      'exchange_name': instance.exchangeName,
      'expiry_type': instance.expiryType,
      'forward_starting_options':
          instance.forwardStartingOptions?.map((e) => e?.toJson())?.toList(),
      'market': instance.market,
      'max_contract_duration': instance.maxContractDuration,
      'min_contract_duration': instance.minContractDuration,
      'sentiment': instance.sentiment,
      'start_type': instance.startType,
      'submarket': instance.submarket,
      'underlying_symbol': instance.underlyingSymbol,
    };

ForwardStartingOptions _$ForwardStartingOptionsFromJson(
    Map<String, dynamic> json) {
  return ForwardStartingOptions(
    json['close'] as int,
    json['date'] as int,
    json['open'] as int,
  );
}

Map<String, dynamic> _$ForwardStartingOptionsToJson(
        ForwardStartingOptions instance) =>
    <String, dynamic>{
      'close': instance.close,
      'date': instance.date,
      'open': instance.open,
    };
