library contracts_for_symbol_response;

import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contracts_for_symbol_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ContractsForSymbolResponse extends ResponseBase{

  @JsonKey(nullable: true, name: 'contracts_for')
  ContractsFor contractsFor;

  ContractsForSymbolResponse(Error error, String msgType, int reqId) : super(error: error, msgType: msgType, reqId: reqId);

  factory ContractsForSymbolResponse.fromJson(Map<String, dynamic> json) => _$ContractsForSymbolResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ContractsForSymbolResponseToJson(this);

}

@JsonSerializable(explicitToJson: true)
class ContractsFor {

  @JsonKey(nullable: true, name: 'available')
  List<Available> available;
  @JsonKey(nullable: true, name: 'close')
  int close;
  @JsonKey(nullable: true, name: 'feed_license')
  String feedLicense;
  @JsonKey(nullable: true, name: 'hit_count')
  int hitCount;
  @JsonKey(nullable: true, name: 'open')
  int open;
  @JsonKey(nullable: true, name: 'spot')
  double spot;


  ContractsFor(this.available, this.close, this.feedLicense, this.hitCount,
      this.open, this.spot);

  factory ContractsFor.fromJson(Map<String, dynamic> json) => _$ContractsForFromJson(json);
  Map<String, dynamic> toJson() => _$ContractsForToJson(this);

}

@JsonSerializable(explicitToJson: true)
class Available{

  @JsonKey(nullable: true, name: 'barrier_category')
  String barrierCategory;
  @JsonKey(nullable: true, name: 'barriers')
  int barriers;
  @JsonKey(nullable: true, name: 'contract_category')
  String contractCategory;
  @JsonKey(nullable: true, name: 'contract_category_display')
  String contractCategoryDisplay;
  @JsonKey(nullable: true, name: 'contract_display')
  String contractDisplay;
  @JsonKey(nullable: true, name: 'contract_type')
  String contractType;
  @JsonKey(nullable: true, name: 'exchange_name')
  String exchangeName;
  @JsonKey(nullable: true, name: 'expiry_type')
  String expiryType;
  @JsonKey(nullable: true, name: 'forward_starting_options')
  List<ForwardStartingOptions> forwardStartingOptions;
  @JsonKey(nullable: true, name: 'market')
  String market;
  @JsonKey(nullable: true, name: 'max_contract_duration')
  String maxContractDuration;
  @JsonKey(nullable: true, name: 'min_contract_duration')
  String minContractDuration;
  @JsonKey(nullable: true, name: 'sentiment')
  String sentiment;
  @JsonKey(nullable: true, name: 'start_type')
  String startType;
  @JsonKey(nullable: true, name: 'submarket')
  String submarket;
  @JsonKey(nullable: true, name: 'underlying_symbol')
  String underlyingSymbol;


  Available(this.barrierCategory, this.barriers, this.contractCategory,
      this.contractCategoryDisplay, this.contractDisplay, this.contractType,
      this.exchangeName, this.expiryType, this.forwardStartingOptions,
      this.market, this.maxContractDuration, this.minContractDuration,
      this.sentiment, this.startType, this.submarket, this.underlyingSymbol);

  factory Available.fromJson(Map<String, dynamic> json) => _$AvailableFromJson(json);
  Map<String, dynamic> toJson() => _$AvailableToJson(this);

}

@JsonSerializable()
class ForwardStartingOptions {

  @JsonKey(nullable: true, name: 'close')
  int close;
  @JsonKey(nullable: true, name: 'date')
  int date;
  @JsonKey(nullable: true, name: 'open')
  int open;


  ForwardStartingOptions(this.close, this.date, this.open);

  factory ForwardStartingOptions.fromJson(Map<String, dynamic> json) => _$ForwardStartingOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$ForwardStartingOptionsToJson(this);

}