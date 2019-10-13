library proposal_open_contract_response;


import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
import 'package:json_annotation/json_annotation.dart';


part 'proposal_open_contract_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProposalOpenContractResponse extends ResponseBase{

  @JsonKey(nullable: true, name: 'proposal_open_contract')
  ProposalOpenContract proposalOpenContract;

  ProposalOpenContractResponse({Error error, String msgType, int reqId, this.proposalOpenContract}) : super(error: error, msgType: msgType, reqId: reqId);

  factory ProposalOpenContractResponse.fromJson(Map<String, dynamic> json) => _$ProposalOpenContractResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProposalOpenContractResponseToJson(this);

}

@JsonSerializable(explicitToJson: true)
class ProposalOpenContract {

  @JsonKey(nullable: true, name: 'audit_details')
  AuditDetails auditDetails;
  @JsonKey(nullable: true, name: 'barrier')
  String barrier;
  @JsonKey(nullable: true, name: 'barrier_count')
  int barrierCount;
  @JsonKey(nullable: true, name: 'bid_price')
  double bidPrice;
  @JsonKey(nullable: true, name: 'buy_price')
  double buyPrice;
  @JsonKey(nullable: true, name: 'contract_id')
  int contractId;
  @JsonKey(nullable: true, name: 'contract_type')
  String contractType;
  @JsonKey(nullable: true, name: 'currency')
  String currency;
  @JsonKey(nullable: true, name: 'current_spot')
  double currentSpot;
  @JsonKey(nullable: true, name: 'current_spot_display_value')
  String currentSpotDisplayValue;
  @JsonKey(nullable: true, name: 'current_spot_time')
  int currentSpotTime;
  @JsonKey(nullable: true, name: 'date_expiry')
  int dateExpiry;
  @JsonKey(nullable: true, name: 'date_settlement')
  int dateSettlement;
  @JsonKey(nullable: true, name: 'date_start')
  int dateStart;
  @JsonKey(nullable: true, name: 'display_name')
  String displayName;
  @JsonKey(nullable: true, name: 'entry_spot')
  double entrySpot;
  @JsonKey(nullable: true, name: 'entry_spot_display_value')
  String entrySpotDisplayValue;
  @JsonKey(nullable: true, name: 'entry_tick')
  double entryTick;
  @JsonKey(nullable: true, name: 'entry_tick_display_value')
  String entryTickDisplayValue;
  @JsonKey(nullable: true, name: 'entry_tick_time')
  int entryTickTime;
  @JsonKey(nullable: true, name: 'exit_tick')
  double exitTick;
  @JsonKey(nullable: true, name: 'exit_tick_display_value')
  String exitTickDisplayValue;
  @JsonKey(nullable: true, name: 'exit_tick_time')
  int exitTickTime;
  @JsonKey(nullable: true, name: 'is_expired')
  int isExpired;
  @JsonKey(nullable: true, name: 'is_forward_starting')
  int isForwardStarting;
  @JsonKey(nullable: true, name: 'is_intraday')
  int isIntraday;
  @JsonKey(nullable: true, name: 'is_path_dependent')
  int isPathDependent;
  @JsonKey(nullable: true, name: 'is_settleable')
  int isSettleable;
  @JsonKey(nullable: true, name: 'is_sold')
  int isSold;
  @JsonKey(nullable: true, name: 'is_valid_to_sell')
  int isValidToSell;
  @JsonKey(nullable: true, name: 'longcode')
  String longcode;
  @JsonKey(nullable: true, name: 'payout')
  double payout;
  @JsonKey(nullable: true, name: 'profit')
  double profit;
  @JsonKey(nullable: true, name: 'profit_percentage')
  double profitPercentage;
  @JsonKey(nullable: true, name: 'purchase_time')
  int purchaseTime;
  @JsonKey(nullable: true, name: 'sell_price')
  double sellPrice;
  @JsonKey(nullable: true, name: 'sell_spot')
  double sellSpot;
  @JsonKey(nullable: true, name: 'sell_spot_display_value')
  String sellSpotDisplayValue;
  @JsonKey(nullable: true, name: 'sell_spot_time')
  int sellSpotTime;
  @JsonKey(nullable: true, name: 'sell_time')
  int sellTime;
  @JsonKey(nullable: true, name: 'shortcode')
  String shortcode;
  @JsonKey(nullable: true, name: 'status')
  String status;
  @JsonKey(nullable: true, name: 'transaction_ids')
  TransactionIds transactionIds;
  @JsonKey(nullable: true, name: 'underlying')
  String underlying;
  @JsonKey(nullable: true, name: 'validation_error')
  String validationError;


