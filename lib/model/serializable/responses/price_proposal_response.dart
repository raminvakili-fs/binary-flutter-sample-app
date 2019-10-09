library price_proposal_response;

import 'dart:convert';

import 'package:binary_mobile_app/model/serializable/responses/response_base.dart' as prefix0;
import 'package:json_annotation/json_annotation.dart';

import 'response_base.dart';


part 'price_proposal_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PriceProposalResponse extends ResponseBase{

  @JsonKey(name: 'proposal', nullable: true)
  final Proposal proposal;
  @JsonKey(name: 'subscription', nullable: true)
  final Subscription subscription;

  PriceProposalResponse({Error error, String msgType, int reqId, this.proposal, this.subscription}) : super(error: error, msgType: msgType, reqId: reqId);

  factory PriceProposalResponse.fromJson(Map<String, dynamic> json) => _$PriceProposalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PriceProposalResponseToJson(this);
}

@JsonSerializable()
class Proposal {

  @JsonKey(name: 'ask_price')
  double askPrice;
  @JsonKey(name: 'multiplier')
  int multiplier;
  @JsonKey(name: 'date_start')
  int dateStart;
  @JsonKey(name: 'display_value')
  String displayValue;
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'longcode')
  String longcode;
  @JsonKey(name: 'payout')
  double payout;
  @JsonKey(name: 'spot')
  double spot;
  @JsonKey(name: 'spot_time')
  int spotTime;


  Proposal({this.askPrice, this.multiplier, this.dateStart, this.displayValue,
      this.id, this.longcode, this.payout, this.spot, this.spotTime});

  factory Proposal.fromJson(Map<String, dynamic> json) => _$ProposalFromJson(json);
  Map<String, dynamic> toJson() => _$ProposalToJson(this);

}

@JsonSerializable()
class Subscription {
  @JsonKey(name: 'id')
  String id;

  Subscription({this.id});

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);

}
