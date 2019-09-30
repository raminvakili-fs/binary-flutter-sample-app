// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_symbols_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveSymbolsResponse _$ActiveSymbolsResponseFromJson(
    Map<String, dynamic> json) {
  return ActiveSymbolsResponse(
    json['error'],
    json['msg_type'] as String,
    json['req_id'] as int,
    (json['active_symbols'] as List)
        ?.map((e) => e == null
            ? null
            : ActiveSymbols.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ActiveSymbolsResponseToJson(
        ActiveSymbolsResponse instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'active_symbols':
          instance.activeSymbols?.map((e) => e?.toJson())?.toList(),
    };

ActiveSymbols _$ActiveSymbolsFromJson(Map<String, dynamic> json) {
  return ActiveSymbols(
    json['allow_forward_starting'] as int,
    json['display_name'] as String,
    json['exchange_is_open'] as int,
    json['is_trading_suspended'] as int,
    json['market'] as String,
    json['market_display_name'] as String,
    (json['pip'] as num)?.toDouble(),
    json['submarket'] as String,
    json['submarket_display_name'] as String,
    json['symbol'] as String,
    json['symbol_type'] as String,
  );
}

Map<String, dynamic> _$ActiveSymbolsToJson(ActiveSymbols instance) =>
    <String, dynamic>{
      'allow_forward_starting': instance.allowForwardStarting,
      'display_name': instance.displayName,
      'exchange_is_open': instance.exchangeIsOpen,
      'is_trading_suspended': instance.isTradingSuspended,
      'market': instance.market,
      'market_display_name': instance.marketDisplayName,
      'pip': instance.pip,
      'submarket': instance.submarket,
      'submarket_display_name': instance.submarketDisplayName,
      'symbol': instance.symbol,
      'symbol_type': instance.symbolType,
    };