  ProposalOpenContract(this.auditDetails, this.barrier, this.barrierCount,
      this.bidPrice, this.buyPrice, this.contractId, this.contractType,
      this.currency, this.currentSpot, this.currentSpotDisplayValue,
      this.currentSpotTime, this.dateExpiry, this.dateSettlement,
      this.dateStart, this.displayName, this.entrySpot,
      this.entrySpotDisplayValue, this.entryTick, this.entryTickDisplayValue,
      this.entryTickTime, this.exitTick, this.exitTickDisplayValue,
      this.exitTickTime, this.isExpired, this.isForwardStarting,
      this.isIntraday, this.isPathDependent, this.isSettleable, this.isSold,
      this.isValidToSell, this.longcode, this.payout, this.profit,
      this.profitPercentage, this.purchaseTime, this.sellPrice, this.sellSpot,
      this.sellSpotDisplayValue, this.sellSpotTime, this.sellTime,
      this.shortcode, this.status, this.transactionIds, this.underlying,
      this.validationError);

  factory ProposalOpenContract.fromJson(Map<String, dynamic> json) => _$ProposalOpenContractFromJson(json);
  Map<String, dynamic> toJson() => _$ProposalOpenContractToJson(this);

}

@JsonSerializable(explicitToJson: true)
class AuditDetails {

  @JsonKey(nullable: true, name: 'contract_end')
  List<ContractEnd> contractEnd;
  @JsonKey(nullable: true, name: 'contract_start')
  List<ContractStart> contractStart;


  AuditDetails(this.contractEnd, this.contractStart);

  factory AuditDetails.fromJson(Map<String, dynamic> json) => _$AuditDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$AuditDetailsToJson(this);

}

@JsonSerializable(explicitToJson: true)
class ContractEnd {

  @JsonKey(nullable: true, name: 'epoch')
  int epoch;
  @JsonKey(nullable: true, name: 'tick')
  double tick;
  @JsonKey(nullable: true, name: 'tick_display_value')
  String tickDisplayValue;


  ContractEnd(this.epoch, this.tick, this.tickDisplayValue);

  factory ContractEnd.fromJson(Map<String, dynamic> json) => _$ContractEndFromJson(json);
  Map<String, dynamic> toJson() => _$ContractEndToJson(this);

}

@JsonSerializable(explicitToJson: true)
class ContractStart {

  @JsonKey(nullable: true, name: 'epoch')
  int epoch;
  @JsonKey(nullable: true, name: 'tick')
  double tick;
  @JsonKey(nullable: true, name: 'tick_display_value')
  String tickDisplayValue;


  ContractStart(this.epoch, this.tick, this.tickDisplayValue);

  factory ContractStart.fromJson(Map<String, dynamic> json) => _$ContractStartFromJson(json);
  Map<String, dynamic> toJson() => _$ContractStartToJson(this);

}

@JsonSerializable(explicitToJson: true)
class TransactionIds {
  @JsonKey(nullable: true, name: 'buy')
  int buy;
  @JsonKey(nullable: true, name: 'sell')
  int sell;

  TransactionIds(this.buy, this.sell);

  factory TransactionIds.fromJson(Map<String, dynamic> json) => _$TransactionIdsFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionIdsToJson(this);
}
