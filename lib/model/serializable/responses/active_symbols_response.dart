import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'active_symbols_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ActiveSymbolsResponse extends ResponseBase{

  @JsonKey(name: 'active_symbols')
  final List<ActiveSymbols> activeSymbols;

  ActiveSymbolsResponse(Error error, String msgType, int reqId, this.activeSymbols) : super(error, msgType, reqId);

  factory ActiveSymbolsResponse.fromJson(Map<String, dynamic> json) => _$ActiveSymbolsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ActiveSymbolsResponseToJson(this);

}

@JsonSerializable()
class ActiveSymbols {

  @JsonKey(name: 'allow_forward_starting')
  final int allowForwardStarting;
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey(name: 'exchange_is_open')
  final int exchangeIsOpen;
  @JsonKey(name: 'is_trading_suspended')
  final int isTradingSuspended;
  @JsonKey(name: 'market')
  final String market;
  @JsonKey(name: 'market_display_name')
  final String marketDisplayName;
  @JsonKey(name: 'pip')
  final double pip;
  @JsonKey(name: 'submarket')
  final String submarket;
  @JsonKey(name: 'submarket_display_name')
  final String submarketDisplayName;
  @JsonKey(name: 'symbol')
  final String symbol;
  @JsonKey(name: 'symbol_type')
  final String symbolType;

  ActiveSymbols(this.allowForwardStarting, this.displayName, this.exchangeIsOpen, this.isTradingSuspended, this.market, this.marketDisplayName, this.pip, this.submarket, this.submarketDisplayName, this.symbol, this.symbolType);

  factory ActiveSymbols.fromJson(Map<String, dynamic> json) => _$ActiveSymbolsFromJson(json);
  Map<String, dynamic> toJson() => _$ActiveSymbolsToJson(this);

}
