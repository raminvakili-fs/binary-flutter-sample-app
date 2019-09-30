library price_proposal_request;

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'request_base.dart';

part 'price_proposal_request.g.dart';

@JsonSerializable(explicitToJson: true)
class PriceProposalRequest
    extends RequestBase {

  @JsonKey(includeIfNull: false, name: 'subscribe', nullable: true)
  final int subscribe;
  @JsonKey(includeIfNull: false, name: 'trading_period_start', nullable: true)
  final int tradingPeriodStart;
  @JsonKey(includeIfNull: false, name: 'selected_tick', nullable: true)
  final int selectedTick;
  @JsonKey(includeIfNull: false, name: 'date_expiry', nullable: true)
  final int dateExpiry;
  @JsonKey(includeIfNull: false, name: 'date_start', nullable: true)
  final int dateStart;
  @JsonKey(includeIfNull: false, name: 'proposal', nullable: true)
  final int proposal;
  @JsonKey(includeIfNull: false, name: 'amount', nullable: true)
  final int amount;
  @JsonKey(includeIfNull: false, name: 'basis', nullable: true)
  final String basis;
  @JsonKey(includeIfNull: false, name: 'contract_type', nullable: true)
  final String contractType;
  @JsonKey(includeIfNull: false, name: 'currency', nullable: true)
  final String currency;
  @JsonKey(includeIfNull: false, name: 'duration', nullable: true)
  final int duration;
  @JsonKey(includeIfNull: false, name: 'duration_unit', nullable: true)
  final String durationUnit;
  @JsonKey(includeIfNull: false, name: 'barrier', nullable: true)
  final String barrier;
  @JsonKey(includeIfNull: false, name: 'barrier2', nullable: true)
  final String barrier2;
  @JsonKey(includeIfNull: false, name: 'symbol', nullable: true)
  final String symbol;
  @JsonKey(includeIfNull: false, name: 'product_type', nullable: true)
  final String productType;
  @JsonKey(includeIfNull: false, name: 'multiplier', nullable: true)
  final int multiplier;

  PriceProposalRequest(int reqId, {this.subscribe, this.tradingPeriodStart, this.selectedTick, this.dateExpiry, this.dateStart, this.proposal, this.amount, this.basis, this.contractType, this.currency, this.duration, this.durationUnit, this.barrier, this.barrier2, this.symbol, this.productType, this.multiplier}) : super(reqId);

  factory PriceProposalRequest.fromJson(Map<String, dynamic> json) => _$PriceProposalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PriceProposalRequestToJson(this);

}
